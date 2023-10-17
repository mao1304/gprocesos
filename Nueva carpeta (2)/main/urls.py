from django.urls import path, include
from . import views
from proceso import views as proceso_views

urlpatterns = [
    path('', views.signup, name='signup'),
    path('mainPage/', views.mainPage, name='mainPage'),
    path('logout/', views.signout, name='logout'),
    path('signin/', views.signin, name='signin'),
    path('menuProceso/', proceso_views.proceso_view, name='menuProceso'),
    
]