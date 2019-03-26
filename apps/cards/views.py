from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from . models import Card, Unregistered_card

# class IndexView(generic.ListView):
# 	template_name = 'usages/index.html'
# 	context_object_name = ''

# 	def get_queryset(self):
# 		return Usages

def index(request):
	card_list = Card.objects.all()
	unregistered_card_list = Unregistered_card.objects.all()
	context = {
		'card_list': card_list,
		'unregistered_card_list': unregistered_card_list,
	}
	return render(request, 'cards/index.html', context)