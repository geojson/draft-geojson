application/vnd.geo+json registration
-------------------------------------

Based on http://www.iana.org/assignments/media-types/application/vnd.hal+json.

##Name

Sean Gillies

##Email

sean.gillies@gmail.com

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

vnd.geo+json shares security issues common to all JSON content types.
See RFC7159 Section #12 (http://tools.ietf.org/html/rfc7159#section-12)
for additional information. vnd.geo+json does not provide executable
content. 

As with other geographic data formats, e.g.,
application/vnd.google-earth.kml+xml, providing details about the locations of
sensitive persons, animals, habitats, and facilities can expose them to
unauthorized tracking or injury. vnd.geo+json does not provide privacy or
integrity services; if sensitive data requires privacy or integrity protection
the service must be provided externally.

##Interoperability considerations

There is a difference of opinion among geographic data formats
over whether latitude or longitude come first in a pair of
numbers. Longitude comes first in vnd.geo+json coordinates as it 
does in application/vnd.google-earth.kml+xml.

## Published specification

http://geojson.org/

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

