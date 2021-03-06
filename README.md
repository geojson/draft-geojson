# GeoJSON

[![Circle CI](https://circleci.com/gh/geojson/draft-geojson.svg?style=svg)](https://circleci.com/gh/geojson/draft-geojson)

Incubator for GeoJSON spec rewrite and subsequent IETF RFC submission.

## Status

An IETF WG has been chartered: https://tools.ietf.org/wg/geojson/ and has
adopted `draft-butler-geojson`. The official draft is
https://datatracker.ietf.org/doc/draft-ietf-geojson/.

## Contributing

Substantial discussion happens on the GeoJSON email list:
https://www.ietf.org/mailman/listinfo/geojson. Specific edits to the draft
are made via issues and pull requests in this GitHub repo.

See https://github.com/geojson/draft-geojson/blob/master/CONTRIBUTING.md

## Generating Docs

This project uses the workflow described in
http://tools.ietf.org/html/rfc7328.html to generate RFC text from Markdown
files and an XML template.

### Dependencies

 * [`xml2rfc`](https://pypi.python.org/pypi/xml2rfc/)
 * [`pandoc2rfc`](https://raw.github.com/miekg/pandoc2rfc/master/pandoc2rfc)

### Transform Markdown to XML etc.

Inside the working copy of the repo run the build script to manifest the draft
as HTML, nroff, XML, and plain text.

```bash
$ make
```
