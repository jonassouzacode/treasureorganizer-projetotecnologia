from django.urls import path
from . import views

urlpatterns = [
    path('colecao/', views.colecao, name='colecao'),
    path('colecionaveis/adicionar/', views.adicionar_colecao, name='adicionar_colecao'),
    path('colecionaveis/adicionar-desejo/', views.adicionar_desejos, name='adicionar_desejos'),
    path('colecionaveis/editar/<int:id>/', views.editar_colecionavel, name='editar_colecionavel'),
    path('colecionaveis/remover/<int:id>/', views.remover_colecao, name='remover_colecao'),
    path('colecionaveis/remover-desejo/<int:id>/', views.remover_desejo, name='remover_desejo'),
    path('colecionaveis/mover/<int:id>/', views.mover_para_desejos, name='mover_para_desejos'),
    path('colecionaveis/mover-colecao/<int:id>/', views.mover_para_colecao, name='mover_para_colecao'),
]