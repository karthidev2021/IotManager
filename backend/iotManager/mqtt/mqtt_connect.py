import paho.mqtt.client as paho
from paho import mqtt

from django.conf import settings
import json

def on_connect(mqtt_client, userdata, flags, rc):
    if rc == 0:
        print('Connected successfully')

        from mqtt.models import Device

        #susbcribe all the registered devices with qos=2
        mqtt_client.subscribe([(device[0],2) for device in Device.objects.all().values_list('id')])
        # mqtt_client.subscribe([(str(device[0])+"/command",2) for device in Device.objects.all().values_list('id')])
        # print([device for device in models.Device.objects.all().values_list('id')])
    else:
        print('Bad connection. Code:', rc)

def on_message(mqtt_client, userdata, msg):
    print(f'Received message on topic: {msg.topic} with payload: {msg.payload}')
 
    from mqtt.models import Device,SensorData
    device=Device.objects.get(id=msg.topic)
    deviceSensorData=SensorData(deviceId=device)
    jsonData=json.loads(msg.payload)        #byte data to json
    print(jsonData)
    deviceSensorData.AtmosphericHumidity=jsonData['ah']
    deviceSensorData.AtmosphericTemperature=jsonData['at']
    deviceSensorData.SoilHumidity=jsonData['sh']
    deviceSensorData.SoilTemperature=jsonData['st']
    deviceSensorData.save()

def publish(device,command,value):
    device+="/command"      #topic: <device_id>/command
    sendData={
        'command':command,
        'value':value
    }
    client.publish(topic=device,payload=json.dumps(sendData),qos=2)
 

client=paho.Client()
client.tls_set(tls_version=mqtt.client.ssl.PROTOCOL_TLS)

client.on_connect=on_connect
client.on_message=on_message
client.username_pw_set(settings.MQTT_USER, settings.MQTT_PASSWORD)
client.connect(
    host=settings.MQTT_SERVER,
    port=settings.MQTT_PORT,
    keepalive=settings.MQTT_KEEPALIVE
)