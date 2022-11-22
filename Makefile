notebooks = $(wildcard *.ipynb)
html_files = $(patsubst %.ipynb,%.html,${notebooks})
pdfs = $(patsubst %.ipynb,%.pdf,${notebooks})

.PHONY: all clean

all: ${html_files} ${pdfs}

%.html: %.ipynb
	jupyter nbconvert --to html $<

%.pdf: %.ipynb
	jupyter nbconvert --to pdf $<

clean:
	rm -f ${html_files} ${pdfs}
