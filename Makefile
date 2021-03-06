# Makefile for building OPAL documentation from LaTex source.
#

PDFLATEX = pdflatex

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  all         Build documentation PDFs of all available languages"
	@echo "  es          Build spanish user's guide (OPAL_manual_es.pdf)"
	@echo "  en          Build english user's guide (OPAL_manual_en.pdf)"

all:
	$(MAKE) en es

lang_pdf:
	# Arguments:
	# SUFFIX = the language suffix (ISO 639-1)
	# VERSION = the version string to use.
	python replace.py source/title_page_$(SUFFIX).tex $(VERSION);\
	cd source && $(PDFLATEX) --jobname=OPAL_manual_$(SUFFIX) users_guide_$(SUFFIX).tex;\

en:
	$(MAKE) lang_pdf SUFFIX=en

es:
	$(MAKE) lang_pdf SUFFIX=es

