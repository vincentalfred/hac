from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from .models import Tap
from .mqtt import client

class IndexView(generic.ListView):
    context_object_name = 'latest_tap_list'

    def get_queryset(self):
        return Tap.objects.order_by('-tap_time')

def esp(request, led):
	if led==1:
		client.publish('led', '1');
	else:
		client.publish('led', '0');
	return render(request, 'taps/tap_list.html',
		{
			'latest_tap_list': '',
			'led': led,
		}
	)