from django.urls import include, path
from . import views

app_name = 'machines'
urlpatterns = [
	path('', views.IndexView.as_view(), name='index'),
	path('<int:pk>/', views.MachineDetail.as_view(), name='machine_detail'),
	path('add/', views.MachineCreate.as_view(), name='machine_add'),
	path('<int:pk>/edit', views.MachineUpdate.as_view(), name='machine_update'),
	path('<int:pk>/delete/', views.MachineDelete.as_view(), name='machine_delete'),
	path('types/<int:pk>/', views.TypeDetailView.as_view(), name='type_detail'),
]