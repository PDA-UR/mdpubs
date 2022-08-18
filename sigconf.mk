# Makefile for ACM SIGCONF Proceedings (using acmart.cls)

BASE=example
MD=${BASE}.md
PDF=${BASE}.pdf
TEX=${BASE}.tex
ZIP=${BASE}.zip
TEMP_FILES=${BASE}.aux ${BASE}.log ${BASE}.out

STYLE=-V acmart-style='manuscript, review'
#STYLE=-V acmart-style='sigconf'
#STYLE=-V acmart-style='sigconf, authorversion, screen'
TEMPLATE=./templates/acmart_template.tex 
FONTS=-V mainfont='Linux Libertine O' -V sansfont='Linux Biolinum O' -V monofont='FreeMono'
BIBLIOGRAPHY=--bibliography=./general_bibliography.bib --bibliography=./project_bibliography.bib
BIBLIOFILES=-V biblio-files='./general_bibliography.bib ./project_bibliography.bib'
CSL=./templates/acm-sigchi-proceedings.csl

export TEXINPUTS := .:./templates:..:

all: ${TEX} ${PDF}

taps: ${BASE}.zip

%.pdf: %.md
	pandoc  --number-sections --csl=${CSL} -M figPrefix='Figure' -M figureTitle='Figure' --filter ./tools/pandoc-crossref --filter ./tools/pandoc_svg.py --listings --citeproc ${BIBLIOGRAPHY} --pdf-engine=xelatex --template=${TEMPLATE} ${FONTS} ${STYLE} $< -o $@
	
# TeX optimized for TAPS
%.tex: %.md
	pandoc -r markdown-auto_identifiers --natbib --number-sections -M figPrefix='Figure' -M figureTitle='Figure' --filter ./tools/pandoc-crossref --filter ./tools/pandoc_svg.py --citeproc --listings ${BIBLIOGRAPHY} ${BIBLIOFILES} --template=${TEMPLATE}  ${FONTS} ${STYLE} $< -o $@
	
${ZIP}:  all
	-rm -r taps_temp
	mkdir taps_temp
	mkdir taps_temp/pdf
	mkdir taps_temp/Source
	-cp -r img taps_temp/Source/
	-rm -r taps_temp/Source/img/raw
	cp *.tex taps_temp/Source/
	cp *.bib taps_temp/Source
	cp ${PDF} taps_temp/pdf/
	cp -a supplements taps_temp/
	cd taps_temp/ && zip -r ../${ZIP} *
	cd ..
	rm -r taps_temp
	
clean: 
	-rm ${PDF} ${TEX} ${TEMP_FILES} ${ZIP} 
