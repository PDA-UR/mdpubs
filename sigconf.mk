# Makefile for ACM SIGCONF Proceedings (using acmart.cls)

BASE=example
MD=${BASE}.md
PDF=${BASE}.pdf
TEX=${BASE}.tex
TEMP_FILES=${BASE}.aux ${BASE}.log ${BASE}.out

STYLE=-V acmart-style='sigconf'
TEMPLATE=./templates/acmart_template.tex 
FONTS=-V mainfont='Linux Libertine O' -V sansfont='Linux Biolinum O' -V monofont='FreeMono'
BIBLIOGRAPHY=--bibliography=./general_bibliography.bib --bibliography=./project_bibliography.bib
CSL=./templates/acm-sigchi-proceedings.csl

export TEXINPUTS := .:./templates:..:


all: ${TEX} ${PDF}

%.pdf: %.md
	pandoc --number-sections --csl=${CSL} --filter ./tools/pandoc_fignos.py --filter ./tools/pandoc_svg.py --listing ${BIBLIOGRAPHY} --pdf-engine=xelatex --template=${TEMPLATE} ${FONTS} ${STYLE} $< -o $@
	
%.tex: %.md
	pandoc --number-sections --filter ./tools/pandoc_fignos.py --filter ./tools/pandoc_svg.py --listing ${BIBLIOGRAPHY} --template=${TEMPLATE}  ${FONTS} ${STYLE} $< -o $@

clean: 
	-rm ${PDF} ${TEX} ${TEMP_FILES}
