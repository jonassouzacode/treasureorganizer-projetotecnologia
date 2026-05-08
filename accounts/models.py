from django.contrib.auth.models import AbstractUser
from django.db import models

class Utilizador(AbstractUser):
    ADMIN = 'admin'
    USER = 'user'
    ROLES = [(ADMIN, 'Administrador'), (USER, 'Utilizador')]
    
    role = models.CharField(max_length=10, choices=ROLES, default=USER)
    
    def is_admin(self):
        return self.role == self.ADMIN