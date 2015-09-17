# Makefile for building OPAL documentation from LaTex source.
#

PDFLATEX = pdflatex

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  all  Build documentation PDFs of all available languages"
	@echo "  es   Build spanish user's guide (OPAL_manual_es.pdf)"
	@echo "  en   Build english user's guide (OPAL_manual_en.pdf)"

all:
	$(MAKE) en es
en:
	cd source && $(PDFLATEX) users_guide.tex && mv users_guide.pdf ../OPAL_manual_en.pdf

es:
	cd source && $(PDFLATEX) users_guide_sp.tex && mv users_guide_sp.pdf ../OPAL_manual_es.pdf

