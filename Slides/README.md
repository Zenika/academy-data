# Sans internet

- Faire une démonstration de `git help`
- Préparer un `git-daemon` pour rendre le dépôt du TP public

```bash
cd /tmp && git clone --bare git://github.com/Zenika/formation-git-tp.git
git daemon --base-path=. --export-all --verbose
git clone git://`hostname`/formation-git-tp.git
```

# Timing

Approximativement :
 - matin 1 : slides 01 et 02
 - après-midi 1 : slides 03, TP + partie des slides 04
 - matin 2 : fin des slides 04 avec TP + slides 05
 - après-midi 2 : TP + slides 06

# Remarques

Durant la formation, faire le point sur le contenu du dossier `.git` :
 - `index` Après le add  (03-06)
 - `objects` Après le premier commit (03-11)
 - `HEAD` Après avoir vu *HEAD* (04-03)
 - `refs` Après avoir créé une branche (04-05)
 - `config` Après avoir gérée la configuration (06-02)
En fin de cours revoir tout le contenu de `.git` et expliquer la présence des fichiers/dossiers n'ont pas été déjà vus.

Faire un point sur `git branch -d/D` après avoir vu le merge

Pour le TP4 :
 - Afficher l'image au projecteur
 - Faire les questions collectivement

De même le slide 02-08 est intéressant à utiliser pour faire participer les stagiaires
