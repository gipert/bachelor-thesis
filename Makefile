#!/bin/make
#
# Makefile for the thesis project
#

TEX = pdflatex -interaction=nonstopmode -output-directory=log
OPT = >/dev/null

all : thesis.pdf

log : 
	-mkdir -p $@

log/thesis-frn.tex : thesis.tex log
	$(TEX) $< $(OPT);

thesis-frn.pdf : log/thesis-frn.tex log
	$(TEX) $< $(OPT);
	-mv log/thesis-frn.pdf .

thesis.pdf : thesis.tex thesis-frn.pdf log
	$(TEX) $< $(OPT);
	-mv log/thesis.pdf .

.PHONY: clean

clean :
	-rm -rf log thesis.pdf thesis-frn.pdf
