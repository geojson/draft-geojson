
all: raw html nroff text xml

raw:
	pandoc2rfc -R -t template.xml -x transform.xsl back.mkd considerations.mkd middle.mkd
	mv draft.txt draft-unpaginated.txt

html:
	pandoc2rfc -H -t template.xml -x transform.xsl back.mkd considerations.mkd middle.mkd
nroff:
	pandoc2rfc -N -t template.xml -x transform.xsl back.mkd considerations.mkd middle.mkd
text:
	pandoc2rfc -T -t template.xml -x transform.xsl back.mkd considerations.mkd middle.mkd
xml:
	pandoc2rfc -X -t template.xml -x transform.xsl back.mkd considerations.mkd middle.mkd
