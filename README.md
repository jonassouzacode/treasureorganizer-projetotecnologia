# treasureorganizer-projetotecnologia
Repositório do projeto de tecnologia "Treasure Organizer"

## Sobre o Projeto

O TreasureOrganizer permite ao colecionador gerir a sua coleção digitalmente, 
sem precisar recorrer às prateleiras para saber o que possui. Possui dois tipos 
de perfil: administrador e utilizador.

## Funcionalidades

**Utilizador**
- Gerir coleção pessoal de livros e álbuns (adicionar, editar, remover)
- Lista de desejos com transferência direta para a coleção e vice-versa
- Filtros por título, genero, idioma, autor/artista, ano de lançamento, tipo, entre outros atributos

**Administrador**
- Gerir o catálogo da aplicação (artistas, autores, generos, idiomas, editoras, gravadoras, tipos de encadernação)

## Tecnologias

- Python / Django
- MySQL
- HTML, CSS, JavaScript, Lucide Icons

## Instalação

> Requer MySQL com a base de dados `treasureorganizer` configurada.

## Estrutura

- `accounts/` — autenticação e modelo de utilizador
- `catalogo/` — gestão do catálogo pelo administrador
- `colecionaveis/` — coleção e lista de desejos do utilizador
- `templates/` — páginas HTML

## Documentação

Relatório e apresentação disponíveis na pasta `/docs`.