.SUFFIXES: .pdf .tex .svg .png .jpg

SVGS = $(wildcard *.svg)

IMAGES = $(wildcard *.png) $(wildcard *.jpg) $(SVGS:.svg=.jpg)

all: ppo.pdf

ppo.pdf: ppo.tex $(IMAGES)
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<

clean:
	rm -Rf ppo.pdf _minted* *.aux *.log *.out *.nav *.snm *.toc *.vrb

.svg.png:
	rsvg-convert -f png -h 1080 $< -o $@

.png.jpg:
	convert $< -quality 90 $@
