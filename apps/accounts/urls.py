from django.urls import include, path
from django.contrib.auth import views as auth_views
from . import views


app_name = 'accounts'
urlpatterns = [
	path('', views.IndexView.as_view(), name='index'),
	path('login/', auth_views.LoginView.as_view(template_name='accounts/accounts_login.html'), name='login'),
	path('logout/', auth_views.LogoutView.as_view(template_name='accounts/accounts_logout.html'), name='logout'),
	#path('logout/', auth_views.LogoutView.as_view(template_name='accounts/accounts_logout.html'), {'next_page': '/'}, name='logout'),

	path('<int:pk>/', views.DetailView.as_view(), name='detail'), 
	path('add/', views.UserCreate, name='user_add'),
	# path('edit/', views.UserUpdate, name='user_update'),
	path('<int:pk>/edit/', views.UserUpdate, name='user_update'),
	path('<int:pk>/self_edit/', views.SelfUserUpdate, name='self_update'),
	path('<int:pk>/delete/', views.UserDelete.as_view(), name='user_delete'),	
]