.PHONY: all clean

all: clean slides.pdf

clean:
	rm -f slides.pdf

slides.pdf: slides.md
	pandoc -t beamer -s slides.md -V theme:m -o slides.pdf
