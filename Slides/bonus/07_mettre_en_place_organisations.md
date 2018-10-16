# Mettre en place des organisations de travail

<!-- .slide: class="page-title" -->



## Plan

<!-- .slide: class="toc" -->

- **[Introduction](#/1)**
- [Fonctionnement de Git](#/2)
- [Utiliser Git en local](#/3)
- [Les références](#/4)
- [Utiliser Git en distant](#/5)
- [Configuration et outils externes](#/6)
- **[Mettre en place des organisations de travail](#/7)**
- [Administration des entrepôts](#/8)
- [Les sous modules](#/9)
- [Projets OpenSource & Pull Requests](#/10)

Notes :



## Des organisations de travail

- Git est entièrement modulaire
- Git n'impose pas de cadre d'utilisation
- Facilité de faire et d'utiliser des branches
- Les DVCS permettent de dégager plusieurs patterns
  - Pas impossible avec un CVCS mais beaucoup plus coûteux

Notes :



## Des organisations de travail

- Questions :
  - Quelle stratégie de versionning avez-vous adoptée ?
  - Utilisez-vous et combien de branches avez-vous ?
  - Avez-vous une organisation ?
  - Tout le monde en est content ?

Notes :



## Des organisations de travail

- Plusieurs types d'organisations :
  - Organisation personnelle

    Correspond à la manière dont le développeur travaille sur son poste local

  - Organisation de projet

    Correspond à la manière dont les membres du projet partage leur code

  - Organisation globale

    Correspond à la manière dont les différents projets s'organisent entre eux

Notes :



## Des organisations de travail

- 2 types d'entrepôts :
  - Entrepôts publiques

    Serveur Git depuis lequel les développeurs récupèrent les sources officielles

  - Entrepôts de développeur

    Serveur Git permettant à un développeur de publier son travail et de le rendre disponible

Notes :



## Organisation personnelle

- Développement dans le tronc
- Utilisation "basique"

![](bonus/ressources/images/07_mettre_en_place_organisations/personal_simple.png)

Notes :



## Organisation personnelle

- Branche par fonctionnalité
- *master* = branche d'intégration
- Publier les branches de développement si elles sont reprises par d'autres
- Fusion des branches quand les fonctionnalités sont terminées

![](bonus/ressources/images/07_mettre_en_place_organisations/personal_full.png)

Notes :



## Les organisations de projets

- L'utilisation et la facilité de créer des branches permet de pousser les scénarii plus loin qu'avec les CVCS
- Modélisation de la chaîne de vie du projet
- La topologie reste généralement la même mais la symbolique change

Notes :



## Les organisations de projets

- Des branches par étapes :
  - Branche d'intégration
  - Branche de livraison
  - Branche de maintenance

![](bonus/ressources/images/07_mettre_en_place_organisations/orga_step.png)

Notes :



## Les organisations de projets

- Des branches par environnements
  - Branche de production
  - Branche de recette
  - Branche de développement
  - Branche de site utilisateur

![](bonus/ressources/images/07_mettre_en_place_organisations/orga_env.png)

Notes :



## Organisation globale

- Organisation "centralisée"

![](bonus/ressources/images/07_mettre_en_place_organisations/centralized.png)

Notes :



## Le serveur central

- Avantages :
  - Les développeurs publient sur un dépôt partagé
  - Facilité pour les migrations depuis un outil de gestion de version centralisé comme SVN
  - Partage rapide des sources

- Inconvénients :
  - Chaque développeur doit intégrer son travail à celui des autres avant de publier
  - Si toutes les branches sont partagées, l'historique n'est pas lisible

Notes :



## Niveau d'organisation

- Organisation avec intégrateur

![](bonus/ressources/images/07_mettre_en_place_organisations/integrator.png)

Notes :



## L'intégrateur

- Avantages :
  - Les développeurs ont chacun des dépots personnels publiques
  - Un intégrateur rassemble le travail pour créer les versions de livraison dans un dépôt publique officiel
  - L'historique peut être nettoyé, ordonné et publié de manière centralisé

- Inconvénients :
  - Le partage des sources de chaque développeur peut être long, prévoir des cycles de développements courts
  - Ne pas intégrer à la dernière minute

Notes :

Montrer la commande `git rerere` pour préparer les merges et pouvoir les rejouer



## Niveau d'organisation

- Organisation du "dictateur bienveillant"

![](bonus/ressources/images/07_mettre_en_place_organisations/dictator.png)

Notes :



## Le "dictateur bienveillant"

- Avantages :
  - Modèle du noyau Linux
  - Le modèle pyramidal est utile pour les projets multi-équipes

- Inconvénients :
  - Nécessite beaucoup d'organisation
  - Les releases sont minutieusement préparées

Notes :



<!-- .slide: class="page-questions" -->
