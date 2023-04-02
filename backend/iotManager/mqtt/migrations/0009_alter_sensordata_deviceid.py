# Generated by Django 4.1.7 on 2023-04-01 16:50

from django.db import migrations, models
import mqtt.models


class Migration(migrations.Migration):

    dependencies = [
        ('mqtt', '0008_alter_sensordata_deviceid'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sensordata',
            name='deviceId',
            field=models.ForeignKey(null=True, on_delete=models.SET(mqtt.models.Device), to='mqtt.device'),
        ),
    ]
