# Makefile for Mensch und Computer Proceedings

BASE=example
MD=${BASE}.md
PDF=${BASE}.pdf
TEX=${BASE}.tex

STYLE=
TEMPLATE=./templates/muc_template.tex 
FONTS=
BIBLIOGRAPHY=--bibliography=./general_bibliography.bib --bibliography=./project_bibliography.bib
CSL= 

export TEXINPUTS := .:./templates:..:

all: ${TEX} ${PDF}

%.pdf: %.md
	pandoc --number-sections --csl=${CSL} --filter ./tools/pandoc_fignos.py --filter ./tools/pandoc_svg.py --listing ${BIBLIOGRAPHY} --pdf-engine=xelatex --template=${TEMPLATE} ${FONTS} ${STYLE} $< -o $@
	
%.tex: %.md
	pandoc --number-sections --filter ./tools/pandoc_fignos.py --filter ./tools/pandoc_svg.py --listing ${BIBLIOGRAPHY} --template=${TEMPLATE}  ${FONTS} ${STYLE} $< -o $@

clean: 
	-rm ${PDF} ${TEX}
