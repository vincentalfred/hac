from django.urls import include, path
from . import views

app_name = 'certifications'
urlpatterns = [
	path('', views.IndexView.as_view(), name='index'),
	path('add/', views.CertificationCreate.as_view(), name='certification_add'),
	path('<int:pk>/', views.CertificationDetail.as_view(), name='certification_detail'), 
	path('<int:pk>/edit/', views.CertificationUpdate.as_view(), name='certification_update'),
	path('<int:pk>/delete/', views.CertificationDelete.as_view(), name='certification_delete'),

	path('users/<int:user_id>/', views.CertificationUserList.as_view(), name='certification_user_list'),
]