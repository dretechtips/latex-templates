#! /bin/bash

rm *~

pdflatex slides.tex
pdflatex slides.tex
bibtex slides.aux
pdflatex slides.tex
pdflatex slides.tex

rm *~
rm *log
rm *out
rm *aux
rm *bbl
rm *blg
rm *cb
rm *cb2
rm *fff
rm *synctex.gz
rm *ttt
rm *snm
rm *toc
rm *nav
rm *vrb
rm .RData
rm .Rhistory
