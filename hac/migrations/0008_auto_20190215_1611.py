# Generated by Django 2.1.7 on 2019-02-15 09:11

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('hac', '0007_usage'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='usage',
            name='user',
        ),
        migrations.DeleteModel(
            name='Usage',
        ),
    ]
