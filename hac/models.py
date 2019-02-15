from django.db import models
from django.contrib.auth.models import User

class Profile (models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE)
	nim = models.CharField(max_length=10, db_index=True, unique=True)
	name = models.CharField(max_length=200)	#set db_index=True

class Card (models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
	card_uid = models.CharField(max_length=8, db_index=True, unique=True)

class Machine_type (models.Model):
	machine_type_name = models.CharField(max_length=200, db_index=True, unique=True)

class Certification (models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	machine_type = models.ForeignKey(Machine_type, on_delete=models.CASCADE)

class Machine (models.Model):
	machine_type = models.ForeignKey(Machine_type,on_delete=models.CASCADE)
	machine_name = models.CharField(max_length=200)

class Tap (models.Model):
	card = models.ForeignKey(Card, on_delete=models.DO_NOTHING)
	machine = models.ForeignKey(Machine, on_delete=models.DO_NOTHING)
	tap_time = models.DateTimeField()
	power_usage = models.IntegerField(null=True, blank=True)

class Usage (models.Model):
	card = models.ForeignKey(Card, on_delete=models.DO_NOTHING)
	machine = models.ForeignKey(Machine, on_delete=models.DO_NOTHING)
	start_time = models.DateTimeField()
	end_time = models.DateTimeField()
	total_usage = models.IntegerField()