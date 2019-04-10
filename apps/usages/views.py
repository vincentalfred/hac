from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from . models import Usage, DailyUsage
from apps.machines.models import Machine_type

class IndexView(generic.ListView):
	context_object_name = 'latest_usage_list'
	
	def get_context_data(self, **kwargs):
		context = super(IndexView, self).get_context_data(**kwargs)
		context['machine_type_list'] = Machine_type.objects.all()
		context['dailyUsage_list'] = DailyUsage.objects.all()
		return context
		
	def get_queryset(self):
		return Usage.objects.order_by('-start_time')