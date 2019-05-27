from django.urls import include, path
from . import views

app_name = 'usages'
urlpatterns = [
	path('old/', views.IndexView.as_view(), name='index'),
	path('', views.DetailView, name='detail'),
	path('user/<int:user_id>/', views.UserView.as_view(), name='usages_user'),
	path('machine/<int:machine_id>/', views.MachineView.as_view(), name='usages_machine'),
	path('machine-type/<int:machine_type_id>/', views.MachineTypeView.as_view(), name='usages_machine_type'),
]
