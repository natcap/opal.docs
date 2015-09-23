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
	# Arguments: in_suffix, out_suffix
	python replace.py source/title_page_$(SUFFIX).tex $(VERSION);\
	cd source && $(PDFLATEX) --jobname=$(OUTFILE) users_guide_$(SUFFIX).tex;\

en:
	$(MAKE) lang_pdf SUFFIX=en

es:
	$(MAKE) lang_pdf SUFFIX=en

