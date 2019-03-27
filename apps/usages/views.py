from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from . models import Usage

# class IndexView(generic.ListView):
# 	template_name = 'usages/index.html'
# 	context_object_name = ''

# 	def get_queryset(self):
# 		return Usages

class IndexView(generic.ListView):
	template_name = 'usages/usages_list.html'
	context_object_name = 'usages_list'

	def get_queryset(self):
		return Usage.objects.all()
