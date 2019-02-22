from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from .models import Tap

class IndexView(generic.ListView):
    context_object_name = 'latest_tap_list'

    def get_queryset(self):
        return Tap.objects.order_by('-tap_time')

