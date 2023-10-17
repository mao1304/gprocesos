from django.urls import path, include
from .views import proceso_view

app_name = 'proceso1'

urlpatterns = [
    path('menuProceso/', proceso_view, name='procesos'),
]