# Generated by Django 4.1.7 on 2023-04-01 15:41

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='DeviceModel',
            fields=[
                ('id', models.CharField(max_length=15, primary_key=True, serialize=False)),
                ('registeredAt', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]
