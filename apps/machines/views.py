from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse, reverse_lazy
from django.views import generic
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import Machine, Machine_type

class IndexView(LoginRequiredMixin, generic.ListView):
	context_object_name = 'machine_list'
	def get_context_data(self, **kwargs):
		context = super(IndexView, self).get_context_data(**kwargs)
		context['machine_type_list'] = Machine_type.objects.all().order_by('id')
		return context

	def get_queryset(self):
		return Machine.objects.all().order_by('id')


class MachineDetail(LoginRequiredMixin, generic.DetailView):
	model = Machine


class MachineCreate(LoginRequiredMixin, generic.CreateView):
	model = Machine
	fields = ['machine_type', 'machine_name', 'status']
	def get_success_url(self):
		return reverse('machines:index')


class MachineUpdate(LoginRequiredMixin, generic.UpdateView):
	model = Machine
	fields = ['machine_type', 'machine_name', 'status']
	def get_success_url(self):
		return reverse('machines:machine_detail', kwargs={'pk': self.object.id})


class MachineDelete(LoginRequiredMixin, generic.DeleteView):
	model = Machine
	def get_success_url(self):
		return reverse('machines:index')


class TypeDetail(LoginRequiredMixin, generic.DetailView):
	model = Machine_type


class TypeCreate(LoginRequiredMixin, generic.CreateView):
	model = Machine_type
	fields = ['machine_type_name']
	def get_success_url(self):
		return reverse('machines:index')


class TypeUpdate(LoginRequiredMixin, generic.UpdateView):
	model = Machine_type
	fields = ['machine_type_name']

	def get_success_url(self):
		return reverse('machines:type_detail', kwargs={'pk': self.object.id})


class TypeDelete(LoginRequiredMixin, generic.DeleteView):
	model = Machine_type
	def get_success_url(self):
		return reverse('machines:index')

class HomeView(generic.ListView):
	template_name = 'machines/home.html' 
	context_object_name = 'machine_list'


	def get_queryset(self):
		return Machine.objects.all()