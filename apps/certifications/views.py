from django.shortcuts import render
from django.views import generic, View
from django.urls import reverse, reverse_lazy
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponseRedirect, HttpResponse

from . models import Certification
from apps.machines.models import Machine, Machine_type
from apps.accounts.models import Profile
from django.contrib.auth.models import User

class IndexView(LoginRequiredMixin, generic.ListView):
	context_object_name = 'certification_list'
	def get_queryset(self):
		return Certification.objects.all()

class CertificationCreate(LoginRequiredMixin, generic.CreateView):
	model = Certification
	fields = ['user', 'machine_type']
	def get_success_url(self):
		return reverse('certifications:index')

class CertificationDetail(LoginRequiredMixin, generic.DetailView): 
	model = Certification

class CertificationUpdate(LoginRequiredMixin, generic.UpdateView):
	model = Certification
	fields = ['user', 'machine_type']
	def get_success_url(self):
		return reverse('certifications:certification_detail', kwargs={'pk': self.object.id})

class CertificationDelete(LoginRequiredMixin, generic.DeleteView):
	model = Certification
	def get_success_url(self):
		return reverse('certifications:index')

class CertificationUserList(LoginRequiredMixin, generic.ListView):
	def get(self, request, **kwargs):
		user = Profile.objects.get(id=self.kwargs['user_id'])
		certification_list = {}
		machine_types = Machine_type.objects.all()
		for machine_type in machine_types:
			if Certification.objects.filter(user = self.kwargs['user_id'] ,machine_type = machine_type).exists():
				certification = Certification.objects.get(user = self.kwargs['user_id'], machine_type = machine_type)
				certification_list[machine_type.machine_type_name] = {
					'certified': True,
					'machine_type_id': machine_type.id,
					'certification_id': certification.id,
				}
			else:
				certification_list[machine_type.machine_type_name] = {
					'certified': False,
					'machine_type_id': machine_type.id,
					'certification_id': 0,
				}

		return render(request, 'certifications/certification_user_list.html', {
			'user': user,
			'certification_list': certification_list,
		})

class CertificationUserUpdate(LoginRequiredMixin, View):
	def get(self, request, *args, **kwargs):
		profile = Profile.objects.get(id=self.kwargs['user_id'])
		certification_list = {}
		machine_types = Machine_type.objects.all()
		for machine_type in machine_types:
			if Certification.objects.filter(user = self.kwargs['user_id'] ,machine_type = machine_type).exists():
				certification = Certification.objects.get(user = self.kwargs['user_id'], machine_type = machine_type)
				certification_list[machine_type.machine_type_name] = {
					'certified': True,
					'machine_type_id': machine_type.id,
					'certification_id': certification.id,
				}
			else:
				certification_list[machine_type.machine_type_name] = {
					'certified': False,
					'machine_type_id': machine_type.id,
					'certification_id': 0,
				}

		return render(request, 'certifications/certification_user_form.html', {
			'profile': profile,
			'certification_list': certification_list,
		})

	def post(self, request, *args, **kwargs):
		certification_checkbox = request.POST.getlist('certification_checkbox')
		user = User.objects.get(id=self.kwargs['user_id'])
		profile = Profile.objects.get(id=self.kwargs['user_id'])
		certification_list = {}
		machine_types = Machine_type.objects.all()
		for machine_type in machine_types:
			if Certification.objects.filter(user = self.kwargs['user_id'] ,machine_type = machine_type).exists():
				if machine_type.machine_type_name in certification_checkbox:
					certification = Certification.objects.get(user = self.kwargs['user_id'], machine_type = machine_type)
					certification_list[machine_type.machine_type_name] = {
						'certified': True,
						'machine_type_id': machine_type.id,
						'certification_id': certification.id,
					}
				else:
					Certification.objects.filter(user = self.kwargs['user_id'], machine_type = machine_type).delete()
					certification_list[machine_type.machine_type_name] = {
						'certified': False,
						'machine_type_id': machine_type.id,
						'certification_id': 0,
					}
			else:
				if machine_type.machine_type_name in certification_checkbox:
					certification = Certification.objects.create(user = user, machine_type = machine_type)
					certification_list[machine_type.machine_type_name] = {
						'certified': True,
						'machine_type_id': machine_type.id,
						'certification_id': certification.id,
					}
				else:
					certification_list[machine_type.machine_type_name] = {
						'certified': False,
						'machine_type_id': machine_type.id,
						'certification_id': 0,
					}

		return HttpResponseRedirect(reverse('accounts:detail', kwargs={'pk':user.id}))
		
		# return render(request, 'certifications/certification_user_form.html', {
		# 	'profile': profile,
		# 	'certification_list': certification_list,
		# 	'certification_checkbox': certification_checkbox,
		# })