from django.urls import path
from . import views

urlpatterns = [
    path('colecao/', views.colecao, name='colecao'),
]