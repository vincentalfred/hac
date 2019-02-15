from django.db import models
from django.contrib.auth.models import User

class Profile (models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE)
	nim = models.CharField(max_length=10, db_index=True, unique=True)
	name = models.CharField(max_length=200)	#set db_index=True

class Card (models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
	card_uid = models.CharField(max_length=8, db_index=True, unique=True)
	


