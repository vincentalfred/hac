from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse, reverse_lazy
from django.views import generic

from .models import Machine, Machine_type

class IndexView(generic.ListView):
	context_object_name = 'machine_list'

	def get_context_data(self, **kwargs):
		context = super(IndexView, self).get_context_data(**kwargs)
		context['machine_type_list'] = Machine_type.objects.all()
		return context

	def get_queryset(self):
		return Machine.objects.all()


class MachineDetail(generic.DetailView):
	model = Machine


class MachineCreate(generic.CreateView):
	model = Machine
	fields = ['machine_type', 'machine_name']
	success_url = "machines/"


class MachineUpdate(generic.UpdateView):
	model = Machine
	fields = ['machine_type', 'machine_name']

	def get_success_url(self):
		return reverse('machines:machine_detail', kwargs={'pk': self.object.id})


class MachineDelete(generic.DeleteView):
	model = Machine
	success_url = "machines/"

class TypeDetailView(generic.DetailView):
	model = Machine_type

