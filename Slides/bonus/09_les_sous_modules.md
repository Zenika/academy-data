# Les sous modules

<!-- .slide: class="page-title" -->


## Plan

<!-- .slide: class="toc" -->

- [Introduction](#/1)
- [Fonctionnement de Git](#/2)
- [Utiliser Git en local](#/3)
- [Les références](#/4)
- [Utiliser Git en distant](#/5)
- [Configuration et outils externes](#/6)
- [Mettre en place des organisations de travail](#/7)
- [Administration des entrepôts](#/8)
- **[Les sous modules](#/9)**
- [Projets OpenSource & Pull Requests](#/10)

Notes :



## Les sous modules

- Inclusions des sources d'autres projets dans votre projet
- Permet de
  - créer des projets "chapeaux"
  - d'éviter la duplication de code dans plusieurs projets

- Fonctionnement basé sur un fichier `.gitmodules`
- `.gitmodules` : Fichier de mapping entre un répertoire et un couple repository
- Un commit dans le projet chapeau référence le commit courant du sous-module

Notes :



## Les sous modules

- Ajout d'un sous-module à un projet :
  - `git submodule add REPO_URL DEST_DIR`

- Initialisation des sous-modules d'un projet fraîchement cloné :
  - `git submodule init`

- Mise à jour du contenu d'un sous-module
  - `git submodule update`

Notes :



## Les sous modules

- Inconvénients : à utiliser avec parcimonie
  - Peu ou pas supporté par les outils autres que la ligne de commande
  - Duplications des commandes de mise à jour
  - Obliger de mettre à jour le projet parent pour "voir" les modifications du sous-module
  - Nécessite des commandes "wrapper" pour éviter les oublis de push des sous-modules

Notes :



<!-- .slide: class="page-questions" -->



<!-- .slide: class="page-tp7" -->
