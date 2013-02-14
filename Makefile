.PHONY : all clean

TARGET=main

all : $(TARGET).pdf

clean :
	- rm -f $(TARGET).aux $(TARGET).log $(TARGET).bbl $(TARGET).blg $(TARGET).bcf $(TARGET).out $(TARGET).run.xml $(TARGET).pdf *~

# You may append other dependencies
%.pdf : %.tex %.bib *.tex
	basename=$(shell basename $< .tex) && \
	xelatex $$basename && \
	biber $$basename && \
	xelatex $$basename && xelatex $$basename
