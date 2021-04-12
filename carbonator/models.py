from django.db import models

# Create your models here.
# class CostPerKwh(models.Model):
#     money = models.DecimalField(max_digits=4, decimal_places=2)
#     carbon = models.DecimalField(max_digits=4, decimal_places=2)
#     trees = models.DecimalField(max_digits=4, decimal_places=4)
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
