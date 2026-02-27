LILYPOND_FILES := *.ly
PDF_FILES := $(LILYPOND_FILES:.ly=.pdf)

all: $(PDF_FILES)

%.pdf: %.ly
	lilypond -f pdf "$<"

publish:
	gh release upload main $(PDF_FILES) --clobber

clean:
	rm -f $(PDF_FILES)
