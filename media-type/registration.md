application/vnd.geo+json registration
-------------------------------------

Based on http://www.iana.org/assignments/media-types/application/vnd.hal+json.

##Name

Sean Gillies

##Email

sean.gillies@gmai.com

##MIME media type name

Application

##MIME subtype name

Vendor Tree - vnd.geo+json

##Required parameters

N/A

## Optional parameters

N/A

## Encoding considerations

binary

## Security considerations

vnd.geo+json shares security issues common to all JSON content
types. See RFC4627 Section #6
(http://tools.ietf.org/html/rfc4627#section-6) for additional
information. vnd.geo+json does not provide executable content.
Information contained in vnd.geo+json documents do not require
privacy or integrity services.

As with other geographic data formats, providing details about the locations of
sensitive persons, animals, habitats, or facilities can expose them to
unauthorized tracking or injury.

##Interoperability considerations

There is a difference of opinion among geographic data formats
over whether latitude or longitude come first in a pair of
numbers. Longitude comes first in vnd.geo+json coordinates.

## Published specification

http://geojson.org/ and
https://datatracker.ietf.org/doc/draft-butler-geojson/

##Applications which use this media

Various. See https://en.wikipedia.org/wiki/GeoJSON#Supported_software
for a list of software.

##Additional information

1. Magic number(s) : N/A
2. File extension(s) : .json, .geojson
3. Macintosh file type code : TEXT
4. Object Identifiers: N/A


##Person to contact for further information

1. Name : Sean Gillies
2. Email : sean.gillies@gmail.com

##Intended usage : Common

GeoJSON is a geospatial data interchange format based on JavaScript
Object Notation (JSON).  It defines several types of JSON objects and
the manner in which they are combined to represent data about
geographic features, their properties, and their spatial extents.

