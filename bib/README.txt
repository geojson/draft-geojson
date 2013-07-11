These references are included through entity refs in template.xml but
are not written by us, instead they are pulled directly from IETF.

The procedure is more or less like (environment variable ${RFC_HOME}
holds absolute path to is project folder):

$> cd ${RFC_HOME}
$> mkdir bib_full && cd bib_full
$> curl -O http://xml.resource.org/public/rfc/bibxml.tgz
$> tar -xzf bibxml.tgz && rm -f bibxml.tgz
$> rfcs='2119 4627 5165'
$> for rfc in $rfcs; do cp -a reference.RFC.${rfc}.xml ../bib/; done
$> cd .. && rm -fr bib_full

