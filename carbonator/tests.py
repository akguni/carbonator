from django.test import Client, TestCase

# Create your tests here.

from .models import User, Appliance, Saving, Cost

class SavingTestCase(TestCase):
    def setUp(self):
        print("setUpTestData:")
        # Create appliances
        app1 = Appliance.objects.create( name = "Game Console",  watts = 300, typicalDuration = 30)
        app2 = Appliance.objects.create(name = "Synthesizer", watts = 50, typicalDuration = 90)
        # Create users
        usr1 = User.objects.create(username = "john")
        usr2 = User.objects.create(username = "jane")
        # Create Savings
        svg1 = Saving.objects.create(saver = usr1, appliance = app1, energySaved = 0.45)
        svg2 = Saving.objects.create(saver = usr1, appliance = app1, energySaved = 0.90)
        svg3 = Saving.objects.create(saver = usr1, appliance = app2, energySaved = 0.10)
        svg4 = Saving.objects.create(saver = usr2, appliance = app2, energySaved = 0.05)

    def test_savings_count(self):
        s = Saving.objects.filter(saver__username = "john")
        self.assertEqual(s.count(), 3)
    
    def test_valid_saving(self):
        usr = User.objects.get(username = "john")
        app = Appliance.objects.get(name = "Synthesizer")
        svg = Saving.objects.create(saver = usr, appliance = app, energySaved = 5)
        return self.assertFalse(svg.is_valid_saving())

    def test_index(self):
        c = Client()
        response = c.get("/")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(response.context["appliances"]), 2)

    def test_profile(self):
        c = Client()
        user = User.objects.get(username = "john")
        c.force_login(user = user)
        response = c.get("/profile")
        self.assertEqual(response.status_code, 200)

    def test_hall_of_fame(self):
        c = Client()
        user = User.objects.get(username = "john")
        c.force_login(user = user)
        response = c.get("/halloffame")
    