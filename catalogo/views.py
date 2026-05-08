from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect, get_object_or_404
from .models import Genero, Idioma, Autor, Artista, Editora, Gravadora, Encadernacao

def admin_required(request):
    return request.user.is_authenticated and request.user.is_admin()

@login_required
def admin_pagina_inicial(request):
    if not request.user.is_admin():
        return redirect('colecao')
    return render(request, 'catalogo/admin_pagina_inicial.html')

@login_required
def generos_list(request):
    if not admin_required(request):
        return redirect('colecao')
    return render(request, 'catalogo/list.html', {
        'titulo': 'Gêneros',
        'itens': Genero.objects.all(),
        'url_criar': 'generos_create',
        'url_editar': 'generos_update',
        'url_remover': 'generos_delete',
        'campo_nome': 'genero',
    })
    
@login_required
def generos_create(request):
    if not admin_required(request):
        return redirect('colecao')
    if request.method == 'POST':
        nome = request.POST.get('nome')
        if nome:
            if Genero.objects.filter(genero__iexact=nome).exists():
                return render(request, 'catalogo/form.html', {'titulo': 'Gênero', 'campo': 'Nome do Gênero', 'url_voltar': 'generos_list', 'erro': 'Este gênero já existe!'})
            Genero.objects.create(genero=nome)
            return redirect('generos_list')
    return render(request, 'catalogo/form.html', {'titulo': 'Gênero', 'campo': 'Nome do Gênero', 'url_voltar': 'generos_list'})

@login_required
def generos_update(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Genero, id=id)
    if request.method == 'POST':
        nome = request.POST.get('nome')
        if nome:
            item.genero = nome
            item.save()
            return redirect('generos_list')
    return render(request, 'catalogo/form.html', {'titulo': 'Género', 'campo': 'Nome do Género', 'valor': item.genero, 'url_voltar': 'generos_list'})

@login_required
def generos_delete(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Genero, id=id)
    if request.method == 'POST':
        try:
            item.delete()
            return redirect('generos_list')
        except Exception:
             return render(request, 'catalogo/remover.html', {'titulo': 'Gênero', 'nome': item.genero, 'url_voltar': 'generos_list', 'erro': 'Esse gênero não pode ser removido pois está associado a um ou mais colecionáveis!'})            
    return render(request, 'catalogo/remover.html', {'titulo': 'Gênero', 'nome': item.genero, 'url_voltar': 'generos_list'})

@login_required
def idiomas_list(request):
    if not admin_required(request):
        return redirect('colecao')
    return render(request, 'catalogo/list.html', {
        'titulo': 'Idiomas',
        'itens': Idioma.objects.all(),
        'url_criar': 'idiomas_create',
        'url_editar': 'idiomas_update',
        'url_remover': 'idiomas_delete',
        'campo_nome': 'idioma',
        })
    
@login_required
def idiomas_create(request):
    if not admin_required(request):
        return redirect('colecao')
    if request.method == 'POST':
        nome = request.POST.get('nome')
        if nome:
            if Idioma.objects.filter(idioma__iexact=nome).exists():
                return render(request, 'catalogo/form.html', {'titulo': 'Idioma', 'campo': 'Nome do Idioma', 'url_voltar': 'idiomas_list', 'erro': 'Este idioma já existe!'})
            Idioma.objects.create(idioma=nome)
            return redirect('idiomas_list')
    return render(request, 'catalogo/form.html', {'titulo': 'Idioma', 'campo': 'Nome do Idioma', 'url_voltar': 'idiomas_list'})

@login_required
def idiomas_update(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Idioma, id=id)
    if request.method == 'POST':
        nome = request.POST.get('nome')
        if nome:
            item.idioma = nome
            item.save()
            return redirect('idiomas_list')
    return render(request, 'catalogo/form.html', {'titulo': 'Idioma', 'campo': 'Nome do Idioma', 'valor': item.idioma, 'url_voltar': 'idiomas_list'})

@login_required
def idiomas_delete(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Idioma, id=id)
    if request.method == 'POST':
        try:
            item.delete()
            return redirect('idiomas_list')
        except Exception:
            return render(request, 'catalogo/remover.html', {'titulo': 'Idioma', 'nome': item.idioma, 'url_voltar': 'idiomas_list', 'erro': 'Esse idioma não pode ser removido pois está associado a um ou mais colecionáveis!'})
    return render(request, 'catalogo/remover.html', {'titulo': 'Idioma', 'nome': item.idioma, 'url_voltar': 'idiomas_list'})

@login_required
def autores_list(request):
    if not admin_required(request):
        return redirect('colecao')
    return render(request, 'catalogo/list.html', {
        'titulo': 'Autores',
        'itens': Autor.objects.all(),
        'url_criar': 'autores_create',
        'url_editar': 'autores_update',
        'url_remover': 'autores_delete',
        'campo_nome': 'nome',
    })
    
@login_required
def autores_create(request):
    if not admin_required(request):
        return redirect('colecao')
    if request.method == 'POST':
        nome = request.POST.get('nome')
        if nome:
            if Autor.objects.filter(nome__iexact=nome).exists():
                return render(request, 'catalogo/form.html', {'titulo': 'Autor', 'campo': 'Nome do Autor', 'url_voltar': 'autores_list', 'erro': 'Este autor já existe!'})
            Autor.objects.create(nome=nome)
            return redirect('autores_list')
    return render(request, 'catalogo/form.html', {'titulo': 'Autor', 'campo': 'Nome do Autor', 'url_voltar': 'autores_list'})

@login_required
def autores_update(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Autor, id=id)
    if request.method == 'POST':
        nome = request.POST.get('nome')
        if nome:
            item.nome = nome
            item.save()
            return redirect('autores_list')
    return render(request, 'catalogo/form.html', {'titulo': 'Autor', 'campo': 'Nome do Autor', 'valor': item.nome, 'url_voltar': 'autores_list'})

@login_required
def autores_delete(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Autor, id=id)
    if request.method == 'POST':
        try:
            item.delete()
            return redirect('autores_list')
        except Exception: 
             return render(request, 'catalogo/remover.html', {'titulo': 'Autor', 'nome': item.nome, 'url_voltar': 'autores_list', 'erro': 'Esse autor não pode ser removido pois está associado a um ou mais colecionáveis!' })
    return render(request, 'catalogo/remover.html', {'titulo': 'Autor', 'nome': item.nome, 'url_voltar': 'autores_list'})

@login_required
def artistas_list(request):
    if not admin_required(request):
        return redirect('colecao')
    return render(request, 'catalogo/list.html', {
        'titulo': 'Artistas',
        'itens': Artista.objects.all(),
        'url_criar': 'artistas_create',
        'url_editar': 'artistas_update',
        'url_remover': 'artistas_delete',
        'campo_nome': 'nome',
    })
    
@login_required
def artistas_create(request):
    if not admin_required(request):
        return redirect('colecao')
    if request.method == 'POST':
        nome = request.POST.get('nome')
        if nome:
            if Artista.objects.filter(nome__iexact=nome).exists():
                return render(request, 'catalogo/form.html', {'titulo': 'Artista', 'campo': 'Nome do Artista', 'url_voltar': 'artistas_list', 'erro': 'Este artista já existe!'})
            Artista.objects.create(nome=nome)
            return redirect('artistas_list')
    return render(request, 'catalogo/form.html', {'titulo': 'Artista', 'campo': 'Nome do Artista', 'url_voltar': 'artistas_list'})

@login_required
def artistas_update(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Artista, id=id)
    if request.method == 'POST':
        nome = request.POST.get('nome')
        if nome:
            item.nome = nome
            item.save()
            return redirect('artistas_list')
    return render(request, 'catalogo/form.html', {'titulo': 'Artista', 'campo': 'Nome do Artista', 'valor': item.nome, 'url_voltar': 'artistas_list'})

@login_required
def artistas_delete(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Artista, id=id)
    if request.method == 'POST':
        try:
            item.delete()
            return redirect('artistas_list')
        except Exception:
             return render(request, 'catalogo/remover.html', {'titulo': 'Artista', 'nome': item.nome, 'url_voltar': 'artistas_list', 'erro': 'Esse artista não pode ser removido pois está associado a um ou mais colecionáveis!' })
    return render(request, 'catalogo/remover.html', {'titulo': 'Artista', 'nome': item.nome, 'url_voltar': 'artistas_list'})

@login_required
def editoras_list(request):
    if not admin_required(request):
        return redirect('colecao')
    return render(request, 'catalogo/list.html', {
        'titulo': 'Editoras',
        'itens': Editora.objects.all(),
        'url_criar': 'editoras_create',
        'url_editar': 'editoras_update',
        'url_remover': 'editoras_delete',
        'campo_nome': 'nome',
    })
    
@login_required
def editoras_create(request):
    if not admin_required(request):
        return redirect('colecao')
    if request.method == 'POST':
        nome = request.POST.get('nome')
        if nome:
            if Editora.objects.filter(nome__iexact=nome).exists():
                return render(request, 'catalogo/form.html', {'titulo': 'Editora', 'campo': 'Nome da Editora', 'url_voltar': 'editoras_list', 'erro': 'Essa editora já existe!'})
            Editora.objects.create(nome=nome)
            return redirect('editoras_list')
    return render(request, 'catalogo/form.html', {'titulo': 'Editora', 'campo': 'Nome da Editora', 'url_voltar': 'editoras_list'})
   
@login_required
def editoras_update(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Editora, id=id)
    if request.method == 'POST':
        nome = request.POST.get('nome')
        if nome:
            item.nome = nome
            item.save()
            return redirect('editoras_list')
    return render(request, 'catalogo/form.html', {'titulo': 'Editora', 'campo': 'Nome da Editora', 'valor': item.nome, 'url_voltar': 'editoras_list'})

@login_required
def editoras_delete(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Editora, id=id)
    if request.method == 'POST':
        try:
            item.delete()
            return redirect('editoras_list')
        except Exception:
            return render(request, 'catalogo/remover.html', {'titulo': 'Editora', 'nome': item.nome, 'url_voltar': 'editoras_list', 'erro': 'Essa editora não pode ser removido pois está associado a um ou mais colecionáveis!' })
    return render(request, 'catalogo/remover.html', {'titulo': 'Editora', 'nome': item.nome, 'url_voltar': 'editoras_list'})

@login_required
def gravadoras_list(request):
    if not admin_required(request):
        return redirect('colecao')
    return render(request, 'catalogo/list.html', {
        'titulo': 'Gravadoras',
        'itens': Gravadora.objects.all(),
        'url_criar': 'gravadoras_create',
        'url_editar': 'gravadoras_update',
        'url_remover': 'gravadoras_delete',
        'campo_nome': 'nome',
    })
    
@login_required
def gravadoras_create(request):
    if not admin_required(request):
        return redirect('colecao')
    if request.method == 'POST':
        nome = request.POST.get('nome')
        if nome:
            if Gravadora.objects.filter(nome__iexact=nome).exists():
                return render(request, 'catalogo/form.html', {'titulo': 'Gravadora', 'campo': 'Nome da Gravadora', 'url_voltar': 'gravadoras_list', 'erro': 'Essa gravadora já existe!'})
            Gravadora.objects.create(nome=nome)
            return redirect('gravadoras_list')
    return render(request, 'catalogo/form.html', {'titulo': 'Gravadora', 'campo': 'Nome da Gravadora', 'url_voltar': 'gravadoras_list'})

@login_required
def gravadoras_update(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Gravadora, id=id)
    if request.method == 'POST':
        nome = request.POST.get('nome')
        if nome:
            item.nome = nome
            item.save()
            return redirect('gravadoras_list')
    return render(request, 'catalogo/form.html', {'titulo': 'Gravadora', 'campo': 'Nome da Gravadora', 'valor': item.nome, 'url_voltar': 'gravadoras_list'})

@login_required
def gravadoras_delete(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Gravadora, id=id)
    if request.method == 'POST':
        try:
            item.delete()
            return redirect('gravadoras_list')
        except Exception:
            return render(request, 'catalogo/remover.html', {'titulo': 'Gravadora', 'nome': item.nome, 'url_voltar': 'gravadoras_list', 'erro': 'Essa gravadora não pode ser removido pois está associado a um ou mais colecionáveis!'})
    return render(request, 'catalogo/remover.html', {'titulo': 'Gravadora', 'nome': item.nome, 'url_voltar': 'gravadoras_list'})

@login_required
def encadernacoes_list(request):
    if not admin_required(request):
        return redirect('colecao')
    return render(request, 'catalogo/list.html', {
        'titulo': 'Encadernações',
        'itens': Encadernacao.objects.all(),
        'url_criar': 'encadernacoes_create',
        'url_editar': 'encadernacoes_update',
        'url_remover': 'encadernacoes_delete',
        'campo_nome': 'nome',
    })
    
@login_required
def encadernacoes_create(request):
    if not admin_required(request):
        return redirect('colecao')
    if request.method == 'POST':
        nome = request.POST.get('nome')
        tipo = request.POST.get('tipo')
        if nome:
            if Encadernacao.objects.filter(nome__iexact=nome).exists():
                return render(request, 'catalogo/form.html', {'titulo': 'Encadernacao', 'campo': 'Nome da Encadernacao', 'url_voltar': 'encadernacoes_list', 'erro': 'Esse tipo de encadernação já existe!'})
            Encadernacao.objects.create(nome=nome, tipo_encadernacao=tipo)
            return redirect('encadernacoes_list')
    return render(request, 'catalogo/form_encadernacao.html', {'titulo': 'Encadernação', 'url_voltar': 'encadernacoes_list'})

@login_required
def encadernacoes_update(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Encadernacao, id=id)
    if request.method == 'POST':
        nome = request.POST.get('nome')
        tipo = request.POST.get('tipo')
        if nome:
            item.nome = nome
            item.tipo_encadernacao = tipo
            item.save()
            return redirect('encadernacoes_list')
    return render(request, 'catalogo/form_encadernacao.html', {'titulo': 'Encadernação', 'valor_nome': item.nome, 'valor_tipo': item.tipo_encadernacao, 'url_voltar': 'encadernacoes_list'})

@login_required
def encadernacoes_delete(request, id):
    if not admin_required(request):
        return redirect('colecao')
    item = get_object_or_404(Encadernacao, id=id)
    if request.method == 'POST':
        try:
            item.delete()
            return redirect('encadernacoes_list')
        except Exception:
             return render(request, 'catalogo/remover.html', {'titulo': 'Encadernação', 'nome': item.nome, 'url_voltar': 'encadernacoes_list', 'erro': 'Esse tipo de encadernação não pode ser removido pois está associado a um ou mais colecionáveis!'})
    return render(request, 'catalogo/remover.html', {'titulo': 'Encadernação', 'nome': item.nome, 'url_voltar': 'encadernacoes_list'})
