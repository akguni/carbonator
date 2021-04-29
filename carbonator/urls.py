from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name ="index"),
    path("login", views.login_view, name="login"),
    path("logout", views.logout_view, name="logout"),
    path("register", views.register, name="register"),
    path("profile", views.profile, name="profile"),
    path("bank", views.bank, name="bank"),
    path("savings", views.savings, name="savings"),
    path("delete/<int:id>", views.delete, name="delete"),
    path("undo/<int:id>", views.undo, name="undo"),
]