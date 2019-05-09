from django.urls import include, path
from . import views

app_name = 'cards'
urlpatterns = [
	path('', views.IndexView.as_view(), name='index'),
	path('<int:pk>/add/', views.CardCreate, name='card_add'),
	path('<int:pk>/edit/', views.CardUpdate, name='card_edit'),
	path('<int:pk>/delete/', views.CardDelete, name='card_delete'),
]