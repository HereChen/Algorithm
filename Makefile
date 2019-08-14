# Makefile
# 主文件为 main.tex
# make, make clean, make watch
PROJNAME=main
.PHONY: $(PROJNAME).pdf all watch clean

all: $(PROJNAME).pdf

$(PROJNAME).pdf: $(PROJNAME).tex
	latexmk -pdf -pdflatex="xelatex -interactive=nonstopmode" -use-make $<

# automatic compile without preview
watch: $(PROJNAME).tex
	latexmk -pdf -pdflatex="xelatex -interactive=nonstopmode" -use-make -pvc -view=none $<

# clean temp files
clean:
	latexmk -c
	rm -f *.lol *.bbl *.auxlock *.synctex.gz tex/*.aux