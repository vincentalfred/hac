from django.urls import include, path
from . import views

app_name = 'usages'
urlpatterns = [
	path('old/', views.IndexView.as_view(), name='index'),
	path('', views.DetailView, name='detail'),
]
