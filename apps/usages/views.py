from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse
from django.views import generic
from django_tables2 import RequestConfig

from .models import Usage, DailyUsage
from .tables import UsageTable
from apps.machines.models import Machine_type

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
	usage_table = UsageTable(Usage.objects.order_by('-start_time'))
	RequestConfig(request, paginate={'per_page': 10}).configure(usage_table)
	machine_type_list = Machine_type.objects.all()
	dailyUsage_list = DailyUsage.objects.all()

	return render(request, 'usages/usage_list.html', {
		'usage_table': usage_table,
		'machine_type_list': machine_type_list,
		'dailyUsage_list': dailyUsage_list,
	})
