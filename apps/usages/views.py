from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from . models import Usage

class IndexView(generic.ListView):
	context_object_name = 'latest_usage_list'

	def get_queryset(self):
		return Usage.objects.order_by('-start_time')

# def index(request):
# 	latest_usage_list = Usage.objects.order_by('-start_time')
# 	context = {'latest_usage_list': latest_usage_list}
# 	return render(request, 'usages/index.html', context)