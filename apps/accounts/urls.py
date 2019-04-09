from django.urls import include, path
from . import views


app_name = 'accounts'
urlpatterns = [
	path('', views.IndexView.as_view(), name='index'),
	path('login/', views.LoginView.as_view(), name='login'), 
	path('<int:pk>/',views.DetailView.as_view(), name='detail'), 
]