from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect

@login_required
def admin_pagina_inicial(request):
    if not request.user.is_admin():
        return redirect('colecao')
    return render(request, 'catalogo/admin_pagina_inicial.html')
