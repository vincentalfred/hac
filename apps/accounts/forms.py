from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from . models import Profile

class UserForm(forms.ModelForm):
	class Meta:
		model = User
		fields = ('email','password', 'username', 'is_staff')

class UserUpdateForm(forms.ModelForm):
	class Meta:
		model = User
		fields = ('email', 'username', 'is_staff')

class ProfileForm(forms.ModelForm):
	class Meta:
		model = Profile
		fields = ('name', 'nim')

class SelfUserForm(forms.ModelForm):
	class Meta:
		model = User
		fields = ('email','password', 'username')