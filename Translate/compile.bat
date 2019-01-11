@echo off

xelatex -shell-escape -interaction=nonstopmode -synctex=1 main.tex
xelatex -shell-escape -interaction=nonstopmode -synctex=1 main.tex
start sumatrapdf main.pdf

if exist *.aux (del *.aux)
if exist *.bbl (del *.bbl)
if exist *.bcf (del *.bcf)
if exist *.blg (del *.blg)
if exist *.log (del *.log)
if exist *.dvi (del *.dvi)
if exist *.out (del *.out)
if exist *.gz (attrib +H *.gz)
if exist *.toc (del *.toc)
if exist *.nav (del *.nav)
if exist *.out (del *.out)
if exist *.snm (del *.snm)
if exist *.vrb (del *.vrb)
if exist *.run.xml (del *.run.xml)

if exist _minted-* (rmdir 1>nul 2>nul /S _minted-main /q)
pause