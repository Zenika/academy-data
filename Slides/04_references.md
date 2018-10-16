# Les références

<!-- .slide: class="page-title" -->



## Plan

<!-- .slide: class="toc" -->

- [Introduction](#/1)
- [Fonctionnement de Git](#/2)
- [Utiliser Git en local](#/3)
- **[Les références](#/4)**
- [Utiliser Git en distant](#/5)
- [Configuration et outils externes](#/6)

Notes :



## Les références

- Le système vu avec la commande `git checkout` a le désavantage de nécessiter de connaître les SHA-1 de chaque commit
- Les références permettent de mettre des noms sur les commits
- Il existe plusieurs type de références
  - *HEAD*, qui représente le commit sur lequel le projet est basé
  - Les *branches*, ce sont des références qui se déplacent lorsqu'on fait un nouveau commit
  - Les *tags*, référencent un commit spécifique et ne bougent pas
  - Le *stash*, qui référence des commits utilisés en interne
  - Les *branches externes*, qui sont les références publiées sur un dépôt externe

Notes :



## Dangling & Detached HEAD

- Un commit doit être référencé ou être le parent d'un autre commit
  - Sinon il est considéré comme **dangling** et est éligible pour une suppression (complète) dans le futur

![](ressources/images/04_references/headless.svg)

- La référence *HEAD* représente toujours le commit sur lequel les modifications sont basées
  - *HEAD* peut référencer un commit directement (detached head) ou une autre référence
  - En cas de `git checkout`, *HEAD* référence l'élément spécifié

Notes :

Montrer ici la référence HEAD dans .git/HEAD



## Les branches

- Les branches sont des références **évoluant** lors du commit
- Si *HEAD* référence *B2* (qui référence *C3*), après le commit de *C5*, *B2* référencera *C5*. *HEAD* continuera de pointer vers *B2*

<figure class="inline">
  <img src="ressources/images/04_references/branch.svg"/>
  <img src="ressources/images/04_references/branch_commit.svg"/>
</figure>

- Si *HEAD* référence une branche, cette branche est appelée la *branche courante*

Notes :



## git branch

- `git branch` liste les branches locales ainsi que la position de *HEAD*

```bash
$ git branch
* (detached from a5805c0)
  master
```

- La création d'une branche peut se faire de deux façons

```bash
$ git branch firstBranch
$ git checkout 64bf0dd -b secondBranch
Switched to a new branch 'secondBranch'
$ git branch
  firstBranch
  master
* secondBranch
```

- L'option `-d` permet de supprimer une branche

```bash
$ git branch -d firstBranch
Deleted branch firstBranch (was 64bf0dd).
```

Notes :

Montrer ici le contenu du dossier .git/refs/heads



## Résultat de l'opération

- Le moyen le plus simple pour voir l'état des branches/commits référencés (non dangling) est de passer par la commande `git log` en spécifiant quelques options
  - `--graph` pour une meilleure visibilité graphique
  - `--all` pour travailler avec toutes les branches/références
  - `--oneline` pour garder le log concis
  - `--decorate` pour afficher les références existantes

```bash
$ git log --graph --all --oneline --decorate
* b3d9655 (HEAD, master) Merge branch 'secondBranch'
|\
| * dc1ce86 (secondBranch) Foo bar modification
* | 7cc6ab3 A relevant message
* | a5805c0 Second commit
|/
* 64bf0dd First commit
```

Notes :



<!-- .slide: class="page-tp3_1-3" -->



## Fusion et déplacement de commits

- Le système de commits de Git permet de fusionner deux branches (dans le sens "suite de commits") différentes
  <!-- .element: class="tight" -->
  - `git merge` crée un nouveau commit ayant pour parents les deux branches fusionnées

<figure>
  <img src="ressources/images/04_references/simple_merge.svg" style="margin: .5em auto;"/>
</figure>

- Il est possible de rejouer des commits à partir d'un autre commit
  <!-- .element: class="tight" -->
  - `git cherry-pick` récupère les modifications apportées par un ou plusieurs commits et les ré-applique sur *HEAD*
  - `git rebase` "déplace" et modifie une suite de commits

<figure>
  <img src="ressources/images/04_references/simple_rebase.svg" style="margin: .5em auto;"/>
</figure>

Notes :



## git merge

- L'opération `git merge` prend en paramètre un (ou plusieurs) commit à fusionner avec le *HEAD* actuel

![](ressources/images/04_references/merge.svg)

Notes :



## git merge

```bash
$ git merge secondBranch
Auto-merging firstFile.txt
CONFLICT (content): Merge conflict in firstFile.txt
Automatic merge failed; fix conflicts and then commit the result.

$ git status
On branch master
You have unmerged paths.
  (fix conflicts and run "git commit")
Unmerged paths:
  (use "git add <file>..." to mark resolution)

    both modified: firstFile.txt

no changes added to commit (use "git add" and/or "git commit -a")

$ cat firstFile.txt
<<<<<<<< HEAD
Hello world!
Test
========
Foo bar
>>>>>>>> secondBranch
```

Notes :



## Résolution de conflits

- Bien que le système de merge de Git soit puissant, il n'est pas impossible d'avoir des conflits
- Le processus à suivre en cas de conflit
  1. Appel de `git merge`
  2. En cas de conflit trouver le fichier problématique (`git status`)
  3. Résoudre le/les conflits du fichier (manuellement ou avec `git mergetool`)
  4. Ajouter le fichier résolu à l'index (`git add`), si d'autres fichiers sont en conflits retourner à l'étape 2
  5. Commiter (`git commit`), un message de commit sera proposé par défaut. Il est recommandé de documenter la résolution des conflits
- S'il n'y a pas de conflit, Git commite automatiquement le résultat
  - Pour spécifier un message de commit l'option `-m` peut être passée à `git merge`

Notes :



## Fast forward

- Dans le cas où *master* n'a pas divergé depuis la création de *secondBranch*
  - Le merge de *C3* et *C4* dans *C2* aurait pointé vers le même tree que *C4*
  - Pour éviter des opérations futiles, Git détecte ce cas et le gère en **fast-forward**
- Le **fast-forward** consiste lors d'un merge, si le *HEAD* est un ancètre direct de l'autre branche, à simplement déplacer celui-ci sur la branche

![](ressources/images/04_references/fast-forward.svg)

Notes :



## Copie de commit

- Il est possible de copier un commit vers un nouvel emplacement
  - L'opération consiste à récupérer les modifications apportées par un ou plusieurs commits et les rejouer sur le nouvel emplacement, avec les mêmes messages
  - Les anciens commits sont toujours présents
  - Les nouveaux commits (les copies) ont leur propres hash

- L'opération `git cherry-pick` copie un commit vers le nouvel emplacement, l'ancien commit n'est pas affecté
- `git rebase` copie une suite de commits vers le nouvel emplacement, le résultat est que la référence vers les anciens commits est déplacée
  - Les anciens commits sont donc potentiellement dangling

Notes :



## git cherry-pick

- `git cherry-pick` permet de récupérer les changements apportés par un commit et les reproduire

```bash
$ git cherry-pick a5805c0
[secondBranch 041fa9c] Second commit
 2 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 firstDir/firstFileCopy.txt
 Rename firstDir/secondFile.txt => secondFile.txt (100%)

$ git log --graph --all --oneline --decorate
* 041fa9c (HEAD, secondBranch) Second commit
| * b3d9655 (master) Merge branch 'secondBranch'
| |\
| |/
|/|
* | dc1ce86 Foo bar modification
| * 7cc6ab3 A relevant message
| * a5805c0 Second commit
|/
* 64bf0dd First commit
```

<figure style="position: absolute; bottom: 3.5em; right: 2em;">
  <img src="ressources/images/04_references/cherry.svg"/>
</figure>

Notes :



<!-- .slide: class="page-tp3_4-5" -->



## rebase

- Le but de la commande `git rebase` est de pouvoir facilement déplacer/manipuler un ensemble de commits et la référence associée

```text
git rebase [-i] [--onto <destination>] <from> [<to>]

  -i Mode interactif
  --onto <destination>
    Commit sur le quel les commits vont être déplacés
    Si non spécifié la valeur de <from> est utilisé
  <from>
    Commit à partir du quel les commits à déplacer sont listés
    Tous les commits présents dans la branche <to> et
    non présents dans la branche de <from> sont pris en compte
  <to>
    Commit/référence déplacée
    Si non spécifié, HEAD est utilisé
```

- Le mode interactif permet une manipulation plus précise des données, alors que le mode classique se contente de "copier" les commits

Notes :



## Avant le rebase

- Pour effectuer un rebase, une branche avec quelques commits est créée

<figure>
  <img src="ressources/images/04_references/pre-rebase.svg" style="margin: .5em auto;"/>
</figure>

```bash
$ git log --graph --all --oneline --decorate
* 1ce14e2 (HEAD, thirdBranch) Third commit on thirdBranch (enough !)
* 041fa9c Second commit on thirdBranch
* fb0aed3 ThirdBranch creation
| * 041fa9c (secondBranch) Second commit
| | * b3d9655 (master) Merge branch 'secondBranch'
| | |\
| | |/
| |/|
| * | dc1ce86 Foo bar modification
|/ /
| * 7cc6ab3 A relevant message
| * a5805c0 Second commit
|/
* 64bf0dd First commit
```
<!-- .element: class="tight" -->

Notes :



## git rebase

- L'opération de rebase se fait en une ligne

```bash
$ git rebase --onto master master thirdBranch
First, rewinding head to replay your work on top of it...
Applying: ThirdBranch creation
Applying: Second commit on thirdBranch
Applying: Third commit on thirdBranch (enough !)
$ git log --graph --all --oneline --decorate
* d29a5fc (HEAD, thirdBranch) Third commit on thirdBranch (enough !)
* 39aeca1 Second commit on thirdBranch
* fc1f274 ThirdBranch creation
* b3d9655 (master) Merge branch 'secondBranch'
|\
* | 7cc6ab3 A relevant message
* | a5805c0 Second commit
| | * 041fa9c (secondBranch) Second commit
| |/
| * dc1ce86 Foo bar modification
|/
* 64bf0dd First commit
```

<figure style="position: absolute; bottom: 3.7em; right: 1em;">
  <img src="ressources/images/04_references/rebase.svg"/>
</figure>

Notes :



## En cas de conflits

- Le fait de ré-appliquer plusieurs commits mènera sûrement à des conflits. `git rebase` les gère d'une façon particulière
  - Un commit est appliqué, en cas de conflit, le rebase s'arrête
    1. L'utilisateur fixe le conflit et exécute

       `git rebase --continue`

    2. L'utilisateur n'applique pas ce commit et exécute

       `git rebase --skip`

    3. L'utilisateur arrête le rebase et revient à l'état initial grâce à

       `git rebase --abort`

- De cette manière, tous les conflits sont corrigés dans le commit les générant

Notes :



## Mode interactif

- Le mode interactif ouvre un éditeur dans lequel il est possible de choisir pour chaque commit la façon dont il sera géré

```text
pick 48c7571 FourthBranch creation
pick 98f5833 Second commit in fourthBranch

# Rebase b3d9655..98f5833 onto b3d9655
#
# Commands:
# p, pick = use commit
# r, reword = use commit, but edit the commit message
# e, edit = use commit, but stop for amending
# s, squash = use commit, but meld into previous commit
# f, fixup = like "squash", but discard this commit's log message
# x, exec = run command (the rest of the line) using shell
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
# Note that empty commits are commented out
```

Notes :



<!-- .slide: class="page-tp3_6" -->



## D'autres références/objets

- En plus des références *HEAD* et des branches, il est possible de créer des références "fixes" vers certains commits, des **tags**
- Le but est de pouvoir identifier facilement un commit particulier, par exemple une release d'un produit
- Il existe deux types de tags
  - Les *tags simples*, ce sont des références basiques vers des commits
  - Les *tags annotés/signés*, ces tags contiennent des informations supplémentaires
    - Créateur du tag (nom et email)
    - Date de création du tag
    - Message de description
    - Signature/Checksum

Notes :



## Tags annotés

- Le système de tag annoté requiert d'enregistrer un nouvel objet dans la base interne de Git
- Seul le tag annoté est enregistré ainsi. Un tag standard est juste compté comme une référence

<figure>
  <img src="ressources/images/04_references/annotated_tag.png" style="margin: 0 auto;"/>
</figure>

```bash
$ git cat-file -p 8fb5a89
Object b3d9655...
type commit
tag firstTag
tagger Zenika <training@zenika.com> Mon Jul 25 16:23:22 2011 +0100
An annotated tag
```
<!-- .element: class="tight" -->

- Un tag (de n'importe quel type) pointe vers un *object* et non spécifiquement vers un commit. Il peut donc pointer vers un *tree* ou même un *blob*


Notes :



## Création d'un tag

- La commande pour créer et manipuler les tags est `git tag`

```text
git tag [-a|-s|-d|-v|-l [-n]] [-m <msg>] <tagname> [<object>]

  -a Crée un tag annoté non signé
  -s Crée un tag annoté signé grâce à une clef GPG
  -d Supprime un tag donné
  -v Vérifie la signature d'un tag annoté signé
  -l Liste les tags ayant un nom contenant <tagname>
  -n Si -l est activé, affiche la première ligne du message du tag

Si aucune de ces options n'est utilisée un tag "simple" sera créé

  -m <msg>
    Spécifie le message lors de la création d'un tag annoté
  <tagname>
    Nom du tag à créer/supprimer/vérifier
  <object>
    Élément à tagger. Si non spécifié le commit de HEAD est utilisé
```

- Le tag une fois créé ne pourra pas être modifié et pointera définitivement vers le même objet

Notes :



## git tag

- Voici le résultat d'une création de tag

```bash
$ git tag -a -m "An annotated tag" firstTag
$ git log --graph --oneline --decorate
* b3d9655 (HEAD, tag: firstTag, master) Merge branch 'secondBranch'
|\
| * dc1ce86 Foo bar modification
* | 7cc6ab3 A relevant message
* | a5805c0 Second commit
|/
* 64bf0dd First commit
$ git tag -n -l firstTag
FirstTag        An annotated tag
```

<figure>
  <img src="ressources/images/04_references/tag.svg" style="margin: 0 auto;"/>
</figure>

Notes :



<!-- .slide: class="page-tp3_7" -->



## Le stash

- Comment changer de branche sans perdre son travail en cours ?
- Une solution de stockage temporaire existe, le **stash**

![](ressources/images/04_references/data_scroll.png)

- Le système est simple, les contenus des éléments indexés et non-indexés sont commités au dessus de *HEAD* et référencés dans le *stash*
  - Seul le *stash* référence ces commits, s'ils sont supprimés du *stash*, ils sont dangling et supprimés à terme de la base
  - Ce sont bien 2 commits qui sont créés
    - 1 pour les éléments indexés
    - 1 pour les non indexés

Notes :



## Manipuler le stash

- La commande pour créer et manipuler le stash est `git stash`

```text
git stash [save | list | (apply | drop | pop | show) <stash>]

  save
    Crée un stash à partir de l'état actuel du dépôt
  list
    Liste tous les stash existants
  apply
    Applique le stash <stash>
  drop
    Supprime le stash <stash>
  pop
    Applique et supprime le stash <stash> (apply suivit de drop)
  show
    Affiche les changements apportés par le stash <stash>

Si aucune de ces commande n'est utilisée, "save" sera employé

  <stash>
    Stash sur le quel l'opération doit-être effectuée
```

Notes :



## git stash

- La commande `git stash` en action

```bash
$ git status -s
$ echo "New line" >> firstFile
$ git status -s
 M firstFile.txt
$ git stash
Saved working directory and index state WIP on master: b3d9655 Merge branch 'secondBranch'
HEAD is now at b3d9655 Merge branch 'secondBranch'
$ git checkout secondBranch
Switched to branch 'secondBranch'
$ echo "Fix code" >> firstDir/secondFile.txt
$ git ci -a -m "Fixing secondBranch"
[secondBranch 848277f] Fixing secondBranch
 1 file changed, 1 insertions(+), 0 deletions(-)
$ git checkout master
Switched to branch 'master'
$ git stash pop -q
$ git status -s
 M firstFile.txt
```

<figure style="position: absolute; bottom: 5.5em; right: .5em;">
  <img src="ressources/images/04_references/stash.svg"/>
</figure>

Notes :



## Informations sur git stash

- Dans le cadre d'un travail en équipe, les stashes ne sont partagés et sont strictement personnels
- Il est possible de faire appel aux stashes précédents grâce à `stash@{N}` avec `N` le numéro du stash
  - Le dernier stash créé aura toujours le numéro `0`
- Les fichiers non versionnés ne sont pas ajoutés au stash
- Un stash `pop` ou `drop` supprime le stash, en cas de problème les données ne sont pas perdues, certaines techniques permettent de retrouver les données
- Il est possible d'appliquer le contenu d'un stash n'importe où
- Lorsqu'un stash est appliqué il peut y avoir des conflits auquel cas il faudra merger le résultat

Notes :



## Références avancées

- Pour augmenter la facilité de navigation dans Git, il est possible de manipuler les références avec des informations supplémentaires
  - `<ref>~<n>` représente le Nième ancêtre de `ref`
  - `<ref>^<n>` représente le Nième parent de `ref` (dans un merge)
  - Si `n` n'est pas spécifié sa valeur est `1`

- `HEAD^` == `HEAD~`
- `HEAD^^` == `HEAD~~` == `HEAD~^` == `HEAD^~` == `HEAD~2`
- `HEAD^0` == `HEAD~0` == `HEAD`
- `HEAD^1^1^2` == `HEAD~2^2`

- Ces références sont pratiques pour remonter dans l'historique sans avoir à connaître les hash

Notes :




## Ensembles de commits

- Il est possible pour des commandes telles que `git log` de spécifier un ensemble de commits à prendre en compte
  - `<ref>` Tous les ancêtres de `ref` plus `ref`
  - `<ref1> <ref2>` Tous les ancêtres de `ref1` et ceux de `ref2` plus `ref1` et `ref2` (Union `∪`)
  - `^<ref1> <ref2>` Tous les ancêtres de `ref2` sauf ceux qui sont aussi parents de `ref1` (Différence `\`)
  - `<ref1>..<ref2>` Idem
  - `<ref1>...<ref2>` Tous les ancêtres que `ref1` et `ref2` n'ont pas en commun plus `ref1` et `ref2` (Différence symétrique `Δ`)
  - `<ref>^@` Tous les ancêtres de `ref` (mais pas `ref`)
  - `<ref>^!` `ref` mais pas ses ancêtres

Notes :



<!-- .slide: class="page-tp4" -->
