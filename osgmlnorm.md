OSGMLNORM(1)                                                         Reference                                                        OSGMLNORM(1)

NAME
       osgmlnorm - An SGML/XML document normalizer

SYNOPSIS
       osgmlnorm [-CdeghmnrRvx] [-alinktype] [-Aarchitecture] [-bbctf] [-ccatalog] [-Ddirectory...] [-Emax_errors...] [-iname...] [-fname...]
                 [-wwarning...] [sysid...]

DESCRIPTION
       osgmlnorm prints on the standard output a normalized document instance for the SGML document contained in the concatenation of the entities
       with system identifiers

       When the normalized instance is prefixed with the original SGML declaration and prolog, it will have the same ESIS as the original SGML
       document, with the following exceptions:

       * The output of osgmlnorm does not protect against the recognition of short reference delimiters, so any USEMAP declarations must be
       removed from the DTD.

       * The normalized instance will use the reference delimiters, even if the original instance did not.

       * If marked sections are included in the output using the -m option, the reference reserved names will be used for the status keywords even
       if the original instance did not.

       * Any ESIS information relating to the SGML LINK feature will be lost.

       The normalized instance will not use any markup minimization features except that:

       * Any attributes that were not specified in the original instance will not be included in the normalized instance. (Current attributes will
       be included.)

       * If the declared value of an attribute was a name token group, and a value was specified that was the same as the name of the attribute,
       then the attribute name and value indicator will be omitted. For example, with HTML osgmlnorm would output <DL COMPACT> rather than <DL
       COMPACT="COMPACT">

       Part of an SGML System Conforming to International Standard ISO 8879 -- Standard Generalized Markup Language. An SGML Extended Facilities
       system conforming to Annex A of International Standard ISO/IEC 10744 -- Hypermedia/Time-based Structuring Language.

       The following options are available:

       -aname, --activate=name
           Make doctype or linktype name active.

       -Aarchitecture, --architecture=architecture
           Parse with respect to architecture architecture.

       -bbctf, --bctf=bctf
           Use the BCTF with name bctf for output.

       -csysid, --catalog=sysid
           Map public identifiers and entity names to system identifiers using the catalog entry file whose system identifier is sysid.

       -C, --catalogs
           This has the same effect as in onsgmls(1).

       -d, --dtd
           Output a document type declaration with the same external identifier as the input document, and with no internal declaration subset. No
           check is performed that the document instance is valid with respect to this DTD.

       -Ddirectory, --directory=directory
           Search directory for files specified in system identifiers.

           This has the same effect as in onsgmls(1).

       -e, --open-entities
           Describe open entities in error messages.

       --error-numbers
           Show error numbers in error messages.

       -h, --help
           Display a help text and exit.

       -iname, --include=name
           This has the same effect as in onsgmls(1).

       -m, --marked-sections
           Output any marked sections that were in the input document instance.

       -n, --comments
           Output any comments that were in the input document instance.

       -r, --raw
           Raw output. Don't perform any conversion on RSs and REs when printing the entity. The entity would typically have the storage manager
           attribute records=asis.

       -R, --restricted
           This has the same effect as in onsgmls(1).

       -v, --version
           Print the version number.

       -wtype
           Control warnings and errors according to type. This has the same effect as in onsgmls(1).

SEE ALSO
       onsgmls(1), ospam(1), ospent(1), osx(1)

AUTHORS
       James Clark
           Author.

       Ian Castle <ian.castle@openjade.org>
           Author.

COPYRIGHT
OpenJade                                                           January 2002                                                       OSGMLNORM(1)
