from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic
from django.contrib.auth.models import User
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login, authenticate
from django.shortcuts import redirect
from django.contrib.auth.hashers import make_password


from . models import Profile
from . forms import UserForm, UserUpdateForm, ProfileForm
from apps.certifications.models import Certification
from apps.machines.models import Machine_type


class IndexView(LoginRequiredMixin, generic.ListView):
	template_name = 'accounts/accounts_list.html'
	context_object_name = 'accounts_list'
	
	def get_queryset(self):
		return Profile.objects.select_related('user')

class LoginView(generic.ListView):
	template_name = 'accounts/accounts_login.html'
	context_object_name = 'accounts_login'

	def get_queryset(self):
		return Profile.objects.select_related('user')

class DetailView(LoginRequiredMixin, generic.DetailView): 
	template_name = 'accounts/accounts_detail.html'
	context_object_name = 'account'
	def get_context_data(self, **kwargs):
		context = super(DetailView, self).get_context_data(**kwargs)
		# context['certification_list'] = Certification.objects.all()
		context['certification_list'] = {}
		machine_types = Machine_type.objects.all()
		for machine_type in machine_types:
			if Certification.objects.filter(user = self.object.user_id ,machine_type = machine_type).exists():
				context['certification_list'][machine_type.machine_type_name] = True
			else:
				context['certification_list'][machine_type.machine_type_name] = False
		return context
	
	def get_queryset(self):
		return Profile.objects.select_related('user')		

@login_required
def UserCreate(request):
	if request.method == 'POST':
		user_form = UserForm(request.POST)
		profile_form = ProfileForm(request.POST)
		if user_form.is_valid() and profile_form.is_valid():
			
			user = user_form.save()
			user.refresh_from_db()
			user.password = make_password(user_form.cleaned_data.get('password'))
			user.profile.name = profile_form.cleaned_data.get('name')
			user.profile.nim = profile_form.cleaned_data.get('nim')
			user.save()
			return redirect('accounts:index')
	else:
		user_form = UserForm()
		profile_form = ProfileForm()
	return render(request, 'accounts/accounts_signup.html', {
		'user_form': user_form,
		'profile_form': profile_form
	})

@login_required
@transaction.atomic
def UserUpdate(request, pk):
	user = User.objects.get(pk=pk)
	if request.method == 'POST':
		user_form = UserUpdateForm(request.POST, instance=user)
		profile_form = ProfileForm(request.POST, instance=user.profile)
		if user_form.is_valid() and profile_form.is_valid():
			user_form.save()
			profile_form.save()
			return redirect('accounts:index')
		else:
			messages.error(request, _('Please correct the error below.'))
	else:
		user_form = UserUpdateForm(instance=user)
		profile_form = ProfileForm(instance=user.profile)
	return render(request, 'accounts/accounts_form.html', {
		'user_form': user_form,
		'profile_form': profile_form
	})

# @login_required
# @transaction.atomic
# def UserUpdate(request):
# 	if request.method == 'POST':
# 		user_form = UserForm(request.POST, instance=request.user)
# 		profile_form = ProfileForm(request.POST, instance=request.user.profile)
# 		if user_form.is_valid() and profile_form.is_valid():
# 			user_form.save()
# 			profile_form.save()
# 			# messages.success(request, _('Your profile was successfully updated!'))
# 			return redirect('accounts:index')
# 		else:
# 			messages.error(request, _('Please correct the error below.'))
# 	else:
# 		user_form = UserForm(instance=request.user)
# 		profile_form = ProfileForm(instance=request.user.profile)
# 	return render(request, 'accounts/accounts_form.html', {
# 		'user_form': user_form,
# 		'profile_form': profile_form
# 	})