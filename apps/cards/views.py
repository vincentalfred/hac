from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from . models import Card, Unregistered_card
from apps.machines.models import Machine_type

# class IndexView(generic.ListView):
# 	template_name = 'usages/index.html'
# 	context_object_name = ''

# 	def get_queryset(self):
# 		return Usages

class IndexView(generic.ListView):
	template_name = 'cards/cards_list.html'
	context_object_name = 'cards_list'
	def get_queryset(self):
		return Card.objects.all()



	
