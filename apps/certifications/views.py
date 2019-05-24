from django.shortcuts import render
from django.views import generic
from django.urls import reverse, reverse_lazy
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponseRedirect, HttpResponse

from . models import Certification
from apps.machines.models import Machine, Machine_type

class IndexView(LoginRequiredMixin, generic.ListView):
	context_object_name = 'certification_list'
	def get_queryset(self):
		return Certification.objects.all()

class CertificationCreate(LoginRequiredMixin, generic.CreateView):
	model = Certification
	fields = ['user', 'machine_type']
	def get_success_url(self):
		return reverse('certifications:index')

class CertificationDetail(LoginRequiredMixin, generic.DetailView): 
	model = Certification

class CertificationUpdate(LoginRequiredMixin, generic.UpdateView):
	model = Certification
	fields = ['user', 'machine_type']
	def get_success_url(self):
		return reverse('certifications:certification_detail', kwargs={'pk': self.object.id})

class CertificationDelete(LoginRequiredMixin, generic.DeleteView):
	model = Certification
	def get_success_url(self):
		return reverse('certifications:index')

class CertificationUserList(LoginRequiredMixin, generic.ListView):
	template_name = 'certifications/certification_user_list.html'
	context_object_name = 'machine_types'

	def get_context_data(self, **kwargs):
		context = super().get_context_data(**kwargs)
		context['certification_list'] = {}
		machine_types = Machine_type.objects.all()
		for machine_type in machine_types:
			if Certification.objects.filter(user = self.kwargs['user_id'] ,machine_type = machine_type).exists():
				context['certification_list'][machine_type.machine_type_name] = True
			else:
				context['certification_list'][machine_type.machine_type_name] = False
		return context
	def get_queryset(self, *args, **kwargs):
		return Machine_type.objects.all()
