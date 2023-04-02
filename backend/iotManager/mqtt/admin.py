from django.contrib import admin
from mqtt import models

# Register your models here.



class DeviceAdminView(admin.ModelAdmin):
    list_display=('id','user','registeredAt')


class SensorDataAdminView(admin.ModelAdmin):

    list_display=('id',
                  'deviceId',
                  'AtmosphericHumidity',
                  'AtmosphericTemperature',
                  'SoilHumidity',
                  'SoilTemperature',
                  'createdAt')
    
class DeviceControlActivity(admin.ModelAdmin):
    list_display=('id',
                  'deviceId',
                  'motorStatus',
                  'createdAt')

admin.site.register(models.Device,DeviceAdminView)
admin.site.register(models.SensorData,SensorDataAdminView)
admin.site.register(models.DeviceControlActivity,DeviceControlActivity)