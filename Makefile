
all: raw html nroff text xml

raw:
	./bin/pandoc2rfc -R -t template.xml -x transform.xsl back.mkd considerations.mkd middle.mkd
	mv draft.txt draft-unpaginated.txt

html:
	./bin/pandoc2rfc -H -t template.xml -x transform.xsl back.mkd considerations.mkd middle.mkd
nroff:
	./bin/pandoc2rfc -N -t template.xml -x transform.xsl back.mkd considerations.mkd middle.mkd
text:
	./bin/pandoc2rfc -T -t template.xml -x transform.xsl back.mkd considerations.mkd middle.mkd
xml:
	./bin/pandoc2rfc -X -t template.xml -x transform.xsl back.mkd considerations.mkd middle.mkd
