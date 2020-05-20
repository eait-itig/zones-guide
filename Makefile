ADOC		?= $(shell which asciidoctor)
ADOCPDF		?= $(shell which asciidoctor-pdf)

ADOCFLAGS	+= -r asciidoctor-diagram

all: zones-guide.html zones-guide.pdf

%.html: %.adoc
	$(ADOC) $(ADOCFLAGS) $^

%.pdf: %.adoc
	$(ADOCPDF) $(ADOCFLAGS) $^

.PHONY: upload
upload: all
	mput -f zones-guide.html ~~/public
	mput -f zones-guide.pdf ~~/public
