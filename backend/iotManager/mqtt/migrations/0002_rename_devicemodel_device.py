# Generated by Django 4.1.7 on 2023-04-01 15:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mqtt', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='DeviceModel',
            new_name='Device',
        ),
    ]
