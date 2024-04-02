OSPAM(1)                                                             Reference                                                            OSPAM(1)

NAME
       ospam - An SGML/XML markup stream editor

SYNOPSIS
       ospam [-CeghilprRvx] [-alinktype] [-Aarchitecture] [-bbctf] [-ccatalog_file] [-Ddirectory] [-ffile] [-mmarkup_option] [-oentity_name]
             [-wwarning_type] [sysid...]

DESCRIPTION
       ospam (OpenSP Add Markup) is an SGML markup stream editor implemented using the OpenSP parser.  ospam parses the SGML document contained in
       sysid and copies to the standard output the portion of the document entity containing the document instance, adding or changing markup as
       specified by the -m options. The -p option can be used to include the SGML declaration and prolog in the output. The -o option can be used
       to output other entities. The -x option can be used to expand entity references.

       Part of an SGML System Conforming to International Standard ISO 8879 -- Standard Generalized Markup Language. An SGML Extended Facilities
       system conforming to Annex A of Internation Standard ISO/IEC 10744 -- Hypermedia/Time-based Structuring Language.

       The following options are available:

       -aname, --activate=name
           Make doctype or linktype name active.

       -Aarchitecture, --architecture=architecture
           Parse with respect to architecture architecture.

       -bbctf, --bctf=bctf
           Use bctf bctf for output.

       -csysid, --catalog=sysid
           Use the catalog entry file sysid.

       -C, --catalogs
           This has the same effect as in onsgmls(1).

       -Ddirectory, --directory=directory
           Search directory for files specified in system identifiers. This has the same effect as in onsgmls(1).

       -e, --open-entities
           Describe open entities in error messages.

       -Emax_errors, --max-errors=max_errors
           Exit after max_errors errors are encountered.

       -ffile, --error-file=file
           Redirect errors to file. This is useful mainly with shells that do not support redirection of stderr.

       -h, --hoist-omitted-tags
           Hoist omitted tags out from the start of internal entities. If the text at the beginning of an internal entity causes a tag to be
           implied, the tag will usually be treated as being in that internal entity; this option will instead cause it to be treated as being in
           the entity that referenced the internal entity. This option makes a difference in conjunction with -momittag or -x-x.

       --help
           Display a help text and exit.

       -iname, --include=name
           This has the same effect as in onsgmls(1).

       -l, --lowercase
           Prefer lower-case. Added names that were subject to upper-case substitution will be converted to lower-case.

       -mmarkup_option, --markup-option=markup_option
           Change the markup in the output according to the value of markup_option as follows:

           omittag Add tags that were omitted using omitted tag minimization. End tags that were omitted because the element has a declared
           content of EMPTY or an explicit content reference will not be added.

           shortref Replace short references by named entity references.

           net Change null end-tags into unminimized end-tags, and change net-enabling start-tags into unminimized start-tags.

           emptytag Change empty tags into unminimized tags.

           unclosed Change unclosed tags into unminimized tags.

           attname Add omitted attribute names and vis.

           attvalue Add literal delimiters omitted from attribute values.

           attspec Add omitted attribute specifications.

           current Add omitted attribute specifications for current attributes. This option is implied by the attspec option.

           shorttag Equivalent to combination of net, emptytag, unclosed, attname, attvalue and attspec options.

           rank Add omitted rank suffixes.

           reserved Put reserved names in upper-case.

           ms Remove marked section declarations whose effective status is IGNORE, and replace each marked section declaration whose effective
           status is INCLUDE by its marked section. In the document instance, empty comments will be added before or after the marked section
           declaration to ensure that ignored record ends remain ignored.

           Multiple -m options are allowed.

       -n, --error-numbers
           Show error numbers in error messages.

       -oname, --output-entity=name
           Output the general entity name instead of the document entity. The output will correspond to the first time that the entity is
           referenced in content.

       -p, --output-prolog
           Output the part of the document entity containing the SGML declaration (if it was explicitly present in the document entity) and the
           prolog before anything else. If this option is specified two or more times, then all entity references occurring between declarations
           in the prolog will be expanded; this includes the implicit reference to the entity containing the external subset of the DTD, if there
           is one. Note that the SGML declaration will not be included if it was specified by an SGMLDECL entry in a catalog.

       -r, --raw
           Don't perform any conversion on RSs and REs when outputting the entity. The entity would typically have the storage manager attribute
           records=asis.

       -R, --restricted
           This as the same effect as in onsgmls(1)

       -v, --version
           Print the version number.

       -wtype, --warning=type
           Control warnings and errors according to type. This has the same effect as in onsgmls(1).

       -x, --expand-references
           Expand references to entities that are changed. If this option is specified two or more times, then all references to entities that
           contain tags will be expanded.

BUGS
       Omitted tags are added at the point where they are implied by the SGML parser (except as modified by the -h option); this is often not
       quite where they are wanted.

       The case of general delimiters is not preserved.

       Incorrect results may be produced if a variant concrete syntax is used which is such that there are delimiters in markup to be added that
       have a prefix that is a proper suffix of some other delimiter.

       If an entity reference in a default value uses the default entity and an entity with that name is subsequently defined and that default
       value is added to the document instance, then the resulting document may not be equivalent to the original document.  ospam will give a
       warning when the first two conditions are met.

SEE ALSO
       onsgmls(1), ospent(1), osgmlnorm(1), osx(1)

AUTHORS
       James Clark
           Author.

       Ian Castle <ian.castle@openjade.org>
           Author.

COPYRIGHT
OpenJade                                                           November 2002                                                          OSPAM(1)
