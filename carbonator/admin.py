from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User, Appliance, Saving, Cost



# Register your models here.
admin.site.register(User, UserAdmin)
admin.site.register(Appliance)
admin.site.register(Saving)
admin.site.register(Cost)