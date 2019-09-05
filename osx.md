OSX(1)                                                               Reference                                                              OSX(1)

NAME
       osx - An SGML to XML converter

SYNOPSIS
       osx [-CeghnRvx] [-aname] [-Aarchitecture] [-bencoding] [-ccatalog_file] [-ddirectory] [-Ddirectory] [-iname] [-ffile] [-ldtd_file]
           [-wwarning_type] [-xxml_output_option...] [sysid...]

DESCRIPTION
       osx converts SGML to XML.  osx parses and validates the SGML document contained in

       and writes an equivalent XML document to the standard output.  osx will warn about SGML constructs which have no XML equivalent.

       Part of an SGML System Conforming to International Standard ISO 8879 -- Standard Generalized Markup Language. An SGML Extended Facilities
       system conforming to Annex A of International Standard ISO/IEC 10744 -- Hypermedia/Time-based Structuring Language.

OPTIONS
       The following options are available:

       -aname, --activate=name
           Make doctype or linkname name active.

       -Aname, --architecture=name
           Parse with respect to architecture name.

       -bencoding, --encoding=encoding
           Use the BCTF encoding for output. By default osx uses UTF-8.

       -csysid, --catalog=sysid
           Map public identifiers and entity names to system identifiers using the catalog entry file whose system identifier is sysid.

       -C, --catalogs
           This has the same effect as in onsgmls(1).

       -ddirectory, --entity_output_location=directory
           Place output files in directory.

       -Ddirectory, --directory=directory
           Search directory for files specified in system identifiers. This has the same effect as in onsgmls(1).

       -e, --open-entities
           Describe open entities in error messages.

       -Emax_errors, --max-errors=max_errors
           Give up after max_errors errors.

       -ffile, --error-file=file
           Redirect errors to file. This is useful mainly with shells that do not support redirection of stderr.

       -g, --open-elements
           Describe open elements in error messages.

       -h, --help
           Display a help text and exit.

       -iname, --include=name
           This has the same effect as in onsgmls(1).

       -ldtd-file, --dtd_location=dtd-file
           Specify that the resulting XML file should conform to the DTD in dtd-file.

       -n, --error-numbers
           Show error numbers in error messages.

       --references
           Show references in error messages.

       -R, --restricted
           This has the same effect as in onsgmls(1).

       -v, --version
           Print the version number and exit.

       -wtype, --warning=type
           Control warnings and errors according to type. This has the same effect as in onsgmls(1).

       -xxml_output_option, --xml-output-option=xml_output_option
           Control the XML output according to the value of xml_output_option as follows:

           no-nl-in-tag Don't use newlines inside start-tags. Usually osx uses newlines inside start-tags so as to reduce the probability of
           excessively long lines.

           id Output attribute declarations for ID attributes.

           notation Output declarations for notations.

           ndata Output declarations for external data entities. XML requires these to be NDATA.  osx will warn about CDATA and SDATA external
           data entities and output them as NDATA entities.

           cdata Use XML CDATA sections for CDATA marked sections and for elements with a declared content of CDATA.

           comment Output comment declarations. Comment declarations in the DTD will not be output.

           lower Prefer lower case. Names that were subjected to upper-case substitution by SGML will be folded to lower case. This does not
           include reserved names; XML requires these to be in upper-case.

           pi-escape Escape &<> in the contents of processing instructions using the amp, lt and gt entities. This allows processing instructions
           to contain the string >?, but requires that applications handle the escapes.

           empty Use the <e/> syntax for element types e declared as EMPTY.

           attlist Output an ATTLIST declaration for every element specifying the type of all attributes. The default will always be #IMPLIED.

           report-input-sources Output a processing instruction to report when an input source other than the main file is opened or closed in the
           instance. Do not report any input source changes in the DTD.

           report-entities Output a processing instruction to report when an external entity reference has been resolved in the instance. Do not
           report any entity resolutions in the DTD.

           no-expand-external Preserve external entities, write a declaration driver file named "extEntities.dtf", and include that file in the
           instance's internal subset.

           no-expand-internal Preserve internal entities, write a declaration driver file named "intEntities.dtf", and include that file in the
           instance's internal subset.

           no-external-decl Do not include the external entities declaration driver file in the instance's internal subset.

           no-internal-decl Do not include the internal entities declaration driver file in the instance's internal subset.

           no-output-outside-outdir When preserving external entities, do not write output files outside the specified output directory ("." by
           default). In other words, if an external entity's system identifier includes enough instances of ".." to cause osx to write a file
           outside (above) the output directory, exit (by default osx will issue a warning but will write the file and continue.

           no-overwrite When preserving internal or external entities, multiple output files will be written. If this option is specified, do not
           overwrite existing files; instead, attempt to append a number to the end of the original filename to create a unique filename. Exit
           with an error if too many (100) such files already exist.

           preserve-case Preserve casing as specified in the DTD for element names; attribute names; attribute values which are token lists.

           sdata-as-pis When translating SDATA entities (whether expanding them or providing a definition for them in the output's internal
           subset), express them as processing instructions instead of as general internal entities.

           Multiple -x options are allowed.

SEE ALSO
       onsgmls(1), ospam(1), osgmlnorm(1), ospent(1)

AUTHORS
       James Clark
           Author.

       Ian Castle <ian.castle@openjade.org>
           Author.

COPYRIGHT
OpenJade                                                           November 2002                                                            OSX(1)
