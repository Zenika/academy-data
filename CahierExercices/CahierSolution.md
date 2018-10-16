<div style="height:24.7cm; position: relative; border: 1px solid black;">
    <h1 style="position:absolute; top: 33%; width:100%; text-align: center;">{Titre-Formation}</h1>
    <h1 style="position:absolute; top: 50%; width:100%; text-align: center;">Travaux Pratiques - Solution</h1>
    <img src="ressources/logo-zenika-small.png" style="position: absolute; bottom: 20px; right: 20px; height: 150px;">
</div>
<div class="pb"></div>

## TP1 – Installation et création du dépôt Git

### Installation de Git

#### Windows

##### Msysgit

Télécharger et installer Msysgit : http://git-scm.com/download/win

##### Cygwin

Cette solution vous permettra de profiter d'un environnement UNIX complet
- Télécharger Cygwin : http://cygwin.com/setup.exe
- Installer Cygwin avec les packages suivants :
  - git
  - git-completion
  - git-gui
  - gitk
  - vim
- Configurer vim :

```bash
$ cp /usr/share/vim/vim73/vimrc_example.vim ~/.vimrc
```

#### UNIX

Installer les packages :
- git
- git-gui
- gitk

#### Mac


### Vérification

```bash
$ git --version
git version 1.8.4.3
```

### Première configuration

```bash
$ git config --global user.name "Zenika"

$ git config --get user.name
Zenika

$ git config --global user.email "training@zenika.com"

$ git config --get user.email
training@zenika.com

$ git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"

$ git config --global color.ui auto

$ git config --get color.auto true
```

### Initialisation du projet

```bash
$ git init resaroute
Initialized empty Git repository in /home/user/resaroute/.git/

$ cd resaroute
```

<div class="pb"></div>

## TP2 – Démarrage du projet

### Première idée

```bash
$ echo "L'agence de voyages Resanet a décidé de lancer le projet "resaroute", ce projet a pour but de créer une application unique d'aspiration d'informations sur les sites de transports publics tels celui de la SNCF.
Les premières idées du projet sont présentes et vont évoluer au fur et à mesure. Le projet va aussi devoir débuter sous peu. Un système de versioning va devenir plus qu'important.
L'objectif principal est de mettre en place et gérer les premiers événements de ce dépôt Git." > README.txt

$ echo "Sites à scanner :
 - voyages-sncf.com
 - ryanair.com
 - eurolines.fr
 - eurostar.com

Couleurs de l'application :
Rouge sur fond vert

Titre de l'application :
Resaspi" > TODO.txt

$ git add README.txt TODO.txt

$ git status
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

    new file: README.txt
    new file: TODO.txt
```

### Validation des idées

```bash
$ git rm --cached TODO.txt
rm 'TODO.txt'

$ git status
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

    new file: README.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    TODO.txt

$ git commit -m "Initialisation du projet

Ajout du fichier README.txt décrivant le projet"
[master (root-commit) a55c92b] Initialisation du projet
 1 files changed, 3 insertions(+)
 create mode 100644 README.txt

$ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    TODO.txt

nothing added to commit but untracked files present (use "git add" to track)

$ git add TODO.txt

$ git commit -m "Définition des tâches à effectuer

Création du fichier TODO.txt listant toutes les tâches actuellement prévues pour le projet"
[master 106f383] Définition des tâches à effectuer
 1 files changed, 11 insertions(+)
 create mode 100644 TODO.txt

$ git log
commit 106f38373f53c54ae80862ed7a873f07cbd2e4c1
Author: Zenika <training@zenika.com>
Date:   Sat Sep 24 14:43:14 2011 +0200

    Définition des tâches à effectuer

    Création du fichier TODO.txt listant toutes les tâches actuellement prévues pour le projet

commit a55c92b1a2eb7d55818cb96572d23c1af83618ee
Author: Zenika <training@zenika.com>
Date:   Sat Sep 24 14:41:43 2011 +0200

    Initialisation du projet

    Ajout du fichier README.txt décrivant le projet

$ git log --oneline
106f383 Définition des tâches à effectuer
a55c92b Initialisation du projet
```

### Retour vers le premier commit

```bash
$ git checkout a55c92b
Note: checking out 'a55c92b'.

You are in 'detached HEAD' state. You can look around, make experimental changes and commit them, and you can discard any commits you make in this state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b new_branch_name

HEAD is now at a55c92b... Initialisation du projet

$ git status
HEAD detached at a55c92b
nothing to commit, working directory clean

$ ls -l
total 12K
-rw-r--r-- 1 user user 502 2011-09-24 14:38 README.txt
```

<div class="pb"></div>

## TP3 – Débranches, des branches

### 1. La branche *master*

```bash
$ git log --graph --oneline --decorate --all
* 106f383 (master) Définition des tâches à effectuer
* a55c92b (HEAD) Initialisation du projet

$ git help branch

$ git branch -f master HEAD
```

```bash
$ git branch
* (detached from a55c92b)
  master

$ git log --graph --oneline --decorate --all
* a55c92b (HEAD, master) Initialisation du projet
```

On est dans une situation de "detached HEAD" et il n'y a donc aucune branche sélectionnée.

### 2. La branche *todo*

```bash
$ git branch todo

$ git branch
* (detached from a55c92b)
  master
  todo
```

La commande `git branch` ne fait que créer une nouvelle référence, elle ne déplace pas le *HEAD* dessus.

Il aurait fallu faire un checkout avec création de branche pour créer la branche ET se positionner dessus via la commande `git checkout -b todo`.

```bash
$ git checkout todo
Switched to branch 'todo'

$ git branch
  master
* todo
```

```bash
$ echo "Sites à scanner :
 - voyages-sncf.com
 - ryanair.com
 - eurolines.fr
 - eurostar.com

Langage de programmation de l'application :
Java

Serveur d'application :
tomcat 7

Couleurs de l'application :
Rouge sur fond vert

Technologies web :
 - Servlet & JSP
 - Wicket
 - Struts2" > TODO.txt

$ git status
On branch todo
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    TODO.txt

nothing added to commit but untracked files present (use "git add" to track)

$ git add TODO.txt

$ git commit -m "Création de la todolist des développeurs

Création de la todolist contenant les choix techniques de l'équipe technique"
[todo 4a13227] Création de la todolist des développeurs
 1 files changed, 19 insertions(+)
 create mode 100644 TODO.txt
```

```bash
$ echo " - JSF" >> TODO.txt

$ git status
On branch todo
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified: TODO.txt

no changes added to commit (use "git add" and/or "git commit -a")

$ git diff
diff --git a/TODO.txt b/TODO.txt
index bef13c4..2780d49 100644
--- a/TODO.txt
+++ b/TODO.txt
@@ -17,3 +17,4 @@ Technologies web :
  - Servlet & JSP
  - Wicket
  - Struts2
+ - JSF

$ git add TODO.txt

$ git status
On branch todo
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    modified: TODO.txt

$ git commit -m "Ajout de JSF dans les technologies web

JSF est une technologie web envisagée pour le projet"
[todo 4a13227] Ajout de JSF dans les technologies web
1 files changed, 1 insertions(+)
```

```bash
$ git log --graph --oneline --decorate --all
* 4a13227 (HEAD, todo) Ajout de JSF dans les technologies web
* 8b213da Création de la todolist des développeurs
* a55c92b (master) Initialisation du projet
```

### 3. Premières sources

```bash
$ git checkout master -b interface-web
Switched to a new branch 'interface-web'

$ git log --graph --oneline --decorate --all
* 4a13227 (todo) Ajout de JSF dans les technologies web
* 8b213da Création de la todolist des développeurs
* a55c92b (HEAD, master, interface-web) Initialisation du projet
```

```bash
$ mkdir src

$ echo "<html>
<body>
<h1>Resanet - Des voyages nets</h1>
<p>Transports utilisables : train, avion ou bateau</p>
</body>
</html>" > src/index.html

$ git status
On branch interface-web
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    src/index.html

nothing added to commit but untracked files present (use "git add" to track)

$ git add src/index.html

$ git status
On branch interface-web
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file: src/index.html

$ git commit -m "Création de l'index

Création de la page d'index de l'application"
[interface-web ed88a5e] Création de l'index
 1 files changed, 6 insertions(+)
 create mode 100644 src/index.html
```

```bash
$ sed -i "s|<html>|<html>\n<head>\n<title>Resanet</title>\n</head>|" src/index.html

$ git add src/index.html

$ git commit -m "Définition d'un titre dans l'index"
[interface-web af87a8d] Définition d'un titre dans l'index
 1 files changed, 3 insertions(+)
```

```bash
$ echo "Le site est disponible à l'adresse http://www.resanet.com/resaroute/" >> README.txt
$ git add README.txt
$ git commit -m "Ajout de l'URL du site au README"
[interface-web ef92878] Ajout de l'URL du site au README
 1 files changed, 1 insertions(+)
```

```bash
$ git log --oneline --decorate
ef92878 (HEAD, interface-web) Ajout de l'URL du site au README
af87a8d Définition d'un titre dans l'index
ed88a5e Création de l'index
a55c92b (master) Initialisation du projet
```

### 4. La fusion

```bash
$ git log --oneline --decorate --all --graph
* ef92878 (HEAD, interface-web) Ajout de l'URL du site au README
* af87a8d Définition d'un titre dans l'index
* ed88a5e Création de l'index
| * 4a13227 (todo) Ajout de JSF dans les technologies web
| * 8b213da Création de la todolist des développeurs
|/
* a55c92b (master) Initialisation du projet

$ git checkout master
Switched to branch 'master'

$ git merge todo
Updating a55c92b..4a13227
Fast-forward
 TODO.txt | 20 ++++++++++++++++++++
 1 files changed, 20 insertions(+)
 create mode 100644 TODO.txt

$ git log --oneline --decorate --all --graph
* ef92878 (interface-web) Ajout de l'URL du site au README
* af87a8d Définition d'un titre dans l'index
* ed88a5e Création de l'index
| * 4a13227 (HEAD, todo, master) Ajout de JSF dans les technologies web
| * 8b213da Création de la todolist des développeurs
|/
* a55c92b Initialisation du projet
```

Sans modifications sur la branche *master*, le merge s'est passé en fast-forward.

```bash
$ echo "Les tâches techniques à effectuer sont dans le fichier TODO.txt" >> README.txt

$ git add README.txt

$ git commit -m "Référence du TODO.txt dans le README.txt"
[master 48d11f7] Référence du TODO.txt dans le README.txt
 1 files changed, 1 insertions(+), 0 deletions(-)
```

```bash
$ git merge interface-web
Auto-merging README.txt
CONFLICT (content): Merge conflict in README.txt
Automatic merge failed; fix conflicts and then commit the result.

$ git status
You have unmerged paths.
  (fix conflicts and run "git commit")

Changes to be committed:

    new file: src/index.html

Unmerged paths:
  (use "git add <file>..." to mark resolution)

    both modified: README.txt

$ vi README.txt

$ git add README.txt

$ git status
On branch master
All conflicts fixed but you are still merging.
  (use "git commit" to conclude merge)

Changes to be committed:

    modified: README.txt
    new file: src/index.html

$ git commit
[master dbad86c] Merge branch 'interface-web'
```

Nous avons ici un merge classique avec un commit spécifique.

```bash
$ git log --oneline --decorate --all --graph
* dbad86c (HEAD, master) Merge branch 'interface-web'
|\
| * ef92878 (interface-web) Ajout de l'URL du site au README
| * af87a8d Définition d'un titre dans l'index
| * ed88a5e Création de l'index
* | 48d11f7 Référence du TODO.txt dans le README.txt
* | 4a13227 (todo) Ajout de JSF dans les technologies web
* | 8b213da Création de la todolist des développeurs
|/
* a55c92b Initialisation du projet
```

### 5. Copies de commits

```bash
$ git checkout -b java
Switched to a new branch 'java'

$ mkdir src/java

$ echo "public class Launcher {
  public static void main(String... args) {
    System.out.println("Hello world");
  }
}" > src/java/Main.java

$ git add src

$ git commit -a -m "Création du launcher de l'application

Ajout de la classe Launcher, classe ayant la méthode main()"
[java d5163fa] Création du launcher de l'application
 1 files changed, 5 insertions(+)
 create mode 100644 src/java/Main.java
```

```bash
$ echo "
Application lourde :
Technologie Swing" >> TODO.txt

$ git commit -a -m "Ajouts dans la todolist

Informations sur le projet de création d'application lourde"
[java 5f8a904] Ajouts dans la todolist
 1 files changed, 3 insertions(+)
```

```bash
$ git checkout todo
Switched to branch 'todo'

$ git log --all --oneline --grep "todo"
5f8a904 Ajouts dans la todolist
8b213da Création de la todolist des développeurs

$ git cherry-pick 5f8a904
[todo 56145b0] Ajouts dans la todolist
 1 files changed, 3 insertions(+)

$ git log --oneline --decorate --all --graph
* 56145b0 (HEAD, todo) Ajouts dans la todolist
| * 5f8a904 (java) Ajouts dans la todolist
| * d5163fa Création du launcher de l'application
| * dbad86c (master) Merge branch 'interface-web'
| |\
| | * ef92878 (interface-web) Ajout de l'URL du site au README
| | * af87a8d Définition d'un titre dans l'index
| | * ed88a5e Création de l'index
| * | 48d11f7 Référence du TODO.txt dans le README.txt
|/ /
* | 4a13227 Ajout de JSF dans les technologies web
* | 8b213da Création de la todolist des développeurs
|/
* a55c92b Initialisation du projet
```

### 6. Déplacement et réarrangements

```bash
$ git checkout -b jsp java
Switched to a new branch 'jsp'

$ mkdir src/jsp

$ echo "<html>
<head><title><%=transport.getId()%></title></head>
<body>
<h1><%=transport.getId()%> - <%=transport.getType()%></h1>
<p><%=transport.getDescription()%></p>
</body>
</html>" > src/jsp/index.jsp

$ git add src/

$ git commit -m "Ajout de l'index JSP"
[jsp 5d7c1c7] Ajout de l'index JSP
 1 files changed, 7 insertions(+)
 create mode 100644 src/jsp/index.jsp

$ sed -i "s|getDescription|getFullDescription|" src/jsp/index.jsp

$ git commit -a -m "Correction de l'index JSP"
[jsp f801d1e] Correction de l'index JSP
 1 files changed, 1 insertions(+), 1 deletions(-)
```

```bash
$ git log --oneline --decorate --all --graph
* f801d1e (HEAD, jsp) Correction de l'index JSP
* 5d7c1c7 Ajout de l'index JSP
* 5f8a904 (java) Ajouts dans la todolist
* d5163fa Création du launcher de l'application
* dbad86c (master) Merge branch 'interface-web'
|\
| * ef92878 (interface-web) Ajout de l'URL du site au README
| * af87a8d Définition d'un titre dans l'index
| * ed88a5e Création de l'index
* | 48d11f7 Référence du TODO.txt dans le README.txt
| | * 56145b0 (todo) Ajouts dans la todolist
| |/
|/|
* | 4a13227 Ajout de JSF dans les technologies web
* | 8b213da Création de la todolist des développeurs
|/
* a55c92b Initialisation du projet

$ git rebase --onto interface-web java jsp
First, rewinding head to replay your work on top of it...
Applying: Ajout de l'index JSP
Applying: Correction de l'index JSP

$ git log --oneline --decorate --all --graph
* 2db524b (HEAD, jsp) Correction de l'index JSP
* 1d47054 Ajout de l'index JSP
| * 56145b0 (todo) Ajouts dans la todolist
| | * 5f8a904 (java) Ajouts dans la todolist
| | * d5163fa Création du launcher de l'application
| | * dbad86c (master) Merge branch 'interface-web'
| | |\
| |_|/
|/| |
* | | ef92878 (interface-web) Ajout de l'URL du site au README
* | | af87a8d Définition d'un titre dans l'index
* | | ed88a5e Création de l'index
| | * 48d11f7 Référence du TODO.txt dans le README.txt
| |/
| * 4a13227 Ajout de JSF dans les technologies web
| * 8b213da Création de la todolist des développeurs
|/
* a55c92b Initialisation du projet
```

### 7. Du travail de taxinomiste

```bash
$ git checkout todo
Switched to branch 'todo'

$ git log --all --oneline --decorate -- TODO.txt
56145b0 (todo) Ajouts dans la todolist
5f8a904 (java) Ajouts dans la todolist
4a13227 Ajout de JSF dans les technologies web
8b213da Création de la todolist des développeurs

$ git tag first-meeting 8b213da

$ git log --all --oneline --decorate -- TODO.txt
56145b0 (todo) Ajouts dans la todolist
5f8a904 (java) Ajouts dans la todolist
4a13227 Ajout de JSF dans les technologies web
8b213da (tag: first-meeting) Création de la todolist des développeurs
```

```bash
$ git checkout master
Switched to branch 'master'

$ git blame README.txt | grep TODO.txt
48d11f7 (Zenika 2011-09-24 18:02:54 +0200 4) Les tâches techniques à effectuer sont dans le fichier TODO.txt

$ git tag -a second-meeting -m "Après la seconde réunion, la décision de valider la todolist a été prise" 48d11f7

$ git show second-meeting
tag second-meeting
Tagger: Zenika <training@zenika.com>
Date:   Sat Sep 24 18:53:43 2011 +0200

Après la seconde réunion, la décision de valider la todolist a été prise

commit 48d11f79a189a12b2da62076471fa74cdd246693
Author: Zenika <training@zenika.com>
Date:   Sat Sep 24 18:02:54 2011 +0200

    Référence du TODO.txt dans le README.txt

diff --git a/README.txt b/README.txt
index 06a713b..0d3d05b 100644
--- a/README.txt
+++ b/README.txt
@@ -1,3 +1,4 @@
 L'agence de voyages Resanet a décidé de lancer le projet resaroute, ce projet a pour but de créer une application unique d'aspiration d'informations sur les sites de transports publics tels celui de la SNCF.
 Les premières idées du projet sont présentes et vont évoluer au fur et à mesure. Le projet va aussi devoir débuter sous peu. Un système de versioning va devenir plus qu'important.
 L'objectif principal est de mettre en place et gérer les premiers événements de ce dépôt Git.
+Les tâches techniques à effectuer sont dans le fichier TODO.txt
```

<div class="pb"></div>

## TP4 – Références et relations

- J^ = H
- F^ = B
- G~ = A
- I^2 = G
- K~3 = K~~~ = I~~ = F~ = B
- K~^3^2 = I^3^2 = H^2 = E

- I par rapport à K = K^ ou K~
- J par rapport à K = K^2
- A par rapport à H = H~2 ou H^^
- C par rapport à K = K~2^2
- D par rapport à I = I^3~
- J par rapport à H = Impossible de référencer dans ce sens là

- F = A B C F
- F H = A B C F D E H
- ^H I = B C F G I
- I...J = B C F G I J
- I^@ = A B C D E F G H
- K^! = K

```bash
$ git log --graph --oneline --all --decorate
* 60ef123 (HEAD, tag: K, master) K
|\
| * 0a30778 (tag: J) J
| |
| \
*-. \ 0dfb620 (tag: I) I
|\ \ \
| | |/
| | * b261bb9 (tag: H) H
| | |\
| | | * 8479962 (tag: E) E
| | * | d32e06f (tag: D) D
| | |/
| * | d796e4b (tag: G) G
| |/
* | 9aad20f (tag: F) F
|\ \
| * | a0ab797 (tag: C) C
| |/
* | 1b076aa (tag: B) B
|/
* 0b250d0 (tag: A) A

$ git show --oneline J^
b261bb9 H
$ git show --oneline F^
1b076aa B
$ git show --oneline G~
0b250d0 A
$ git show --oneline I^2
d796e4b G
$ git show --oneline K~3
1b076aa B
$ git show --oneline K~^3^2
8479962 E
$ git show --oneline K^
0dfb620 I
$ git show --oneline K^2
0a30778 J
$ git show --oneline H^^
0b250d0 A
$ git show --oneline K~2^2
a0ab797 C
$ git show --oneline I^3~
d32e06f D

$ git log --pretty=format:%s F
F
C
B
A
$ git log --pretty=format:%s F H
H
F
E
D
C
B
A
$ git log --pretty=format:%s ^H I
I
G
F
C
B
$ git log --pretty=format:%s I...J
J
I
G
F
C
B
$ git log --pretty=format:%s I^@
H
G
F
E
D
C
B
A
$ git log --pretty=format:%s K^!
K
```

<div class="pb"></div>

## TP5 – Les accès distants

Avec accès à internet :
```bash
$ git remote add origin https://github.com/YOUR_GITHUB_USERNAME/formation-git-tp.git

$ git remote add upstream https://github.com/Zenika/formation-git-tp.git

$ git remote -v
origin    https://github.com/YOUR_GITHUB_USERNAME/formation-git-tp.git (fetch)
origin    https://github.com/YOUR_GITHUB_USERNAME/formation-git-tp.git (push)
upstream  https://github.com/Zenika/formation-git-tp.git (fetch)
upstream  https://github.com/Zenika/formation-git-tp.git (push)

$ export GIT_SSL_NO_VERIFY=true
```

Sans accès à internet :
```bash
$ git init --bare ../origin.git
Initialized empty Git repository in ../origin.git/

$ git remote add origin ../origin.git

$ git remote add upstream git://192.168.0.1/formation-git-tp.git

$ git remote -v
origin    ../origin.git (fetch)
origin    ../origin.git (push)
upstream  git://192.168.0.1/formation-git-tp.git (fetch)
upstream  git://192.168.0.1/formation-git-tp.git (push)
```

```bash
$ git fetch --all
Fetching origin
Fetching upstream
warning: no common commits
remote: Counting objects: 21, done.
remote: Compressing objects: 100% (14/14), done.
remote: Total 21 (delta 3), reused 21 (delta 3)
Unpacking objects: 100% (21/21), done.
From https://github.com/Zenika/formation-git-tp
 * [new branch]      design -> upstream/design

$ git push origin master
Username for 'https://github.com': YOUR_GITHUB_USERNAME
Password for 'https://YOUR_GITHUB_USERNAME@github.com': ******
Counting objects: 26, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (23/23), done.
Writing objects: 100% (26/26), 3.02 KiB, done.
Total 26 (delta 5), reused 0 (delta 0)
To https://github.com/YOUR_GITHUB_USERNAME/formation-git-tp.git
 * [new branch]      master -> master

$ git push --all origin
Username for 'https://github.com': YOUR_GITHUB_USERNAME
Password for 'https://YOUR_GITHUB_USERNAME@github.com': ******
Counting objects: 25, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (17/17), done.
Writing objects: 100% (20/20), 2.05 KiB, done.
Total 20 (delta 3), reused 0 (delta 0)
To https://github.com/YOUR_GITHUB_USERNAME/formation-git-tp.git
 * [new branch]      interface-web -> interface-web
 * [new branch]      java -> java
 * [new branch]      jsp -> jsp
 * [new branch]      todo -> todo

$ git push --tags origin
Username for 'https://github.com': YOUR_GITHUB_USERNAME
Password for 'https://YOUR_GITHUB_USERNAME@github.com': ******
Counting objects: 1, done.
Writing objects: 100% (1/1), 214 bytes, done.
Total 1 (delta 0), reused 0 (delta 0)
To https://github.com/YOUR_GITHUB_USERNAME/formation-git-tp.git
 * [new tag]         first-meeting -> first-meeting
 * [new tag]         second-meeting -> second-meeting

$ git push --delete origin todo
Username for 'https://github.com': YOUR_GITHUB_USERNAME
Password for 'https://YOUR_GITHUB_USERNAME@github.com': ******
To https://github.com/YOUR_GITHUB_USERNAME/formation-git-tp.git
 - [deleted]         todo

$ git checkout master
Already on 'master'

$ git merge upstream/design --allow-unrelated-histories
Merge made by recursive.
 design/design.png                                  | Bin 0 -> 260100 bytes
 design/template/images_template1/bg_content.jpg    | Bin 0 -> 13847 bytes
 design/template/images_template1/border.psd        | Bin 0 -> 22404 bytes
 .../template/images_template1/border_shadow_l.jpg  | Bin 0 -> 13565 bytes
 .../template/images_template1/border_shadow_r.jpg  | Bin 0 -> 13583 bytes
 design/template/images_template1/content_Bg.psd    | Bin 0 -> 138514 bytes
 design/template/images_template1/header2_bg.jpg    | Bin 0 -> 19279 bytes
 design/template/images_template1/header_bg.jpg     | Bin 0 -> 16656 bytes
 design/template/images_template1/header_bg.psd     | Bin 0 -> 1433808 bytes
 design/template/images_template1/header_bg2.jpg    | Bin 0 -> 47454 bytes
 design/template/index.html                         | 73 ++++++++++
 design/template/style/style1.css                   | 147 ++++++++++++++++++++
 12 files changed, 220 insertions(+)
 create mode 100644 design/design.png
 create mode 100755 design/template/images_template1/bg_content.jpg
 create mode 100755 design/template/images_template1/border.psd
 create mode 100755 design/template/images_template1/border_shadow_l.jpg
 create mode 100755 design/template/images_template1/border_shadow_r.jpg
 create mode 100755 design/template/images_template1/content_Bg.psd
 create mode 100755 design/template/images_template1/header2_bg.jpg
 create mode 100644 design/template/images_template1/header_bg.jpg
 create mode 100755 design/template/images_template1/header_bg.psd
 create mode 100755 design/template/images_template1/header_bg2.jpg
 create mode 100755 design/template/index.html
 create mode 100755 design/template/style/style1.css

$ git push origin master
Username for 'https://github.com': YOUR_GITHUB_USERNAME
Password for 'https://YOUR_GITHUB_USERNAME@github.com': ******
Counting objects: 24, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (19/19), done.
Writing objects: 100% (23/23), 1.28 MiB, done.
Total 23 (delta 3), reused 0 (delta 0)
To https://github.com/YOUR_GITHUB_USERNAME/formation-git-tp.git
   dbad86c..e764455  master -> master
```

<div class="pb"></div>

## TP6 – Configuration personnalisée

```bash
$ git help config

$ git config --global alias.st status

$ git config --global alias.ci commit

$ git config --global alias.co checkout

$ git config --global alias.git "! git"

$ echo -e '.*
!.gitignore
!.project
/tests/
/temp.txt' > .gitignore
```
