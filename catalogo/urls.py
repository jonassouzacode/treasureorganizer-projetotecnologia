from django.urls import path
from . import views

urlpatterns = [
    path('admin-pagina-inicial', views.admin_pagina_inicial, name='admin_pagina_inicial'),
    
    path('catalogo/generos/', views.generos_list, name='generos_list'),
    path('catalogo/generos/novo/', views.generos_create, name='generos_create'),
    path('catalogo/generos/editar/<int:id>/', views.generos_update, name='generos_update'),
    path('catalogo/generos/remover/<int:id>/', views.generos_delete, name='generos_delete'),

    path('catalogo/idiomas/', views.idiomas_list, name='idiomas_list'),
    path('catalogo/idiomas/novo/', views.idiomas_create, name='idiomas_create'),
    path('catalogo/idiomas/editar/<int:id>/', views.idiomas_update, name='idiomas_update'),
    path('catalogo/idiomas/remover/<int:id>/', views.idiomas_delete, name='idiomas_delete'),

    path('catalogo/autores/', views.autores_list, name='autores_list'),
    path('catalogo/autores/novo/', views.autores_create, name='autores_create'),
    path('catalogo/autores/editar/<int:id>/', views.autores_update, name='autores_update'),
    path('catalogo/autores/remover/<int:id>/', views.autores_delete, name='autores_delete'),

    path('catalogo/artistas/', views.artistas_list, name='artistas_list'),
    path('catalogo/artistas/novo/', views.artistas_create, name='artistas_create'),
    path('catalogo/artistas/editar/<int:id>/', views.artistas_update, name='artistas_update'),
    path('catalogo/artistas/remover/<int:id>/', views.artistas_delete, name='artistas_delete'),

    path('catalogo/editoras/', views.editoras_list, name='editoras_list'),
    path('catalogo/editoras/novo/', views.editoras_create, name='editoras_create'),
    path('catalogo/editoras/editar/<int:id>/', views.editoras_update, name='editoras_update'),
    path('catalogo/editoras/remover/<int:id>/', views.editoras_delete, name='editoras_delete'),

    path('catalogo/gravadoras/', views.gravadoras_list, name='gravadoras_list'),
    path('catalogo/gravadoras/novo/', views.gravadoras_create, name='gravadoras_create'),
    path('catalogo/gravadoras/editar/<int:id>/', views.gravadoras_update, name='gravadoras_update'),
    path('catalogo/gravadoras/remover/<int:id>/', views.gravadoras_delete, name='gravadoras_delete'),

    path('catalogo/encadernacoes/', views.encadernacoes_list, name='encadernacoes_list'),
    path('catalogo/encadernacoes/novo/', views.encadernacoes_create, name='encadernacoes_create'),
    path('catalogo/encadernacoes/editar/<int:id>/', views.encadernacoes_update, name='encadernacoes_update'),
    path('catalogo/encadernacoes/remover/<int:id>/', views.encadernacoes_delete, name='encadernacoes_delete'),
]