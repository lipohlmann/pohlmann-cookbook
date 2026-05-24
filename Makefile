manuscript = pohlmann-cookbook
references = $(wildcard *.bib)
texcompiler = xelatex
latexopt   = -halt-on-error -file-line-error

pdf: $(manuscript).tex $(references)
	$(texcompiler) $(latexopt) $<
	makeglossaries $(manuscript)
	biber $(manuscript)
	$(texcompiler) $(latexopt) $<
	$(texcompiler) $(latexopt) $<

quick: $(manuscript).tex $(references)
	$(texcompiler) $(latexopt) $<

clean:
	rm -f *.pdf *.dvi *.toc *.aux *.out *.log *.bbl *.blg *.log *.spl *~ *.spl *.zip *.acn *.glo *.ist *.epub *.gls *.glg *.xdy *.lof *.lot *.bcf *.run.xml *.acr *.alg

realclean: clean
	rm -rf $(manuscript).dvi
	rm -f $(manuscript).pdf

zip:
	zip paper.zip *.tex *.eps *.bib

.PHONY: pdf clean
