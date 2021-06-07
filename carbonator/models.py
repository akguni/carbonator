from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.deletion import CASCADE

class User(AbstractUser):
    pass

class Appliance(models.Model):
    name = models.CharField(max_length=64)
    watts = models.DecimalField(max_digits=6, decimal_places=2)
    typicalDuration = models.IntegerField()

    def __str__(self):
        return f"{self.name} {self.watts} w {self.typicalDuration} min"

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "watts": self.watts,
            "typicalDuration": self.typicalDuration
        }

class Saving(models.Model):
    saver = models.ForeignKey("User", on_delete=models.CASCADE, related_name="savings")
    timestamp = models.DateTimeField(auto_now_add=True)
    appliance = models.ForeignKey("Appliance", on_delete=models.CASCADE)
    energySaved = models.DecimalField(max_digits=12, decimal_places=2)
    deleteFlag = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.energySaved} kwh on {self.timestamp} {self.appliance.name}"

    def serialize(self):
        return {
            "id": self.id,
            "saver": self.saver.id,
            "timestamp": self.timestamp.strftime("%b %-d %Y, %-I:%M %p"),
            "appliance": self.appliance.name,
            "energySaved": self.energySaved,
            "deleteFlag": self.deleteFlag
        }

    def is_valid_saving(self):
        return self.energySaved <= (self.appliance.watts/1000 * 24)
class Cost(models.Model):
    user = models.OneToOneField("User", on_delete=models.CASCADE, related_name="costs")
    money = models.DecimalField(max_digits=8, decimal_places=4)
    moneyUnit = models.CharField(max_length=16)
    co2e = models.DecimalField(max_digits=12, decimal_places=2)
    trees = models.DecimalField(max_digits=10, decimal_places=4)

    def serialize(self):
        return {
            "user": self.user.id,            
            "money": self.money,
            "moneyUnit": self.moneyUnit,
            "co2e": self.co2e,
            "trees": self.trees,
        }