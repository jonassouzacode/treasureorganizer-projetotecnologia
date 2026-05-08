# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Album(models.Model):
    id_colecionavel = models.OneToOneField('Colecionavel', models.DO_NOTHING, db_column='id_colecionavel', primary_key=True)
    numero_catalogo = models.CharField(max_length=50, blank=True, null=True)
    ean_upc = models.CharField(max_length=50, blank=True, null=True)
    tipo_album = models.CharField(max_length=5)
    id_gravadora = models.ForeignKey('Gravadora', models.DO_NOTHING, db_column='id_gravadora', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'album'


class AlbumArtista(models.Model):
    pk = models.CompositePrimaryKey('id_colecionavel', 'id_artista')
    id_colecionavel = models.ForeignKey('Colecionavel', models.DO_NOTHING, db_column='id_colecionavel')
    id_artista = models.ForeignKey('Artista', models.DO_NOTHING, db_column='id_artista')

    class Meta:
        managed = False
        db_table = 'album_artista'


class Artista(models.Model):
    nome = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'artista'


class Autor(models.Model):
    nome = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'autor'


class Colecao(models.Model):
    pk = models.CompositePrimaryKey('id_usuario', 'id_colecionavel')
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='id_usuario')
    id_colecionavel = models.ForeignKey('Colecionavel', models.DO_NOTHING, db_column='id_colecionavel')
    data_aquisicao = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'colecao'


class Colecionavel(models.Model):
    tipo_colecionavel = models.CharField(max_length=5)
    titulo = models.CharField(max_length=255)
    ano_lancamento = models.IntegerField(blank=True, null=True)
    id_genero = models.ForeignKey('Genero', models.DO_NOTHING, db_column='id_genero', blank=True, null=True)
    id_idioma = models.ForeignKey('Idioma', models.DO_NOTHING, db_column='id_idioma', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'colecionavel'


class Editora(models.Model):
    nome = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'editora'


class Encadernacao(models.Model):
    nome = models.CharField(max_length=50)
    tipo_encadernacao = models.CharField(max_length=2)

    class Meta:
        managed = False
        db_table = 'encadernacao'


class Genero(models.Model):
    genero = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'genero'


class Gravadora(models.Model):
    nome = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'gravadora'


class Idioma(models.Model):
    idioma = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'idioma'


class ListaDesejos(models.Model):
    pk = models.CompositePrimaryKey('id_usuario', 'id_colecionavel')
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='id_usuario')
    id_colecionavel = models.ForeignKey(Colecionavel, models.DO_NOTHING, db_column='id_colecionavel')
    data_adicao = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'lista_desejos'


class Livro(models.Model):
    id_colecionavel = models.OneToOneField(Colecionavel, models.DO_NOTHING, db_column='id_colecionavel', primary_key=True)
    isbn = models.CharField(unique=True, max_length=13)
    id_tipo_encadernacao = models.ForeignKey(Encadernacao, models.DO_NOTHING, db_column='id_tipo_encadernacao', blank=True, null=True)
    id_editora = models.ForeignKey(Editora, models.DO_NOTHING, db_column='id_editora', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'livro'


class LivrosAutor(models.Model):
    pk = models.CompositePrimaryKey('isbn', 'id_autor')
    isbn = models.ForeignKey(Livro, models.DO_NOTHING, db_column='isbn', to_field='isbn')
    id_autor = models.ForeignKey(Autor, models.DO_NOTHING, db_column='id_autor')

    class Meta:
        managed = False
        db_table = 'livros_autor'


class Usuario(models.Model):
    nome = models.CharField(max_length=100)
    email = models.CharField(unique=True, max_length=100)
    senha = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'usuario'
