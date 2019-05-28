from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect

from . models import Card, Unregistered_card
from django.contrib.auth.models import User
from apps.machines.models import Machine_type
from apps.accounts.models import Profile

class IndexView(LoginRequiredMixin, generic.ListView):
	template_name = 'cards/cards_list.html'
	context_object_name = 'cards_list'
	def get_queryset(self):
		return Card.objects.all()

	def get_context_data(self, **kwargs):
		context = super(IndexView, self).get_context_data(**kwargs)
		context['unregistered_cards_list'] = Unregistered_card.objects.all().order_by('-tap_time')
		return context

@login_required
def CardCreate(request, pk):
	allowed = request.user.is_staff
	if not allowed:
		return HttpResponse("Not allowed")

	error_message = ""
	unregistered_card = Unregistered_card.objects.get(pk=pk)
	if request.method == 'POST':
		carduid = unregistered_card.card_uid
		user_id = request.POST.get("selected_user", 0)
		if user_id != 0:
			user = User.objects.get(id=user_id)
			unregistered_card.delete()
			# add to card
			card = Card(user = user, card_uid = carduid)
			card.save()
			return redirect('cards:index')
		else:
			error_message = "No user is selected. Please select a user."
	
	users_list = User.objects.all().order_by('username')
	return render(request, 'cards/unregistered_cards_form.html', {
		'carduid': unregistered_card,
		'users_list': users_list,
		'error_message': error_message,
		'test': "test",
	})

@login_required
def CardUpdate(request, pk):
	allowed = request.user.is_staff
	if not allowed:
		return HttpResponse("Not allowed")
	card = Card.objects.get(pk=pk)
	if request.method == 'POST':
		user_id = request.POST.get("selected_user")
		user = User.objects.get(id=user_id)
		card.user = user
		card.save()
		return redirect('cards:index')
	else:
		users_list = User.objects.all().order_by('username')
	return render(request, 'cards/cards_form.html', {
		'users_list': users_list,
		'card': card
	})

@login_required
def CardDelete(request, pk):
	allowed = request.user.is_staff
	if not allowed:
		return HttpResponse("Not allowed")
	card = Card.objects.get(pk=pk)
	card.delete()
	return redirect('cards:index')
	