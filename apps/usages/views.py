from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse
from django.views import generic
from django_tables2 import RequestConfig
from django.utils import timezone



from .models import Usage, DailyUsage
from .tables import UsageTable
from apps.machines.models import Machine_type
from .forms import MyForm

class IndexView(LoginRequiredMixin, generic.ListView):
	context_object_name = 'latest_usage_list'
	template_name = 'usages/usage_list_old.html'
	
	def get_context_data(self, **kwargs):
		context = super(IndexView, self).get_context_data(**kwargs)
		context['machine_type_list'] = Machine_type.objects.all()
		context['dailyUsage_list'] = DailyUsage.objects.all()
		return context
		
	def get_queryset(self):
		# return Usage.objects.all()
		# return Usage.objects.order_by('-start_time')
		return Usage.objects.order_by('-start_time')[:20]
		# return Usage.objects.latest('start_time')

def DetailView(request):
	if request.method == 'POST': 
		form = MyForm(request.POST)
		if form.is_valid():
			start_time = form.cleaned_data['start_date_field']
			end_time = form.cleaned_data['end_date_field']
			end_time = end_time+timezone.timedelta(hours = 23, minutes = 59)
			dailyUsage_list = DailyUsage.objects.filter(date__range = [start_time , end_time])
			usage_table = UsageTable(Usage.objects.filter(start_time__range = [start_time , end_time]))
			RequestConfig(request, paginate={'per_page': 10}).configure(usage_table)
			machine_type_list = Machine_type.objects.all()
			
	else:
		form = MyForm()
		start_time = (timezone.now() + timezone.timedelta(days=-7))
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




