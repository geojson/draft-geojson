geojson
=======

Incubator for geojson spec rewrite and subsequent IETF RFC submission.

status
------

Test and development. The idnits tool from IETF already reports 0 errors.

todo
----

Some issues are to be resolved, others are not yet known:

* Is the migration from the crs object to a crs reference ok?

* Namespace or profile - howto enable optional hints (for consumers of GeoJSON objects) in a natrual way

* Are the formal changes applied to the existing community spec at <http://geojson.org/geojson-spec.html> ok?

* Is there consensus, that the mostly editorial changes apllied are also an enhancement or where these have to be reversed or completed?

* Check with all authors of current version 1.0 spec, if they are willing to act as authors, or only appear in the contributors section

* What about an ANTLR4 grammar as non-normative appendix B after the examples and before the contributors (which then would become Appendix C)?

* Surely no (A)BNF as GeoJSON is simply not describable through ABNF (case sensitivity is missing from literals in ABNF :-) ! ... right?

* Another possible model would be: One person as Editor on frontpage with affiliation Editor (or geojson.org like the KSON RFC) and all others in the contributor section?

* There is also an Acknowledgments section possible in addition to (or replacing) a contributor section, where the former is mor for lengthy thanks, which might not fit so well with the approx 15 pages total of the to be submitted paginated text RFC draft ...



