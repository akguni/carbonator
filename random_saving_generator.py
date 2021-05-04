# define method to select a random user


from random import randint

# call this function with generateSavings()

def generateSavings():
    for i in range(100):
        user = User.objects.random()
        appliance = Appliance.objects.random()
        saving = Saving(
            saver=user,
            appliance=appliance,
            energySaved= appliance.watts * (appliance.typicalDuration) / 60 * randint(1,3)
        )
        saving.save()



# add this to models.py

from django.db.models.aggregates import Count
from random import randint

class UsersManager(models.Manager):
    def random(self):
        count = self.aggregate(count=Count('id'))['count']
        random_index = randint(0, count - 1)
        return self.all()[random_index]

class User(AbstractUser):
    objects = UsersManager()




class ApplianceManager(models.Manager):
    def random(self):
        count = self.aggregate(count=Count('id'))['count']
        random_index = randint(0, count - 1)
        return self.all()[random_index]

class Appliance(models.Model):
    objects = ApplianceManager()
