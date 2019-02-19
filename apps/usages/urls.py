from django.urls import include, path
from . import views

app_name = 'usages'
urlpatterns = [
	# path('', views.IndexView.as_view(), name='index'),
	path('', views.index, name='index'),
	path('taps/', views.taps, name='taps'),
]