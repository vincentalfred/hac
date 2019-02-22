from django.urls import include, path
from . import views

app_name = 'cards'
urlpatterns = [
	# path('', views.IndexView.as_view(), name='index'),
	path('', views.cards, name='cards'),

]