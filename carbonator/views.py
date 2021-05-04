from django.contrib.auth import authenticate, default_app_config, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.db import IntegrityError
from django.db.models import Q, Sum
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.urls import reverse

from django.views.decorators.csrf import csrf_exempt

from django.shortcuts import redirect, render
import json
import time 
from .models import Appliance, Saving, User, Cost

# Create your views here.

def index(request):
    costs = setting_check(request.user)
    # costs = {'cents': 0.315, 'co2e': 400, 'trees': 10}
    appliances = Appliance.objects.all()
    appliances = [appliance.serialize() for appliance in appliances]
    return render(request, "carbonator/index.html", {
        "appliances": appliances,
        "costs": costs,
    })


@login_required
def profile(request):
    savings = Saving.objects.filter(saver=request.user).exclude(deleteFlag=True)
    total_saving = savings.aggregate(Sum('energySaved'))

    return render(request, "carbonator/profile.html", {
        "savings": savings,
        "total_saving": total_saving,
    })

def savings(request):

    savings = Saving.objects.filter(saver=request.user)

    # clean up records flagged for deletion
    savings.filter(deleteFlag=True).delete()
    numberSavings = len(savings)
 

    # Get start and end points
    start = int(request.GET.get("start"))
    end = int(request.GET.get("end")) + 1

    savings = savings.order_by('-energySaved')[start:end]
    savings = [saving.serialize() for saving in savings]
    
    return JsonResponse({
        "savings": savings,
        "numberSavings": numberSavings,
    })


def halloffame(request):

    savings = Saving.objects.exclude(deleteFlag__exact=True) 
    halloffame = User.objects.exclude(is_superuser=True).annotate(totalSaved=Sum('savings__energySaved', filter=Q(savings__deleteFlag__exact=False))).order_by('-totalSaved')

    return render(request, "carbonator/halloffame.html", {
        "halloffame": halloffame,
    })


@login_required
def bank(request):
    if request.method == "POST":
        form = request.POST
        kwh = float(form["consumption"]) * float(form["duration"])
        saving = Saving(
            saver=request.user,
            appliance=Appliance.objects.get(id=form["appliance"]),
            energySaved=kwh
        )
        saving.save()
        return redirect('index')

@csrf_exempt
def delete(request, id):
    if request.method != "PUT":
        return JsonResponse({"error": "PUT request required."}, status=400)
    
    saving = Saving.objects.get(id=id)
    saving.deleteFlag = True
    saving.save()

    savings = Saving.objects.filter(saver= request.user).exclude(deleteFlag__exact=True)
    total_saving = savings.aggregate(Sum('energySaved'))

    return JsonResponse({
        "id": id,
        "total_saving": total_saving,
        })


@csrf_exempt
def undo(request, id):    
    saving = Saving.objects.get(id=id)
    saving.deleteFlag = False
    saving.save()

    return redirect('profile')


@csrf_exempt
@login_required
def settings(request):
    if request.method != "POST":
        settings = setting_check(request.user)
        return render(request, "carbonator/settings.html", {
            "settings": settings
        })
    
    settings = Cost.objects.get(user=request.user)
    
    if settings is None:
        settings.user = request.user

    settings.money = float(request.POST["money"])
    settings.moneyUnit = request.POST["money-unit"]
    settings.co2e = float(request.POST["co2e"])
    settings.trees = float(request.POST["trees"])
    settings.save()

    return render(request, "carbonator/settings.html", {
            "settings": settings
        })

def setting_check(user):

    if user.is_authenticated:
        costs = Cost.objects.filter(user=user)
        if costs.count() == 1:
            settings = costs[0].serialize()
            return settings

    settings = {
        'money': 0.315,
        'moneyUnit': 'Euro',
        'co2e': 400,
        'trees': 10
    }
    
    return settings

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
        # return HttpResponseRedirect(reverse("index"))
        return redirect('index')
    else:
        return render(request, "carbonator/register.html")