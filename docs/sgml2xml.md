SGML2XML(1)                                                                                                                            SGML2XML(1)

NAME
       sgml2xml - convert SGML to XML

       An SGML System Conforming to International Standard ISO 8879 — Standard Generalized Markup Language

SYNOPSIS
       sgml2xml [ -Cehilprvx ]  [ -bencoding ]  [ -ccatalog ]  [ -Ddir ]  [ -ffile ]  [ -iname ]  [ -wwarning ]  [ -xxml-output-option ]  sysid...

DESCRIPTION
       sgml2xml converts SGML to XML.  sgml2xml parses and validates the SGML document contained in sysid... and writes an equivalent XML document
       to the standard output. sgml2xml will warn about SGML constructs which have no XML equivalent.

OPTIONS
       -bencoding
              Use encoding for output.  The default is UTF-8. See nsgmls(1) for the possible encoding types.

       -ccatalog
              Use the catalog entry file file.

       -C     The filename... arguments specify catalog files rather than the document entity. The document entity is specified by the first DOCU‐
              MENT entry in the catalog files.

       -Ddirectory
              Search  directory  for  files  specified  in system identifiers. Multiple -D options are allowed. See nsgmls(1) for more information
              about this option.

       -e     Describe open entities in error messages.

       -ffile Redirect errors to file.  This is useful only for shells that do not support redirection of stderr.

       -iname Pretend that <!ENTITY % name "INCLUDE"> occurs at the start of the document type declaration subset in  the  SGML  document  entity.
              Since  repeated definitions of an entity are ignored, this definition will take precedence over any other definitions of this entity
              in the document type declaration. Multiple -i options are allowed. If the SGML declaration replaces the reserved name  INCLUDE  then
              the  new  reserved  name will be the replacement text of the entity. Typically the document type declaration will contain <!ENTITY %
              name "IGNORE"> and will use %name; in the status keyword specification of a marked section declaration. In this case the  effect  of
              the option will be to cause the marked section not to be ignored.

       -v     Print the version number.

       -wtype Control warnings and errors according to type.  See nsgmls(1) for the allowed values of type.

       -xxml-output-option
              Control the XML output, according to the value of xml_output_option as follows:

              no-nl-in-tag
                     Don't  use  newlines  inside  start-tags. Usually sgml2xml uses newlines inside start-tags so as to reduce the probability of
                     excessively long lines.

              id     Output attribute declarations for ID attributes.

              notation
                     Output declarations for notations.

              ndata  Output declarations for external data entities. XML requires these to be NDATA. sgml2xml will  warn  about  CDATA  and  SDATA
                     external data entities and output them as NDATA entities.

              cdata  Use XML CDATA sections for CDATA marked sections and for elements with a declared content of CDATA.

              comment
                     Output comment declarations. Comment declarations in the DTD will not be output.

              lower  Prefer  lower  case. Names that were subjected to upper-case substitution by SGML will be folded to lower case. This does not
                     include reserved names; XML requires these to be in upper-case.

              pi-escape
                     Escape &<> in the contents of processing instructions using the amp, lt and gt entities. This allows processing  instructions
                     to contain the string >?, but requires that applications handle the escapes.

              empty  Use the <e/> syntax for element types e declared as EMPTY.

              attlist
                     Output a ATTLIST declaration for every element specifying the type of all attributes. The default will always be #IMPLIED.

       Multiple -x options are allowed.

AUTHOR
       James Clark <jjc@jclark.com>

       Conversion to DocBook and man page from original HTML documention by Steve Cheng <steve@ggi-project.org>.

SEE ALSO
       nsgmls(1)

       /usr/share/doc/sp/sx.htm

SP                                                                 05 July 1999                                                        SGML2XML(1)
