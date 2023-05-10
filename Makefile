SOURCES := $(shell find . -iname '*.tex' -o -iname '*.bib' -o -iname '*.sty' -o -ipath '*figures/*.pdf')

.PHONY: all clean

all: popows.pdf sidechains.pdf

popows.pdf: $(SOURCES)
	xelatex popows.tex
	bibtex popows
	xelatex popows.tex
	xelatex popows.tex

sidechains.pdf: $(SOURCES)
	xelatex sidechains.tex
	bibtex sidechains
	xelatex sidechains.tex
	xelatex sidechains.tex

clean:
	rm -f *.aux *.log *.out *.cfg *.glo *.idx *.toc *.ilg *.ind *.lof *.lot *.bbl *.blg *.gls *.cut *.hd *.dvi *.ps *.thm *.rpi *.d *.fls *.pyc *.fdb_latexmk *.sls *.slo *.slg *.glsdefs *.gls *.glg *.glo *.ist
	rm -Rf latex.out
	rm -Rf sidechains.pdf
	rm -Rf popows.pdf
