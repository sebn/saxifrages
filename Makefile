LILYPOND_FILES := *.ly
PDF_FILES := $(LILYPOND_FILES:.ly=.pdf)
SVG_FILES := $(LILYPOND_FILES:.ly=-1.svg)

all: pdf svg
pdf: $(PDF_FILES)
svg: $(SVG_FILES)

%.pdf: %.ly
	lilypond -f pdf "$<"

%-1.svg: %.ly
	lilypond -f svg "$<"

clean:
	rm -f *.pdf *.svg

