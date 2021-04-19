from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.deletion import CASCADE
class User(AbstractUser):
    pass
class Appliance(models.Model):
    name = models.CharField(max_length=64)
    watts = models.DecimalField(max_digits=6, decimal_places=2)
    typicalDuration = models.IntegerField()

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "watts": self.watts,
            "typicalDuration": self.typicalDuration
        }

class Saving(models.Model):
    saver = models.ForeignKey("User", on_delete=models.CASCADE, related_name="savings")
    timestamp=models.DateTimeField(auto_now_add=True)
    appliance=models.ForeignKey("Appliance", on_delete=models.PROTECT)
    energySaved=models.DecimalField(max_digits=6, decimal_places=2)

    def serialize(self):
        return {
            "id": self.id,
            "saver": self.saver,
            "timestamp": self.timestamp.strftime("%b %-d %Y, %-I:%M %p"),
            "appliance": self.appliance,
            "energySaved": self.energySaved
        }