# Generated by Django 2.1.8 on 2019-04-10 08:26

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('machines', '0001_initial'),
        ('usages', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='DailyUsage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(db_index=True)),
                ('total_usage', models.IntegerField(default=0)),
                ('total_time', models.DurationField(default=0)),
                ('machine_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='machines.Machine_type')),
            ],
        ),
    ]
