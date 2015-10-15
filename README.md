# GeoJSON

Incubator for GeoJSON spec rewrite and subsequent IETF RFC submission.

## Status

See https://datatracker.ietf.org/doc/draft-butler-geojson/.

## Contributing

See https://github.com/geojson/draft-geojson/blob/master/CONTRIBUTING.md

## Generating Docs

### Dependencies

 * [`xml2rfc`](https://pypi.python.org/pypi/xml2rfc/)
 * [`pandoc2rfc`](https://raw.github.com/miekg/pandoc2rfc/master/pandoc2rfc)

### Transform Markdown to XML etc.

Inside the working copy of the repo perform (current practice):

```bash
bash pandoc2rfc -R -t template.xml -x transform.xsl back.mkd middle.mkd && mv draft.txt draft-unpaginated.txt && for i in H N T X; do bash pandoc2rfc -$i -t template.xml -x transform.xsl back.mkd middle.mkd; done
```
