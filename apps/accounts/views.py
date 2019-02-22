from django.shortcuts import render
from django.db import models 
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from . models import Profile

# class IndexView(generic.ListView):
# 	template_name = 'usages/index.html'
# 	context_object_name = ''

# 	def get_queryset(self):
# 		return Usages

def profiles(request):
	return render(request, 'accounts/profiles.html')

	

# Create your views here.
