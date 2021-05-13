from django.test import Client, TestCase
from django.contrib.staticfiles.testing import StaticLiveServerTestCase
from selenium import webdriver
from selenium.webdriver.support.ui import Select
from selenium.webdriver.firefox.options import Options
# Create your tests here.

from .models import User, Appliance, Saving

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

class SeleniumTestCase(StaticLiveServerTestCase):

    @classmethod
    def setUpClass(cls):
        super().setUpClass()
        options = Options()
        options.set_headless(True)
        cls.selenium = webdriver.Firefox(firefox_options=options, firefox_binary="'/usr/bin/firefox")
        cls.selenium.implicitly_wait(10)

    @classmethod
    def tearDownClass(cls):
        cls.selenium.quit()
        super().tearDownClass()

    def register(self, username="someuser", password="somepassword"):
        self.selenium.get('%s%s' % (self.live_server_url, '/register'))
        username_input = self.selenium.find_element_by_name("username")
        username_input.send_keys(username)
        password_input = self.selenium.find_element_by_name("password")
        password_input.send_keys(password)
        password_input = self.selenium.find_element_by_name("confirmation")
        password_input.send_keys(password)
        self.selenium.find_element_by_xpath('//input[@value="Register"]').click()

    def create_appliances(self):
        kettle = Appliance(name = "Kettle", watts = 2400, typicalDuration = 4)
        kettle.save()

    def test_calculator(self):
        self.register()
        self.create_appliances()
        self.selenium.get(self.live_server_url)
        appliance_selection = Select(self.selenium.find_element_by_name("appliance"))
        appliance_selection.select_by_visible_text("Kettle")
        duration_input = self.selenium.find_element_by_name("duration")
        duration_input.clear()
        duration_input.send_keys("10")
        self.selenium.find_element_by_xpath('//input[@value="Bank!"]').click()
        motivator_text = self.selenium.find_element_by_id("system-message").text
        validation_text = "You have just saved 400.00 Wh of energy."
        self.assertIn(validation_text, motivator_text)