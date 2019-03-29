from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic
from django.contrib.auth.models import User

from . models import Profile
from apps.certifications.models import Certification
from apps.machines.models import Machine_type


# class IndexView(generic.ListView):
# 	template_name = 'usages/index.html'
# 	context_object_name = ''

# 	def get_queryset(self):
# 		return Usages

class IndexView(generic.ListView):
	template_name = 'accounts/accounts_list.html'
	context_object_name = 'accounts_list'
	
	def get_queryset(self):
		return Profile.objects.select_related('user')

class DetailView(generic.DetailView): 
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

