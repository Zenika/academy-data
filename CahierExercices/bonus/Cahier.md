 <div style="height:24.7cm; position: relative; border: 1px solid black;">
    <h1 style="position:absolute; top: 33%; width:100%; text-align: center;">{Titre-Formation}</h1>
    <h1 style="position:absolute; top: 50%; width:100%; text-align: center;">Travaux Pratiques<br />Bonus</h1>
    <img src="../ressources/logo-zenika-small.png" style="position: absolute; bottom: 20px; right: 20px; height: 150px;">
</div>
<div class="pb"></div>

## TP7 – Sous-Modules

- Si l'accès à internet est disponible :
  - Créer un sous-module dans un répertoire **lib**, pointant sur le projet GitHub de votre choix (par exemple https://github.com/apache/commons-lang.git)
- S'il n'y a pas accès à internet :
  - Créer un sous-module dans un répertoire **lib**, pointant sur un projet indiqué par le formateur
- Consulter le contenu du fichier **.gitmodules**
- Faites un commit, observer le contenu du commit qui vient d'être créé
- Clone d'un projet avec sous-modules :
  - Dans un nouveau répertoire, faire un clone du projet principal (celui dans lequel le sous-module a été créé) nommé *myclone*
  - Observer le contenu du répertoire **lib**
  - Mettre à jour le contenu du répertoire
- Revenir dans le projet principal, se placer dans le sous-module **lib**, faire une modification et un commit
- Au niveau du projet principal, faire un `git status`
- Faire un commit dans le projet principal
- Retourner dans le projet *myclone* :
  - Faire un fetch puis un merge
  - Observer et expliquer l'erreur apparue


<div class="pb"></div>


## TP8 – Mise en place de Gerrit

Ce TP est basé sur la version 2.5 de Gerrit

### Création d'une clé SSH pour gerrit (pour ne pas écraser les clés existantes) :

- Lancer : `ssh-keygen -t rsa -C "prenom.nom@mail.com" -f ~/.ssh/id_rsa_gerrit`
- Lancer : `ssh-add ~/.ssh/id_rsa_gerrit`

### Installation Gerrit

- Télécharger le war Gerrit depuis https://gerrit-releases.storage.googleapis.com/index.html
- Se placer dans le répertoire de téléchargement et renommer le war télécharger en **gerrit.war**
- Executer la commande : `java -jar gerrit.war init --batch -d ~/gerrit_install`
  - Gerrit s'installe avec les paramètres par défaut
  - ⚠ Cette installation ne doit pas être utilisée pour un environnement de production
- Arrêter Gerrit :
  - dans le répertoire **~/gerrit_install**, lancer la commande `./bin/gerrit.sh stop`
- Editer le fichier **~/gerrit_install/etc/gerrit.config** et changer les paramètres suivants :
  - canonicalWebUrl = http://localhost:9090/
  - type = DEVELOPMENT_BECOME_ANY_ACCOUNT
  - listenUrl = http://*:9090/
- Redémarrer Gerrit :
  - dans le répertoire **~/gerrit_install**, lancer la commande `./bin/gerrit.sh start`
- Accéder à Gerrit via l'URL http://localhost:9090
- Cliquer sur le lien "Become" en haut à droite et cliquer sur le bouton "new account" dans la partie "Register"
  - Remplir les champs Full Name / USERNAME
  - Pour le champ "Register New Email", il est impératif que l'email indiquée soit la même que celle présente dans les commits (champ `user.email` de la configuration Git)
  - Copier le contenu du fichier **id_rsa_gerrit.pub** dans la textarea SSH Public Key
- Tester la connection SSH avec la commande : `ssh -T USERNAME@localhost -p 29418`

### Configuration des droits d'accès

- Dans 'Projects > List > All-Projects > Access', configurer les différents éléments afin d'obtenir la configuration suivante :

![](bonus/ressources/images/gerrit_acl.png)

### Création d'un projet sur Gerrit

- `ssh -p 29418 USERNAME@localhost gerrit create-project --name resaroute`
- Dans le répertoire de resaroute : `git push ssh://USERNAME@localhost:29418/resaroute *:*`

### Clone et première modification

- Faire un clone du projet git-training à partir de Gerrit : `git clone ssh://USERNAME@localhost:29418/resaroute resaroute-gerrit`
- Ajouter le hook Change-Id avec la commande : `scp -p -P 29418 USERNAME@localhost:hooks/commit-msg .git/hooks/`
- Faire une modification et un commit local
- Publier la modification vers Gerrit : `git push origin master:refs/for/master`

### Gestion des patchs et revue de code

- Accéder à l'URL http://localhost:9090 et utiliser les commandes disponibles pour faire la revue de code
- Passage de la modification à l'état "Merged" :
  - Soit : Pousser directement la modification dans la branche *master*
  - Soit : Utiliser le bouton "Submit"
