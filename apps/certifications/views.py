from django.shortcuts import render
from django.views import generic
from django.urls import reverse, reverse_lazy
from django.contrib.auth.mixins import LoginRequiredMixin
from . models import Certification

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