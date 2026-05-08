from django.urls import path
from . import views

urlpatterns = [
    path('admin-pagina-inicial', views.admin_pagina_inicial, name='admin_pagina_inicial'),
]