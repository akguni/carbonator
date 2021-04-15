from carbonator.models import Appliance
from django.shortcuts import render
import json

from .models import Appliance

# Create your views here.

def index(request):
    costs = {'cents': 0.315, 'co2e': 400, 'trees': 10}
    appliances = Appliance.objects.all()
    appliances = [appliance.serialize() for appliance in appliances]
    return render(request, "carbonator/index.html", {
        "appliances": appliances,
        "costs": costs,
    })
