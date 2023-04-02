from django.urls import path
from mqtt import views

urlpatterns=[
    path("sendCmd/",views.sendCommand),
]