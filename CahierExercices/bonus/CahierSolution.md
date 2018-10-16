<div style="height:24.7cm; position: relative; border: 1px solid black;">
    <h1 style="position:absolute; top: 33%; width:100%; text-align: center;">{Titre-Formation}</h1>
    <h1 style="position:absolute; top: 50%; width:100%; text-align: center;">Travaux Pratiques - Solution<br />Bonus</h1>
    <img src="../ressources/logo-zenika-small.png" style="position: absolute; bottom: 20px; right: 20px; height: 150px;">
</div>
<div class="pb"></div>

## TP7 – Sous-Modules

```bash
$ git submodule add https://github.com/apache/commons-lang.git lib

$ cat .gitmodules
[submodule "lib"]
	path = lib
	url = https://github.com/apache/commons-lang.git

$ git commit -m "Commit avec submodule"

$ git log -p HEAD~1..HEAD

# clone du projet
$ git clone file:///Users/XXXX/myproject myclone

$ cd myproject2

$ git submodule init

$ git submodule update

# modification dans le sous-module du projet principal
$ vi README ; git commit -a -m "Test submodule"

# au niveau du projet principal
$ git status
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#    modified: lib (new commits)

$ git commit -m "Submodule update"

# dans myclone
$ git fetch

$ git merge origin/master

$ git submodule update
fatal: reference is not a tree: cf880c62c360bf6be90847e9c175b0778a708646
Unable to checkout 'cf880c62c360bf6be90847e9c175b0778a708646' in submodule path 'lib'
```
