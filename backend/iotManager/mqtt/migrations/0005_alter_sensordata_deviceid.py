# Generated by Django 4.1.7 on 2023-04-01 16:34

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('mqtt', '0004_sensordata'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sensordata',
            name='deviceId',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='mqtt.device'),
        ),
    ]
