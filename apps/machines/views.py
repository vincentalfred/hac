from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from .models import Machine

class IndexView(generic.ListView):
    context_object_name = 'machine_list'

    def get_queryset(self):
        return Machine.objects.all()