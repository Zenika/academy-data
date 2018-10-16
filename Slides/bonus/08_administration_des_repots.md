# Administration des entrepôts

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
- **[Administration des entrepôts](#/8)**
- [Les sous modules](#/9)
- [Projets OpenSource & Pull Requests](#/10)

Notes :



## Administration

- Git est un système distribué
  - Il n'y a pas de serveurs à proprement parler

- Différences entre client & serveurs
  - C'est une question de choix de topologie

- L'administration se résume à donner des droits d'accès aux utilisateurs

Notes :



## Moyens de partager son entrepôt

- Partage via le système de fichiers (NFS, etc...)
- Partage par `git-daemon`
- Partage par serveur ssh
- Gitosis / Gitolite
- Partage HTTP (via `Apache/git-http-backend`)
- GitHub / Bitbucket Cloud
- GitLab / Bitbucket Server

Notes :



## Partage via le système de fichiers

- Utilisation des comptes Unix
- Chaque commiter doit avoir un compte sur le serveur
- Chaque commiter doit appartenir au groupe qui a accès en écriture
- Gestion manuelle de qui a accès en lecture ou en écriture
- Solution non sécurisée
- Cette solution n'est pas idéale

Notes :



## Partage via serveurs SSH

- Idem que pour le partage via le système de fichier
- Solution sécurisé
- Comment se partager les clés publiques ?
- Cette solution n'est pas idéale

Notes :



## Partage via git-daemon

- Utilisation du protocole `git://`
- Communication TCP plus fiable et plus efficace
- Simple à mettre en place
- Gestion des utilisateurs via les comptes Unix

Notes :



## Gitosis

- Couche de contrôle d'accès
  - Utilisation d'un seul utilisateur Unix réel sur le serveur
  - Fournit l'accès à de nombreux utilisateurs à l'entrepôt
  - Ces utilisateurs n'ont pas accès au serveur
- Contrôle d'accès en lecture & écriture au niveau de l'entrepôt
- Peut être installé sans accès administrateur sur la machine
- Git & Python installé
- Authentification par SSH
- Il n'est plus maintenu depuis 2009

Notes :



## Gitolite

- Version plus évoluée de Gitosis
  - Contrôle d'accès en lecture au niveau de l'entrepôt
  - Contrôle d'accès en écriture à un niveau branche/tag/fichier/répertoire
  - Contrôle de qui à les droits pour créer/supprimer des branches/tags
- Peut être installé sans accès administrateur sur la machine
- Git & perl installé
- Authentification par SSH mais aussi HTTP

Notes :



## Entreprise GitHub

- GitHub "à la maison"
- Plus qu'un simple serveur Git
  - Bug Tracking
  - Wiki
  - Social coding

- Payant aux nombres d'utilisateurs
  - Licence gratuite d'essai pour 45 jours

Notes :



## GitLab

- Hébergement de projets
- Revue de code
- Gestion de projet
- Visualisation de l'historique
- Wiki
- Notifications
- Comptes utilisateurs
- Version payante

Notes :



## Bonnes pratiques

- Pas de modifications localement sur l'entrepôt !
- Exemple d'administration :
  - On clône l'entrepôt
  - On le modifie
  - On publie

- Attention aux manipulations d'historique sur les entrepôts publiques

Notes :



<!-- .slide: class="page-questions" -->
