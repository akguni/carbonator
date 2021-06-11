from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.db import IntegrityError
from django.db.models import Q, Sum, F
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.urls import reverse

from django.views.decorators.csrf import csrf_exempt

from django.shortcuts import redirect, render
import json
import random
import time 
from .models import Appliance, Saving, User, Cost

# Create your views here.


def index(request):
    costs = setting_check(request.user)
    appliances = Appliance.objects.all()
    appliances = [appliance.serialize() for appliance in appliances]
    return render(request, "carbonator/index.html", {
        "appliances": appliances,
        "costs": costs,
    })


@login_required
def profile(request):
    total_saving, rank, total_users = savingtotals(request)
    return render(request, "carbonator/profile.html", {
        "savings": savings,
        "total_saving": total_saving,
        "rank": rank,
        "total_users": total_users,
    })


def delete(request, id):
    if request.method != "PUT":
        return JsonResponse({"error": "PUT request required."}, status=400)
    
    saving = Saving.objects.get(id=id)
    saving.deleteFlag = True
    saving.save()

    total_saving, rank, total_users = savingtotals(request)
    return JsonResponse({
        "id": id,
        "total_saving": total_saving,
        "rank": rank,
        "total_users": total_users,
        })

# separate function to calculate total savings rank and total user numbers
# these values are used for both profile and delete routes
# in order to avoid duplication, separated the calculations as a separate function
def savingtotals(request):
    allsavings = Saving.objects.exclude(deleteFlag=True).values('saver').annotate(sum=Sum('energySaved'))
    try:
        total_saving = allsavings.get(saver=request.user)['sum']
    except Saving.DoesNotExist:
        total_saving = 0
    rank = allsavings.filter(sum__gt=total_saving).count() + 1
    total_users = User.objects.count() - 1
    return total_saving, rank, total_users

def undo(request, id):    
    saving = Saving.objects.get(id=id)
    saving.deleteFlag = False
    saving.save()

    return redirect('profile')


@login_required
def bank(request):
    if request.method == "POST":
        data = json.loads(request.body)
        kWh = data.get("kWh")
        appliance = data.get("appliance")
        saving = Saving(
            saver=request.user,
            appliance=Appliance.objects.get(id=appliance),
            energySaved=kWh
        )
        saving.save()
    
    periods = [
        ["", "a day", 1],
        ["", "a week", 7],
        ["", "a month", 30],
        ["every ", "three months", 92],
        ["every ", "six months", 182],
        ["", "one year", 365]    
    ]
    
    kWh  = float(kWh)


    # If the saving is small, express it in Wh rather than kWh
    if kWh < 1:
        multiplier = 1000
        energy = kWh * 1000
        energy_unit = "Wh"
    else:
        multiplier = 1
        energy = kWh
        energy_unit = "kWh"                

    # Build a random motivational message based on the saving
    frequency_index = random.randint(0, len(periods) - 3)
    duration_index = random.randint(frequency_index + 1, len(periods) - 1)

    total_kWh = (periods[duration_index][2] / periods[frequency_index][2]) * kWh
    energy = kWh * multiplier
    total_energy = total_kWh * multiplier

    costs = setting_check(request.user)['user']

    total_money = total_kWh * float(costs['money'])
    money_unit = costs['moneyUnit']
    total_co2e = total_kWh * float(costs['co2e'])
    total_trees = total_kWh * float(costs['trees'])
    

    watt = f"you will save {total_energy:.0f} {energy_unit} in total"

    co2e = (total_co2e >= 1) * (
        f"you will avoid {total_co2e:.0f} kg of CO\u2082 emissions to the atmosphere"
    )

    impact = random.choice([watt, co2e]) if total_co2e>=1 else watt

    tree = (
        (total_trees >= 1) * (
        f", which has the same effect as planting {total_trees:.1f} trees"
        )
        +(total_trees < 1 and total_trees > .01 and random.random() > 0.50) * (
        f", which would have the same effect as planting a tree if {(1/total_trees - 1):.0f} other people who care about the future of our planet also did the same"
        )
        +f"."
    )
    
    money = (total_money >= 1) * (
        f"\n\nYou will also end up with an extra {total_money:.2f} {money_unit} "
        +f"for your household to spend on something else."
    )

    motivator = (
        f"Thank you {request.user.username}. You have just saved {energy:.2f} {energy_unit} of energy."
        +f"\n\nIf you can do this once {periods[frequency_index][0]}{periods[frequency_index][1]} "
        +f"for {periods[duration_index][1]}, "
    )

    motivator += impact + tree + money
    
    return JsonResponse({'motivator': motivator})


def savings(request):
  
    savings = Saving.objects.filter(saver=request.user)

    # clean up records flagged for deletion
    savings.filter(deleteFlag=True).delete()
    numberSavings = len(savings)
 
    # Get start and end points for the savings to be handed over to the page
    start = int(request.GET.get("start"))
    end = int(request.GET.get("end")) + 1

    savings = savings.order_by('-timestamp')[start:end]
    savings = [saving.serialize() for saving in savings]
    
    return JsonResponse({
        "savings": savings,
        "numberSavings": numberSavings,
    })


# Present the top 10 savers in decreasing order 
def halloffame(request):
    halloffame = User.objects.exclude(is_superuser=True).annotate(totalSaved=Sum('savings__energySaved', filter=Q(savings__deleteFlag__exact=False))).order_by(F('totalSaved').desc(nulls_last=True))[:10]

    return render(request, "carbonator/halloffame.html", {
        "halloffame": halloffame,
    })

@login_required
def settings(request):
    if request.method != "POST":
        settings = setting_check(request.user)
        return render(request, "carbonator/settings.html", {
            "settings": settings
        })
    
    try:
        settings = Cost.objects.get(user=request.user)

    except Cost.DoesNotExist:
        settings = []
        settings.user = request.user

    settings.money = float(request.POST["money"])
    settings.moneyUnit = request.POST["money-unit"]
    settings.co2e = float(request.POST["co2e"])
    settings.trees = float(request.POST["trees"])
    settings.save()
    settings = setting_check(request.user)
    return render(request, "carbonator/settings.html", {
            "settings": settings
        })


def setting_check(user):

    # default values for carbon footprint calculations
    settings = {'default': {
        'money': 0.315,
        'moneyUnit': 'Euro',
        'co2e': 0.40,
        'trees': 25e-4
        }        
    }

    settings['user'] = settings['default']
    if user.is_authenticated:
        costs = Cost.objects.filter(user=user)
        if costs.count() == 1:
            settings['user'] = costs[0].serialize()
    
    return settings


def about(request):
    return render(request, "carbonator/about.html")

def disclaimer(request):
    return render(request, "carbonator/disclaimer.html")

# login, logout and register functions below this line
def login_view(request):
    if request.method == "POST":

        # Attempt to sign user in
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(request, username=username, password=password)

        # Check if authentication successful
        if user is not None:
            login(request, user)
            return HttpResponseRedirect(reverse("index"))

        else:
            return render(request, "carbonator/login.html", {
                "message": "Invalid username and/or password."
            })
    else:
        return render(request, "carbonator/login.html")

def logout_view(request):
    logout(request)
    return redirect('index')

def register(request):
    if request.method == "POST":
        username = request.POST["username"]
        email = request.POST["email"]

        # Ensure password matches confirmation
        password = request.POST["password"]
        confirmation = request.POST["confirmation"]
        if password != confirmation:
            return render(request, "carbonator/register.html", {
                "message": "Passwords must match."
            })

        # Attempt to create new user
        try:
            user = User.objects.create_user(username, email, password)
            user.save()
        except IntegrityError:
            return render(request, "carbonator/register.html", {
                "message": "Username already taken."
            })
        login(request, user)
        return redirect('index')
    else:
        return render(request, "carbonator/register.html")
        