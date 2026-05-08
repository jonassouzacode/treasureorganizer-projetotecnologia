from django.db import models

class Artista(models.Model):
    nome = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'artista'

    def __str__(self):
        return self.nome

class Autor(models.Model):
    nome = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'autor'

    def __str__(self):
        return self.nome

class Editora(models.Model):
    nome = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'editora'

    def __str__(self):
        return self.nome

class Encadernacao(models.Model):
    nome = models.CharField(max_length=50)
    tipo_encadernacao = models.CharField(max_length=50)  # ← já atualizado para VARCHAR

    class Meta:
        managed = False
        db_table = 'encadernacao'

    def __str__(self):
        return f'{self.nome} ({self.tipo_encadernacao})'

class Genero(models.Model):
    genero = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'genero'

    def __str__(self):
        return self.genero

class Gravadora(models.Model):
    nome = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'gravadora'

    def __str__(self):
        return self.nome

class Idioma(models.Model):
    idioma = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'idioma'

    def __str__(self):
        return self.idioma