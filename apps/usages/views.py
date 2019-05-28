from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.shortcuts import get_object_or_404, render
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse
from django.views import generic, View
from django_tables2 import RequestConfig
from django.utils import timezone
from django.core.serializers import serialize

from .models import Usage, DailyUsage
from .tables import UsageTable
from apps.machines.models import Machine, Machine_type
from apps.accounts.models import Profile
from .forms import DatePickerForm

class IndexView(LoginRequiredMixin, generic.ListView):
	context_object_name = 'latest_usage_list'
	template_name = 'usages/usage_list_old.html'
	
	def get_context_data(self, **kwargs):
		context = super(IndexView, self).get_context_data(**kwargs)
		context['machine_type_list'] = Machine_type.objects.all()
		context['dailyUsage_list'] = DailyUsage.objects.all()
		return context
		
	def get_queryset(self):
		return Usage.objects.order_by('-start_time')[:20]

def DetailView(request):
	if request.user.is_authenticated: 
		if request.method == 'POST': 
			form = DatePickerForm(request.POST)
			if form.is_valid():
				start_time = form.cleaned_data['start_date_field'].replace(hour=0, minute=0, second=0, microsecond=0)
				end_time = form.cleaned_data['end_date_field']
				end_time = end_time+timezone.timedelta(hours = 23, minutes = 59)
				dailyUsage_list = DailyUsage.objects.filter(date__range = [start_time , end_time])
				usage_table = UsageTable(Usage.objects.filter(start_time__range = [start_time , end_time]))
				RequestConfig(request, paginate={'per_page': 10}).configure(usage_table)
				machine_type_list = Machine_type.objects.all()
				
		else:
			form = DatePickerForm()
			start_time = (timezone.now() + timezone.timedelta(days=-7)).replace(hour=0, minute=0, second=0, microsecond=0)
			end_time = timezone.now()
			usage_table = UsageTable(Usage.objects.filter(start_time__range = [start_time , end_time]))
			RequestConfig(request, paginate={'per_page': 10}).configure(usage_table)
			machine_type_list = Machine_type.objects.all()
			dailyUsage_list = DailyUsage.objects.filter(date__range = [start_time , end_time])
	
		return render(request, 'usages/usage_list.html', {
			'usage_table': usage_table,
			'machine_type_list': machine_type_list,
			'dailyUsage_list': dailyUsage_list,
			'form': form,
		})

	else: 
		if request.method == 'POST': 
			form = DatePickerForm(request.POST)
			if form.is_valid():
				start_time = form.cleaned_data['start_date_field'].replace(hour=0, minute=0, second=0, microsecond=0)
				end_time = form.cleaned_data['end_date_field']
				end_time = end_time+timezone.timedelta(hours = 23, minutes = 59)
				dailyUsage_list = DailyUsage.objects.filter(date__range = [start_time , end_time]).order_by()
				machine_type_list = Machine_type.objects.all()
		else:
			form = DatePickerForm()
			start_time = (timezone.now() + timezone.timedelta(days=-7)).replace(hour=0, minute=0, second=0, microsecond=0)
			end_time = timezone.now()
			machine_type_list = Machine_type.objects.all()
			dailyUsage_list = DailyUsage.objects.filter(date__range = [start_time , end_time])
			
		return render(request, 'usages/usage_list_normal.html', {
			'machine_type_list': machine_type_list,
			'dailyUsage_list': dailyUsage_list,
			'form': form,
		})

class UserView(LoginRequiredMixin, View):
	def get(self, request, *args, **kwargs):
		profile = Profile.objects.get(id=self.kwargs["user_id"])
		form = DatePickerForm()
		start_time = (timezone.now() + timezone.timedelta(days=-7)).replace(hour=0, minute=0, second=0, microsecond=0)
		end_time = timezone.now()

		timeData = {}
		energyData = {}
		machine_types = Machine_type.objects.all()
		for machine_type in machine_types:
			timeData[machine_type.machine_type_name] = {}
			energyData[machine_type.machine_type_name] = {}
		dateList = []
		cur_date = start_time
		while cur_date < end_time:
			dateList.append(cur_date)
			for machine_type in machine_types:
				timeData[machine_type.machine_type_name][cur_date.strftime("%d/%m/%y")] = 0
				energyData[machine_type.machine_type_name][cur_date.strftime("%d/%m/%y")] = 0
			cur_date += timezone.timedelta(days=1)
		dateList.append(cur_date)

		for machine_type in machine_types:
			usages = Usage.objects.filter(user=profile.user, machine_type=machine_type, start_time__range=[start_time, end_time])
			for usage in usages:
				timeData[machine_type.machine_type_name][usage.start_time.strftime("%d/%m/%y")] += round(((usage.end_time-usage.start_time).seconds/60), 1)
				energyData[machine_type.machine_type_name][usage.start_time.strftime("%d/%m/%y")] += usage.total_usage

		usage_table = UsageTable(Usage.objects.filter(user=profile.user, start_time__range=[start_time , end_time]))
		return render(request, 'usages/usage_user_list.html', {
			'usage_table': usage_table,
			'machine_type_list': machine_types,
			'form': form,
			'profile': profile,
			'dateList': dateList,
			'timeData': timeData,
			'energyData': energyData,
		})

	def post(self, request, *args, **kwargs):
		form = DatePickerForm(request.POST)
		if form.is_valid():
			profile = Profile.objects.get(id=self.kwargs["user_id"])
			start_time = form.cleaned_data['start_date_field'].replace(hour=0, minute=0, second=0, microsecond=0)
			end_time = form.cleaned_data['end_date_field']
			end_time = end_time+timezone.timedelta(hours = 23, minutes = 59)

			timeData = {}
			energyData = {}
			machine_types = Machine_type.objects.all()
			for machine_type in machine_types:
				timeData[machine_type.machine_type_name] = {}
				energyData[machine_type.machine_type_name] = {}
			dateList = []
			cur_date = start_time
			while cur_date < end_time:
				dateList.append(cur_date)
				for machine_type in machine_types:
					timeData[machine_type.machine_type_name][cur_date.strftime("%d/%m/%y")] = 0
					energyData[machine_type.machine_type_name][cur_date.strftime("%d/%m/%y")] = 0
				cur_date += timezone.timedelta(days=1)
			dateList.append(cur_date)

			for machine_type in machine_types:
				usages = Usage.objects.filter(user=profile.user, machine_type=machine_type, start_time__range=[start_time, end_time])
				for usage in usages:
					timeData[machine_type.machine_type_name][usage.start_time.strftime("%d/%m/%y")] += round(((usage.end_time-usage.start_time).seconds/60), 1)
					energyData[machine_type.machine_type_name][usage.start_time.strftime("%d/%m/%y")] += usage.total_usage

			usage_table = UsageTable(Usage.objects.filter(user=profile.user, start_time__range = [start_time , end_time]))
			return render(request, 'usages/usage_user_list.html', {
				'usage_table': usage_table,
				'machine_type_list': machine_types,
				'form': form,
				'profile': profile,
				'dateList': dateList,
				'timeData': timeData,
				'energyData': energyData,
			})

class MachineView(LoginRequiredMixin, View):
	def get(self, request, *args, **kwargs):
		machine = Machine.objects.get(id=self.kwargs["machine_id"])
		form = DatePickerForm()
		start_time = (timezone.now() + timezone.timedelta(days=-7)).replace(hour=0, minute=0, second=0, microsecond=0)
		end_time = timezone.now()

		dateList = []
		timeData = {}
		energyData = {}
		cur_date = start_time
		while cur_date < end_time:
			dateList.append(cur_date)
			timeData[cur_date.strftime("%d/%m/%y")] = 0
			energyData[cur_date.strftime("%d/%m/%y")] = 0
			cur_date += timezone.timedelta(days=1)
		dateList.append(cur_date)

		usages = Usage.objects.filter(machine=machine, start_time__range=[start_time, end_time])
		for usage in usages:
			timeData[usage.start_time.strftime("%d/%m/%y")] += round(((usage.end_time-usage.start_time).seconds/60), 1)
			energyData[usage.start_time.strftime("%d/%m/%y")] += usage.total_usage

		usage_table = UsageTable(Usage.objects.filter(machine=machine, start_time__range=[start_time , end_time]))
		return render(request, 'usages/usage_machine_list.html', {
			'usage_table': usage_table,
			'form': form,
			'machine': machine,
			'dateList': dateList,
			'timeData': timeData,
			'energyData': energyData,
		})

	def post(self, request, *args, **kwargs):
		form = DatePickerForm(request.POST)
		if form.is_valid():
			machine = Machine.objects.get(id=self.kwargs["machine_id"])
			start_time = form.cleaned_data['start_date_field'].replace(hour=0, minute=0, second=0, microsecond=0)
			end_time = form.cleaned_data['end_date_field']
			end_time = end_time+timezone.timedelta(hours = 23, minutes = 59)

			dateList = []
			timeData = {}
			energyData = {}
			cur_date = start_time
			while cur_date < end_time:
				dateList.append(cur_date)
				timeData[cur_date.strftime("%d/%m/%y")] = 0
				energyData[cur_date.strftime("%d/%m/%y")] = 0
				cur_date += timezone.timedelta(days=1)
			dateList.append(cur_date)

			usages = Usage.objects.filter(machine=machine, start_time__range=[start_time, end_time])
			for usage in usages:
				timeData[usage.start_time.strftime("%d/%m/%y")] += round(((usage.end_time-usage.start_time).seconds/60), 1)
				energyData[usage.start_time.strftime("%d/%m/%y")] += usage.total_usage
			
			usage_table = UsageTable(Usage.objects.filter(machine=machine, start_time__range=[start_time , end_time]))
			return render(request, 'usages/usage_machine_list.html', {
				'usage_table': usage_table,
				'form': form,
				'machine': machine,
				'dateList': dateList,
				'timeData': timeData,
				'energyData': energyData,
			})

class MachineTypeView(LoginRequiredMixin, View):
	def get(self, request, *args, **kwargs):
		machine_type = Machine_type.objects.get(id=self.kwargs["machine_type_id"])
		form = DatePickerForm()
		start_time = (timezone.now() + timezone.timedelta(days=-7)).replace(hour=0, minute=0, second=0, microsecond=0)
		end_time = timezone.now()

		dateList = []
		timeData = {}
		energyData = {}
		cur_date = start_time
		while cur_date < end_time:
			dateList.append(cur_date)
			timeData[cur_date.strftime("%d/%m/%y")] = 0
			energyData[cur_date.strftime("%d/%m/%y")] = 0
			cur_date += timezone.timedelta(days=1)
		dateList.append(cur_date)

		usages = Usage.objects.filter(machine_type=machine_type, start_time__range=[start_time, end_time])
		for usage in usages:
			timeData[usage.start_time.strftime("%d/%m/%y")] += round(((usage.end_time-usage.start_time).seconds/60), 1)
			energyData[usage.start_time.strftime("%d/%m/%y")] += usage.total_usage

		usage_table = UsageTable(Usage.objects.filter(machine_type=machine_type, start_time__range=[start_time , end_time]))
		return render(request, 'usages/usage_machine_type_list.html', {
			'usage_table': usage_table,
			'form': form,
			'machine_type': machine_type,
			'dateList': dateList,
			'timeData': timeData,
			'energyData': energyData,
		})

	def post(self, request, *args, **kwargs):
		form = DatePickerForm(request.POST)
		if form.is_valid():
			machine_type = Machine_type.objects.get(id=self.kwargs["machine_type_id"])
			start_time = form.cleaned_data['start_date_field'].replace(hour=0, minute=0, second=0, microsecond=0)
			end_time = form.cleaned_data['end_date_field']
			end_time = end_time+timezone.timedelta(hours = 23, minutes = 59)

			dateList = []
			timeData = {}
			energyData = {}
			cur_date = start_time
			while cur_date < end_time:
				dateList.append(cur_date)
				timeData[cur_date.strftime("%d/%m/%y")] = 0
				energyData[cur_date.strftime("%d/%m/%y")] = 0
				cur_date += timezone.timedelta(days=1)
			dateList.append(cur_date)

			usages = Usage.objects.filter(machine_type=machine_type, start_time__range=[start_time, end_time])
			for usage in usages:
				timeData[usage.start_time.strftime("%d/%m/%y")] += round(((usage.end_time-usage.start_time).seconds/60), 1)
				energyData[usage.start_time.strftime("%d/%m/%y")] += usage.total_usage
			
			usage_table = UsageTable(Usage.objects.filter(machine_type = self.kwargs["machine_type_id"], start_time__range = [start_time , end_time]))
			return render(request, 'usages/usage_machine_type_list.html', {
				'usage_table': usage_table,
				'form': form,
				'machine_type': machine_type,
				'dateList': dateList,
				'timeData': timeData,
				'energyData': energyData,
			})