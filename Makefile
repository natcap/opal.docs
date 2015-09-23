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

lang_pdf:  # 3 arguments, $(INFILE), $(OUTFILE) $(VERSION)
	# Arguments: in_suffix, out_suffix
	cd source && $(shell python $(INFILE) $(VERSION))
	# cd source && $(shell find . -name "*.tex" | xargs sed -i '' 's/\+VERSION\+/$(VERSION)/g') 
	cd source && $(PDFLATEX) --jobname=$(OUTFILE) $(INFILE).tex
		 

en:
	# INFILE=users_guide.tex
	# OUTFILE=../OPAL_manual_en.pdf
	# $(MAKE) INFILE=users_guide OUTFILE=OPAL_manual_en VERSION=$(VERSION) lang_pdf
	$(MAKE) lang_pdf SUFFIX=en

es:
	# INFILE=users_guide_sp.tex
	# OUTFILE=../OPAL_manual_es.pdf
	# $(MAKE) INFILE=users_guide_sp OUTFILE=OPAL_manual_es VERSION=$(VERSION) lang_pdf
	$(MAKE) lang_pdf SUFFIX=en

