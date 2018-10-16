# Graphes LaTeX

Les graphes sont basés sur le style [gitdags](https://github.com/Jubobs/gitdags) utilisant le composant [TikZ/PGF](http://pgf.sourceforge.net/).

# Gestion manuelle

## Installation

Les pré-requis sont :
  - un environnement LaTeX avec les composants suivants (disponible soit dans les paquets système soit installables via `tlmgr`) :
    - pgf
    - xcolor-solarized
    - standalone
  - installation du style gitdags
    - `mkdir -p $(kpsewhich -var-value=TEXMFHOME)/tex/latex/gitdags/`
    - `wget -q --no-check-certificate -O $(kpsewhich -var-value=TEXMFHOME)/tex/latex/gitdags/gitdags.sty https://github.com/Jubobs/gitdags/raw/master/gitdags.sty`
  - `pdf2svg`

## Utilisation

Les sources LaTeX sont compilées en PDF qui est ensuite transformé en SVG :
```bash
pdflatex source.tex # will generate source.pdf
pdf2svg source.pdf source.svg # will generate source.svg
```

# Image Docker

Il existe une image docker avec déjà tout l'environement TexLive pour ne pas à avoir à tout installer : `zigarn/gitdags`

Elle peut être utilisée à l'aide du script `run.sh`.
