from django.shortcuts import render
from django.db import models 
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from . models import Card

# class IndexView(generic.ListView):
# 	template_name = 'usages/index.html'
# 	context_object_name = ''

# 	def get_queryset(self):
# 		return Usages

def cards(request):
	return render(request, 'cards/kartu.html')

	

# Create your views here.
