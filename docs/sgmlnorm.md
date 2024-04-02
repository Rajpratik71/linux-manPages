SGMLNORM(1)                                                                                                                            SGMLNORM(1)

NAME
       sgmlnorm - normalize SGML documents

       An SGML System Conforming to International Standard ISO 8879 -- Standard Generalized Markup Language

SYNOPSIS
       sgmlnorm [ -Cdemnv ]  [ -bbctf ]  [ -ccatalog ]  [ -Ddir ]  [ -iname ]  [ -wwarning ]  sysid...

DESCRIPTION
       sgmlnorm  prints on the standard output a normalized document instance for the SGML document contained in the concatenation of the entities
       with system identifiers sysid...

       When the normalized instance is prefixed with the original SGML declaration and prolog, it will have the same ESIS  as  the  original  SGML
       document, with the following exceptions:

       · The output of sgmlnorm does not protect against the recognition of short reference delimiters, so any USEMAP declarations must be removed
         from the DTD.

       · The normalized instance will use the reference delimiters, even if the original instance did not.

       · If marked sections are included in the output using the -m option, the reference reserved names will be used for the status keywords even
         if the original instance did not.

       · Any ESIS information relating to the SGML LINK feature will be lost.

       The normalized instance will not use any markup minimization features except that:

       · Any  attributes  that  were  not specified in the original instance will not be included in the normalized instance.  (Current attributes
         will be included.)

       · If the declared value of an attribute was a name token group, and a value was specified that was the same as the name of  the  attribute,
         then  the  attribute name and value indicator will be omitted.  For example, with HTML sgmlnorm would output <DL COMPACT> rather than <DL
         COMPACT="COMPACT">.

OPTIONS
       -bbctf Use the BCTF name bctf for output.  See nsgmls(1) for more information about this option.

       -cfile Use the catalog entry file file.

       -C     The filename... arguments specify catalog files rather than the document entity. The document entity is specified by the first DOCU‐
              MENT entry in the catalog files.

       -d     Output a document type declaration with the same external identifier as the input document, and with no internal declaration subset.
              No check is performed that the document instance is valid with respect to this DTD.

       -Ddirectory
              Search directory for files specified in system identifiers. Multiple -D options are allowed.  See  nsgmls(1)  for  more  information
              about this option.

       -e     Describe open entities in error messages.

       -iname Pretend  that  <!ENTITY  %  name "INCLUDE"> occurs at the start of the document type declaration subset in the SGML document entity.
              Since repeated definitions of an entity are ignored, this definition will take precedence over any other definitions of this  entity
              in  the  document type declaration. Multiple -i options are allowed. If the SGML declaration replaces the reserved name INCLUDE then
              the new reserved name will be the replacement text of the entity. Typically the document type declaration will  contain  <!ENTITY  %
              name  "IGNORE">  and will use %name; in the status keyword specification of a marked section declaration. In this case the effect of
              the option will be to cause the marked section not to be ignored.

       -m     Output any marked sections that were in the input document instance.

       -n     Output any comments that were in the input document instance.

       -r     Raw output.  Don't perform any conversion on RSs and REs when printing the entity.  The entity would typically have the storage man‐
              ager attribute records=asis.

       -v     Print the version number.

       -wtype Control warnings and errors according to type.  See nsgmls(1) for the allowed values of type.

AUTHOR
       James Clark <jjc@jclark.com>

       Conversion to DocBook and man page from original HTML documention by Steve Cheng <steve@ggi-project.org>.

SEE ALSO
       nsgmls(1)

       /usr/share/doc/sp/sgmlnorm.htm

SP                                                                 05 July 1999                                                        SGMLNORM(1)
