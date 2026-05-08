from django.contrib.auth.decorators import login_required
from django.shortcuts import render

@login_required
def colecao(request):
    return render(request, 'colecionaveis/colecao.html')
