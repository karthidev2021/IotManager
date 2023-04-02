from django.shortcuts import render
from django.http import JsonResponse
from mqtt import mqtt_connect
import json

# Create your views here.
def sendCommand(request):
    print(request.body)
    data=json.loads(request.body)
    print(data)
    mqtt_connect.publish(data['deviceId'],data['command'],data['value'])
    response={
        'status':"ok"
    }
    return JsonResponse(response)