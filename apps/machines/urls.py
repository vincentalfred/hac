from django.urls import include, path
from . import views

app_name = 'machines'
urlpatterns = [
	path('', views.IndexView.as_view(), name='index'),
	path('<int:pk>/', views.DetailView.as_view(), name='detail'),
    # path('<int:question_id>/vote/', views.vote, name='vote'),
]