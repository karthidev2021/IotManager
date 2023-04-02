from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Device(models.Model):
    id=models.CharField(primary_key=True,max_length=15)
    user=models.ForeignKey(User,on_delete=models.CASCADE,default=None)
    registeredAt=models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.id
    

class SensorData(models.Model):
    deviceId=models.ForeignKey(Device,on_delete=models.CASCADE,null=True)
    AtmosphericHumidity=models.FloatField()
    AtmosphericTemperature=models.FloatField()
    SoilHumidity=models.FloatField()
    SoilTemperature=models.FloatField()
    createdAt=models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.deviceId)

class DeviceControlActivity(models.Model):
    deviceId=models.ForeignKey(Device,on_delete=models.CASCADE)
    motorStatus=models.BooleanField()
    createdAt=models.DateTimeField(auto_now_add=True)