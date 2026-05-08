from django.contrib.auth.decorators import login_required
from datetime import date
from django.shortcuts import render, redirect, get_object_or_404
from .models import Colecionavel, Livro, Album, LivrosAutor, AlbumArtista, Colecao, ListaDesejos
from catalogo.models import Genero, Idioma, Encadernacao, Editora, Gravadora, Autor, Artista

@login_required
def colecao(request):
    colecao = Colecao.objects.filter(id_usuario=request.user.id)
    desejos = ListaDesejos.objects.filter(id_usuario=request.user.id)
    
    buscar = request.GET.get('buscar')
    tipo = request.GET.get('tipo')
    id_genero = request.GET.get('id_genero')
    id_idioma = request.GET.get('id_idioma')
    ano_min = request.GET.get('ano_min')
    ano_max = request.GET.get('ano_max')
    tipo_album = request.GET.get('tipo_album')

    if buscar:
        colecao = colecao.filter(id_colecionavel__titulo__icontains=buscar)
        desejos = desejos.filter(id_colecionavel__titulo__icontains=buscar)
    if tipo:
        colecao = colecao.filter(id_colecionavel__tipo_colecionavel=tipo)
        desejos = desejos.filter(id_colecionavel__tipo_colecionavel=tipo)
    if id_genero:
        colecao = colecao.filter(id_colecionavel__id_genero=id_genero)
        desejos = desejos.filter(id_colecionavel__id_genero=id_genero)
    if id_idioma:
        colecao = colecao.filter(id_colecionavel__id_idioma=id_idioma)
        desejos = desejos.filter(id_colecionavel__id_idioma=id_idioma)
    if ano_min:
        colecao = colecao.filter(id_colecionavel__ano_lançamento__gte=ano_min)
        desejos = desejos.filter(id_colecionavel__ano_lançamento__gte=ano_min)
    if ano_max:
        colecao = colecao.filter(id_colecionavel__ano_lançamento__lte=ano_max)
        desejos = desejos.filter(id_colecionavel__ano_lançamento__lte=ano_max)
    if tipo_album:
        colecao = colecao.filter(id_colecionavel__album__tipo_album=tipo_album)
        desejos = desejos.filter(id_colecionavel__album__tipo_album=tipo_album)
    
    for item in colecao:
        col = item.id_colecionavel
        if col.tipo_colecionavel == 'Livro':
            try:
                livro = Livro.objects.get(id_colecionavel=col)
                col.extra_autores = ', '.join([la.id_autor.nome for la in LivrosAutor.objects.filter(isbn=livro)])
                col.extra_editora = livro.id_editora.nome if livro.id_editora else ''
                col.extra_encadernacao = livro.id_tipo_encadernacao.nome if livro.id_tipo_encadernacao else ''
                col.extra_isbn = livro.isbn
            except Livro.DoesNotExist:
                col.extra_autores = ''
                col.extra_editora = ''
                col.extra_encadernacao = ''
                col.extra_isbn = ''
        elif col.tipo_colecionavel == 'Album':
            try:
                album = Album.objects.get(id_colecionavel=col)
                col.extra_artistas = ', '.join([aa.id_artista.nome for aa in AlbumArtista.objects.filter(id_colecionavel=col)])
                col.extra_gravadora = album.id_gravadora.nome if album.id_gravadora else ''
                col.extra_tipo_album = album.tipo_album
            except Album.DoesNotExist:
                col.extra_artistas = ''
                col.extra_gravadora = ''
                col.extra_tipo_album = ''
                
    for item in desejos:
        col = item.id_colecionavel
        if col.tipo_colecionavel == 'Livro':
            try:
                livro = Livro.objects.get(id_colecionavel=col)
                col.extra_autores = ', '.join([la.id_autor.nome for la in LivrosAutor.objects.filter(isbn=livro)])
                col.extra_editora = livro.id_editora.nome if livro.id_editora else ''
                col.extra_encadernacao = livro.id_tipo_encadernacao.nome if livro.id_tipo_encadernacao else ''
                col.extra_isbn = livro.isbn
            except Livro.DoesNotExist:
                col.extra_autores = ''
                col.extra_editora = ''
                col.extra_encadernacao = ''
                col.extra_isbn = ''
        elif col.tipo_colecionavel == 'Album':
            try:
                album = Album.objects.get(id_colecionavel=col)
                col.extra_artistas = ', '.join([aa.id_artista.nome for aa in AlbumArtista.objects.filter(id_colecionavel=col)])
                col.extra_gravadora = album.id_gravadora.nome if album.id_gravadora else ''
                col.extra_tipo_album = album.tipo_album
            except Album.DoesNotExist:
                col.extra_artistas = ''
                col.extra_gravadora = ''
                col.extra_tipo_album = ''
    
    return render(request, 'colecionaveis/colecao.html', {
        'colecao': colecao,
        'desejos': desejos,
    })

def get_catalogo_context(user_id):
    return {
        'generos': Genero.objects.all(),
        'idiomas': Idioma.objects.all(),
        'autores': Autor.objects.all(),
        'artistas': Artista.objects.all(),
        'editoras': Editora.objects.all(),
        'gravadoras': Gravadora.objects.all(),
        'encadernacoes': Encadernacao.objects.all(),
        'colecionaveis_existentes': Colecionavel.objects.filter(
            colecao__id_usuario=user_id
        ),
    }

def criar_colecionavel(request):
    tipo = request.POST.get('tipo')
    titulo = request.POST.get('titulo')
    ano = request.POST.get('ano') or None
    id_genero = request.POST.get('id_genero') or None
    id_idioma = request.POST.get('id_idioma') or None

    colecionavel = Colecionavel.objects.create(
        tipo_colecionavel=tipo,
        titulo=titulo,
        ano_lançamento=ano,
        id_genero_id=id_genero,
        id_idioma_id=id_idioma,
    )

    if tipo == 'Livro':
        isbn = request.POST.get('isbn')
        id_editora = request.POST.get('id_editora') or None
        id_encadernacao = request.POST.get('id_encadernacao') or None

        livro_existente = Livro.objects.filter(isbn=isbn).first()
        if livro_existente:
            colecionavel.delete()
            colecionavel = livro_existente.id_colecionavel
        else:
            livro = Livro.objects.create(
                id_colecionavel=colecionavel,
                isbn=isbn,
                id_editora_id=id_editora,
                id_tipo_encadernacao_id=id_encadernacao,
            )
            for id_autor in request.POST.getlist('autores'):
                LivrosAutor.objects.create(isbn=livro, id_autor_id=id_autor)

    elif tipo == 'Album':
        id_gravadora = request.POST.get('id_gravadora') or None
        tipo_album = request.POST.get('tipo_album')
        numero_catalogo = request.POST.get('numero_catalogo') or None
        ean_upc = request.POST.get('ean_upc') or None
        album = Album.objects.create(
            id_colecionavel=colecionavel,
            tipo_album=tipo_album,
            id_gravadora_id=id_gravadora,
            numero_catalogo=numero_catalogo,
            ean_upc=ean_upc,
        )
        for id_artista in request.POST.getlist('artistas'):
            AlbumArtista.objects.create(id_colecionavel=colecionavel, id_artista_id=id_artista)

    return colecionavel

@login_required
def adicionar_colecao(request):
    if request.method == 'POST':
        colecionavel = criar_colecionavel(request)
        if colecionavel is None:
            context = get_catalogo_context(request.user.id)
            context['destino_titulo'] = 'Adicionar à Coleção'
            context['erro'] = 'Este ISBN já existe na base de dados!'
            return render(request, 'colecionaveis/adicionar.html', context)
        Colecao.objects.create(
            id_usuario=request.user.id,
            id_colecionavel=colecionavel,
            data_aquisicao=request.POST.get('data_aquisicao') or None
        )
        return redirect('colecao')
    context = get_catalogo_context(request.user.id)
    context['destino_titulo'] = 'Adicionar à Coleção'
    return render(request, 'colecionaveis/adicionar.html', context)

@login_required
def adicionar_desejos(request):
    if request.method == 'POST':
        colecionavel = criar_colecionavel(request)
        if colecionavel is None:
            context = get_catalogo_context(request.user.id)
            context['destino_titulo'] = 'Adicionar à Lista de Desejos'
            context['erro'] = 'Este ISBN já existe na base de dados!'
            return render(request, 'colecionaveis/adicionar.html', context)
        ListaDesejos.objects.create(
            id_usuario=request.user.id,
            id_colecionavel=colecionavel
        )
        return redirect('colecao')
    context = get_catalogo_context(request.user.id)
    context['destino_titulo'] = 'Adicionar à Lista de Desejos'
    return render(request, 'colecionaveis/adicionar.html', context)

@login_required
def editar_colecionavel(request, id):
    colecionavel = get_object_or_404(Colecionavel, id=id)
    if request.method == 'POST':
        colecionavel.titulo = request.POST.get('titulo')
        colecionavel.ano_lançamento = request.POST.get('ano') or None
        colecionavel.id_genero_id = request.POST.get('id_genero') or None
        colecionavel.id_idioma_id = request.POST.get('id_idioma') or None
        colecionavel.save()

        if colecionavel.tipo_colecionavel == 'Livro':
            livro = get_object_or_404(Livro, id_colecionavel=colecionavel)
            livro.isbn = request.POST.get('isbn')
            livro.id_editora_id = request.POST.get('id_editora') or None
            livro.id_tipo_encadernacao_id = request.POST.get('id_encadernacao') or None
            livro.save()
            LivrosAutor.objects.filter(isbn=livro).delete()
            for id_autor in request.POST.getlist('autores'):
                LivrosAutor.objects.create(isbn=livro, id_autor_id=id_autor)

        elif colecionavel.tipo_colecionavel == 'Album':
            album = get_object_or_404(Album, id_colecionavel=colecionavel)
            album.tipo_album = request.POST.get('tipo_album')
            album.id_gravadora_id = request.POST.get('id_gravadora') or None
            album.numero_catalogo = request.POST.get('numero_catalogo') or None
            album.ean_upc = request.POST.get('ean_upc') or None
            album.save()
            AlbumArtista.objects.filter(id_colecionavel=colecionavel).delete()
            for id_artista in request.POST.getlist('artistas'):
                AlbumArtista.objects.create(id_colecionavel=colecionavel, id_artista_id=id_artista)

        return redirect('colecao')

    context = get_catalogo_context(request.user.id)
    context['colecionavel'] = colecionavel

    if colecionavel.tipo_colecionavel == 'Livro':
        try:
            livro = Livro.objects.get(id_colecionavel=colecionavel)
            context['livro'] = livro
            context['autores_selecionados'] = list(LivrosAutor.objects.filter(isbn=livro).values_list('id_autor_id', flat=True))
        except Livro.DoesNotExist:
            pass

    elif colecionavel.tipo_colecionavel == 'Album':
        try:
            album = Album.objects.get(id_colecionavel=colecionavel)
            context['album'] = album
            context['artistas_selecionados'] = list(AlbumArtista.objects.filter(id_colecionavel=colecionavel).values_list('id_artista_id', flat=True))
        except Album.DoesNotExist:
            pass

    return render(request, 'colecionaveis/editar.html', context)

@login_required
def remover_colecao(request, id):
    item = get_object_or_404(Colecao, id_colecionavel_id=id, id_usuario=request.user.id)
    if request.method == 'POST':
        item.delete()
        return redirect('colecao')
    return render(request, 'colecionaveis/remover.html', {
        'nome': item.id_colecionavel.titulo,
        'url_voltar': 'colecao'
    })

@login_required
def remover_desejo(request, id):
    item = get_object_or_404(ListaDesejos, id_colecionavel_id=id, id_usuario=request.user.id)
    if request.method == 'POST':
        item.delete()
        return redirect('colecao')
    return render(request, 'colecionaveis/remover.html', {
        'nome': item.id_colecionavel.titulo,
        'url_voltar': 'colecao'
    })

@login_required
def mover_para_desejos(request, id):
    item = get_object_or_404(Colecao, id_colecionavel_id=id, id_usuario=request.user.id)
    if request.method == 'POST':
        ListaDesejos.objects.create(
            id_usuario=request.user.id,
            id_colecionavel=item.id_colecionavel
        )
        item.delete()
        return redirect('colecao')
    return render(request, 'colecionaveis/mover.html', {
        'nome': item.id_colecionavel.titulo,
        'destino': 'Lista de Desejos',
        'url_voltar': 'colecao'
    })

@login_required
def mover_para_colecao(request, id):
    item = get_object_or_404(ListaDesejos, id_colecionavel_id=id, id_usuario=request.user.id)
    if request.method == 'POST':
        Colecao.objects.create(
            id_usuario=request.user.id,
            id_colecionavel=item.id_colecionavel,
            data_aquisicao=date.today()  # ← data de hoje
        )
        item.delete()
        return redirect('colecao')
    return render(request, 'colecionaveis/mover.html', {
        'nome': item.id_colecionavel.titulo,
        'destino': 'Coleção',
        'url_voltar': 'colecao'
    })