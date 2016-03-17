Proposed GeoJSON WG Charter
===========================

GeoJSON
-------

GeoJSON is a format for encoding data about geographic features using
JavaScript Object Notation (JSON) [RFC7159]. Geographic features need not be
physical things; any thing with properties that are bounded in space may be
considered a feature. GeoJSON provides a means of representing both the
properties and spatial extent of features.

The GeoJSON format specification was published at http://geojson.org in 2008.
GeoJSON today plays an important and growing role in many spatial databases, web
APIs, and open data platforms. Consequently, implementers increasingly demand
formal standardization, improvements in the specification, guidance on
extensibility, and the means to utilize larger GeoJSON datasets.

This WG will work on a GeoJSON Format RFC that specifies the format more
precisely, serves as a better guide for implementers, and improves extensibility
of the format. The work will start from an Internet-Draft written by the
original GeoJSON authors: draft-butler-geojson [1].

This WG will work on GeoJSON mappings of 'geo' URIs, reinforcing the use of RFC
5870.

This WG will work on a format for a streamable sequence of GeoJSON texts based
on RFC 7464 (JSON Text Sequences) to address the difficulties in serializing
very large sequences of features or feature sequences of indeterminate length.

GeoJSON objects represent geographic features only and do not specify
associations between geographic features and particular devices, users, or
facilities. Any association with a particular device, user, or facility requires
another protocol. As such, a GeoJSON object does not fit the "Location
Information" definition according to Section 5.2 of RFC 3693, because there is
not necessarily a "Device" involved. Because there is also no way to specify the
identity of a "Target" within the confines of a GeoJSON object, it also does not
fit the specification of a "Location Object" (Section 5.2 of RFC 3693, Section
3.2 of RFC 6280). When a GeoJSON object is used in a context where it identifies
the location of a target, it becomes subject to the architectural, security, and
privacy considerations in RFC 6280. The application of those considerations is
specific to protocols that make use of GeoJSON objects and is out of scope for
the GeoJSON WG. As the WG considers extensibility it will be careful not to
preclude extensions that would allow GeoJSON objects to become location objects
unless the group determines such extensibility would be harmful. 

Deliverables:

* A GeoJSON format specification document including mappings of 'geo' URIs 
* A document describing a format for a streamable sequence of GeoJSON texts

[1] https://tools.ietf.org/html/draft-butler-geojson
