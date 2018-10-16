# Projets OpenSource & Pull Requests

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
- [Les sous modules](#/9)
- **[Projets OpenSource & Pull Requests](#/10)**

Notes :



## Projet Open Source

- Logiciel dont le code source est mis à disposition gratuitement
- Utilisation d'une licence validée par la FSF (Free Software Foundation) :
  - GPL, LGPL
  - ASF, BSD, MIT, EPL
  - Si pas de licence présente : all rights reserved (mais dépend du site hébergeur)

- Mise à disposition de documentation
  - Pour les utilisateurs
  - Pour les développeurs

Notes :



## Projet Open Source

- Afin de faciliter les contributions externes :
  - Avoir un projet facile à builder (Maven, Gradle, Makefile, etc.)
  - Avoir un projet facile à démarrer (pour pouvoir tester rapidement une modification locale)
  - Avoir un bugtracker

- Fournir des règles à respecter :
  - Style de code / Contenu d'un message de commit
  - Présence de tests correspondants à une fonctionnalité

- Éventuellement :
  - Signature d'un CLA (Contributor Licence Agreement)

Notes :



## Contributions externes

- Sans DVCS :
  - Accès direct au repository : réservé aux contributeurs officiels
  - Envoi de patchs au format *diff*, en PJ d'une fiche de bugtracker, par email

- Avec un DVCS :
  - Notion de pull request : mise en avant par GitHub, reprise par l'ensemble des autres outils (merge request, etc...)
  - Pull request :
    - "à la main" : mise à disposition d'une branche sur un repo personnel public, ajout d'un remote, merge manuel
    - "avec un outil" : utilisation des assistants fournis, fils de discussion, commentaires au sein du code, etc

Notes :



## Pull request GitHub

- Workflow :
  - Fork GitHub du projet par l'utilisateur <img style="display: inline; margin: auto auto auto 1em;" src="bonus/ressources/images/10_oss_pullrequests/fork.png"/>
  - Clone du projet
  - Création d'une branche locale, modifications, commits
  - Push de la branche locale sur le fork GitHub
  - Création d'une pull request de la branche <img style="display: inline; margin: auto auto auto 1em;" src="bonus/ressources/images/10_oss_pullrequests/pull_request.png"/>
    - Du fork vers le projet principal
  - Discussion avec un contributeur du projet
  - Ajout éventuel de commits / corrections
  - Merge
  - Fermeture de la pull request

Notes :



<!-- .slide: class="page-questions" -->



<!-- .slide: class="page-tp8" -->
