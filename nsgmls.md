NSGMLS(1)                                                     General Commands Manual                                                    NSGMLS(1)

NAME
       nsgmls - a validating SGML parser

       An  System Conforming to
       International Standard ISO 8879 —
       Standard Generalized Markup Language

SYNOPSIS
       nsgmls  [  -BCdeglprsuv  ] [ -alinktype ] [ -b(bctf|encoding) ] [ -Ddirectory ] [ -Emax_errors ] [ -ffile ] [ -iname ] [ -msysid ] [ -oout‐
       put_option ] [ -tfile ] [ -wwarning_type ] [ sysid...  ]

WARNING
       This manual page may be out of date.  Consult the HTML documentation for the most up-to-date information concerning this program.  You  can
       find the HTML document in: /usr/share/doc/sp/nsgmls.htm

DESCRIPTION
       Nsgmls parses and validates the  document whose document entity is specified by the system identifiers sysid...  and prints on the standard
       output a simple text representation of its Element Structure Information Set.  (This is the information set  which  a  structure-controlled
       conforming   application  should act upon.)  The form of system identifiers is described in detail below; a system identifier that does not
       start with < and does not look like an absolute URL will be treated as a filename.  If more than one system identifier is  specified,  then
       the corresponding entities will be concatenated to form the document entity.  Thus the document entity may be spread amongst several files;
       for example, the SGML declaration, prolog and document instance set could each be in a separate file.  If no system identifiers are  speci‐
       fied, then nsgmls will read the document entity from the standard input.  A command line system identifier of - can be used to refer to the
       standard input.  (Normally in a system identifier, <osfd>0 is used to refer to standard input.)

       The following options are available:

       -alinktype
              Make link type linktype active.  Not all ESIS information is output in this case: the  active  LPDs  are  not  explicitly  reported,
              although  each  link  attribute  is qualified with its link type name; there is no information about result elements; when there are
              multiple link rules applicable to the current element, nsgmls always chooses the first.

       -b(bctf|encoding)
              This determines the encoding used for output. If in fixed character set mode it specifies the name of an encoding; if not, it speci‐
              fies the name of a BCTF.  See the description below of the bctf storage manager attribute for more information.

       -B     Batch mode. Parse each sysid... specified on the command line separately, rather than concatenating them. This is useful mainly with
              -s.
              If -tfilename is also specified, then the specified filename will be prefixed to the sysid to make the filename for the RAST  result
              for each sysid.

       -C     The  filename...   arguments  specify  catalog files rather than the document entity.  The document entity is specified by the first
              DOCUMENT entry in the catalog files.

       -Ddirectory
              Search directory for files specified in system identifiers.  Multiple -D options are allowed.  See the  description  of  the  osfile
              storage manager for more information about file searching.

       -e     Describe open entities in error messages.  Error messages always include the position of the most recently opened external entity.

       -E max_errors
              Nsgmls will exit after max_errors errors. If max_errors is 0, there is no limit on the number of errors. The default is 200.

       -ffile Redirect errors to file.  This is useful mainly with shells that do not support redirection of stderr.

       -g     Show the GIs of open elements in error messages.

       -iname Pretend that

                     <!ENTITY % name "INCLUDE">

              occurs  at  the  start of the document type declaration subset in the  document entity.  Since repeated definitions of an entity are
              ignored, this definition will take precedence over any other definitions of this entity in the document type declaration.   Multiple
              -i  options  are allowed.  If the  declaration replaces the reserved name INCLUDE then the new reserved name will be the replacement
              text of the entity.  Typically the document type declaration will contain

                     <!ENTITY % name "IGNORE">

              and will use %name; in the status keyword specification of a marked section declaration.  In this case the effect of the option will
              be to cause the marked section not to be ignored.

       -msysid
              Map public identifiers and entity names to system identifiers using the catalog entry file whose system identifier is sysid.  Multi‐
              ple -m options are allowed.  If there is a catalog entry file called catalog in the same place as the document entity,  it  will  be
              searched for immediately after those specified by -m.

       -ooutput_option
              Output additional information accordig to output_option:

              entity Output  definitions of all general entities not just for data or subdoc entities that are referenced or named in an ENTITY or
                     ENTITIES attribute.

              id     Distinguish attributes whose declared value is ID.

              line   Output L commands giving the current line number and filename.

              included
                     Output an i command for included subelements.

              Multiple -o options are allowed.

       -p     Parse only the prolog.  Nsgmls will exit after parsing the document type declaration.  Implies -s.

       -s     Suppress output.  Error messages will still be printed.

       -tfile Output to file the RAST result as defined by ISO/IEC 13673:1995 (actually this isn't quite an IS yet; this implements the Intermedi‐
              ate Editor's Draft of 1994/08/29, with changes to implement ISO/IEC JTC1/SC18/WG8 N1777).  The normal output is not produced.

       -v     Print the version number.

       -wtype Control warnings and errors.  Multiple -w options are allowed.  The following values of type enable warnings:

              mixed  Warn about mixed content models that do not allow #pcdata anywhere.

              sgmldecl
                     Warn about various dubious constructions in the SGML declaration.

              should Warn  about  various recommendations made in ISO 8879 that the document does not comply with.  (Recommendations are expressed
                     with ``should'', as distinct from requirements which are usually expressed with ``shall''.)

              default
                     Warn about defaulted references.

              duplicate
                     Warn about duplicate entity declarations.

              undefined
                     Warn about undefined elements: elements used in the DTD but not defined.

              unclosed
                     Warn about unclosed start and end-tags.

              empty  Warn about empty start and end-tags.

              net    Warn about net-enabling start-tags and null end-tags.

              min-tag
                     Warn about minimized start and end-tags.  Equivalent to combination of unclosed, empty and net warnings.

              unused-map
                     Warn about unused short reference maps: maps that are declared with a short reference mapping declaration but never used in a
                     short reference use declaration in the DTD.

              unused-param
                     Warn about parameter entities that are defined but not used in a DTD.

              all    Warn  about conditions that should usually be avoided (in the opinion of the author).  Equivalent to: mixed, should, default,
                     undefined, sgmldecl, unused-map, unused-param, empty and unclosed.

              A warning can be disabled by using its name prefixed with no-.  Thus -wall -wno-duplicate will  enable  all  warnings  except  those
              about duplicate entity declarations.

              The following values for warning_type disable errors:

              no-idref
                     Do  not  give  an  error  for  an ID reference value which no element has as its ID.  The effect will be as if each attribute
                     declared as an ID reference value had been declared as a name.

              no-significant
                     Do not give an error when a character that is not a significant character in the reference concrete syntax occurs in  a  lit‐
                     eral in the SGML declaration.  This may be useful in conjunction with certain buggy test suites.

       The following options are also supported for backwards compatibility with sgmls:

       -d     Same as -wduplicate.

       -l     Same as -oline.

       -r     Same as -wdefault.

       -u     Same as -wundef.

   System identifiers
       A  system  identifier  can either be a formal system identifier or a simple system identifier.  A system identifier that is a formal system
       identifier consists of a sequence of one or more storage object specifications.  The objects specified by the storage object specifications
       are  concatenated  to  form the entity.  A storage object specification consists of an SGML start-tag in the reference concrete syntax fol‐
       lowed by character data content.  The generic identifier of the start-tag is the name of a storage  manager.   The  content  is  a  storage
       object  identifier  which  identifies  the  storage  object  in  a manner dependent on the storage manager.  The start-tag can also specify
       attributes giving additional information about the storage object.  Numeric character references are recognized in storage  object  identi‐
       fiers  and  attribute  value  literals  in the start-tag.  Record ends are ignored in the storage object identifier as with SGML.  A system
       identifier will be interpreted as a formal system identifier if it starts with a < followed by a storage manager name, followed by either >
       or  white-space;  otherwise it will be interpreted as a simple system identifier.  A storage object identifier extends until the end of the
       system identifier or until the first occurrence of < followed by a storage manager name, followed by either > or white-space.

       The following storage managers are available:

       osfile The storage object identifier is a filename.  If the filename is relative it is resolved using a base filename.  Normally  the  base
              filename  is  the  name  of  the  file  in which the storage object identifier was specified, but this can be changed using the base
              attribute.  The filename will be searched for first in the directory of the base filename.  If it is not found there, then  it  will
              be  searched for in directories specified with the -D option in the order in which they were specified on the command line, and then
              in the list of directories specified by the environment variable SGML_SEARCH_PATH.  The list is separated by colons under  Unix  and
              by semi-colons under MSDOS.

       osfd   The  storage  object  identifier  is an integer specifying a file descriptor.  Thus a system identifier of <osfd>0 will refer to the
              standard input.

       url    The storage object identifier is a URL.  Only the http scheme is currently supported and not on all systems.

       neutral
              The storage manager is the storage manager of storage object in which the system identifier was specified  (the  underlying  storage
              manager).   However  if the underlying storage manager does not support named storage objects (ie it is osfd), then the storage man‐
              ager will be osfile.  The storage object identifier is treated as a relative, hierarchical name separated by slashes (/) and will be
              transformed as appropriate for the underlying storage manager.

       The following attributes are supported:

       records
              This describes how records are delimited in the storage object:

              cr     Records are terminated by a carriage return.

              lf     Records are terminated by a line feed.

              crlf   Records are terminated by a carriage return followed by a line feed.

              find   Records are terminated by whichever of cr, lf or crlf is first encountered in the storage object.

              asis   No recognition of records is performed.

              The default is find except for NDATA entities for which the default is asis.

              When records are recognized in a storage object, a record start is inserted at the beginning of each record, and a record end at the
              end of each record.  If there is a partial record (a record that doesn't end with the record terminator) at the end of  the  entity,
              then a record start will be inserted before it but no record end will be inserted after it.

              The attribute name and = can be omitted for this attribute.

       zapeof This  specifies whether a Control-Z character that occurs as the final byte in the storage object should be stripped.  The following
              values are allowed:

              zapeof A final Control-Z should be stripped.

              nozapeof
                     A final Control-Z should not be stripped.

              The default is zapeof except for NDATA entities, entities declared in storage objects with zapeof=nozapeof and storage objects  with
              records=asis.

              The attribute name and = can be omitted for this attribute.

       bctf   The  bctf (bit combination transformation format) attribute describes how the bit combinations of the storage object are transformed
              into the sequence of bytes that are contained in the object identified by the storage  object  identifier.   This  inverse  of  this
              transformation is performed when the entity manager reads the storage object.  It has one of the following values:

              identity
                     Each bit combination is represented by a single byte.

              fixed-2
                     Each bit combination is represented by exactly 2 bytes, with the more significant byte first.

              utf-8  Each bit combination is represented by a variable number of bytes according to UCS Transformation Format 8 defined in Annex P
                     to be added by the first proposed drafted amendment (PDAM 1) to ISO/IEC
                      10646-1:1993.

              euc-jp Each bit combination is treated  as  a  pair  of  bytes,  most  significant  byte  first,  encoding  a  character  using  the
                     Extended_UNIX_Code_Fixed_Width_for_Japanese  Internet charset, and is transformed into the variable length sequence of octets
                     that would encode that character using the Extended_UNIX_Code_Packed_Format_for_Japanese Internet charset.

              sjis   Each bit combination is treated  as  a  pair  of  bytes,  most  significant  byte  first,  encoding  a  character  using  the
                     Extended_UNIX_Code_Fixed_Width_for_Japanese  Internet  charset, and is transformed into the variable length sequence of bytes
                     that would encode that character using the Shift_JIS Internet charset.

              unicode
                     Each bit combination is represented by 2 bytes.  The bytes representing the entire storage object may be preceded by  a  pair
                     of  bytes representing the byte order mark character (0xFEFF).  The bytes representing each bit combination are in the system
                     byte order, unless the byte order mark character is present, in which case the order of its bytes determines the byte  order.
                     When the storage object is read, any byte order mark character is discarded.

              is8859-N
                     N  can  be  any single digit other than 0.  Each bit combination is interpreted as the number of a character in ISO/IEC 10646
                     and is represented by the single byte that would encode that character in ISO 8859-N.  These values are  not  supported  with
                     the -b option.

              Values other than identity are supported only with the multi-byte version of nsgmls.

       tracking
              This  specifies  whether  line boundaries should be tracked for this object: a value of track specifies that they should; a value of
              notrack specifies that they should not.  The default value is track.  Keeping track of where line  boundaries  occur  in  a  storage
              object requires approximately one byte of storage per line and it may be desirable to disable this for very large storage objects.

              The attribute name and = can be omitted for this attribute.

       base   When the storage object identifier specified in the content of the storage object specification is relative, this specifies the base
              storage object identifier relative to which that storage object identifier should be resolved.  When not specified a storage  object
              identifier  is interpreted relative to the storage object in which it is specified, provided that this has the same storage manager.
              This applies both to system identifiers specified in SGML documents and to system identifiers specified in the catalog entry files.

       smcrd  The value is a single character that will be recognized in storage object identifiers (both in the content of storage object  speci‐
              fications and in the value of base attributes) as a storage manager character reference delimiter when followed by a digit.  A stor‐
              age manager character reference is like an SGML numeric character reference except that the number is  interpreted  as  a  character
              number in the inherent character set of the storage manager rather than the document character set.  The default is for no character
              to be recognized as a storage manager character reference delimiter.  Numeric character references cannot be used to prevent  recog‐
              nition of storage manager character reference delimiters.

       fold   This  applies  only to the neutral storage manager.  It specifies whether the storage object identifier should be folded to the cus‐
              tomary case of the underlying storage manager if storage object identifiers for the underlying storage manager are  case  sensitive.
              The following values are allowed:

              fold   The storage object identifier will be folded.

              nofold The storage object identifier will not be folded.

              The default value is fold.  The attribute name and = can be omitted for this attribute.

              For  example,  on Unix filenames are case-sensitive and the customary case is lower-case.  So if the underlying storage manager were
              osfile and the system was a Unix system, then <neutral>FOO.SGM would be equivalent to <osfile>foo.sgm.

       A simple system identifier is interpreted as a storage object identifier with a storage manager that depends on where the system identifier
       was specified: if it was specified in a storage object whose storage manager was url or if the system identifier looks like an absolute URL
       in a supported scheme, the storage manager will be url; otherwise the storage manager will be osfile.  The storage manager  attributes  are
       defaulted as for a formal system identifier.  Numeric character references are not recognized in simple system identifiers.

   System identifier generation
       The  entity  manager  generates an effective system identifier for every external entity using catalog entry files in the format defined by
       SGML Open Technical Resolution 9401:1994.  The entity manager will give an error if it is unable to generate an effective system identifier
       for  an  external  entity.  Normally if the external identifier for an entity includes a system identifier then the entity manager will use
       that as the effective system identifier for the entity; this behaviour can be changed using OVERRIDE or SYSTEM entries in a  catalog  entry
       file.

       A catalog entry file contains a sequence of entries in one of the following forms:

       PUBLIC pubid sysid
              This  specifies  that  sysid should be used as the effective system identifier if the public identifier is pubid.  Sysid is a system
              identifier as defined in ISO 8879 and pubid is a public identifier as defined in ISO 8879.

       ENTITY name sysid
              This specifies that sysid should be used as the effective system identifier if the entity is a general entity whose name is name.

       ENTITY %name sysid
              This specifies that sysid should be used as the effective system identifier if the entity is a parameter entity whose name is  name.
              Note that there is no space between the % and the name.

       DOCTYPE name sysid
              This  specifies  that sysid should be used as the effective system identifier if the entity is an entity declared in a document type
              declaration whose document type name is name.

       LINKTYPE name sysid
              This specifies that sysid should be used as the effective system identifier if the entity is an entity declared in a link type  dec‐
              laration whose link type name is name.

       NOTATION name sysid
              This specifies that sysid should be used as the effective system identifier for a notation whose name is name.  This is an extension
              to the SGML Open format.  This is relevant only with the -n option.

       OVERRIDE YES|NO
              This sets the overriding mode for entries up to the next occurrence of OVERRIDE or the end of the catalog entry file.  At the begin‐
              ning of a catalog entry file the overriding mode will be NO.  A PUBLIC, ENTITY, DOCTYPE, LINKTYPE or NOTATION entry with an overrid‐
              ing mode of YES will be used whether or not the external identifier has an explicit system identifier; those with an overriding mode
              of NO will be ignored if external identifier has an explicit system identifier.  This is an extension to the SGML Open format.

       SYSTEM sysid1 sysid2
              This  specifies  that  sysid2  should  be used as the effective system identifier if the system identifier specified in the external
              identifier was sysid1.  This is an extension to the SGML Open format.

       SGMLDECL sysid
              This specifies that if the document does not contain an SGML declaration, the SGML declaration in sysid should be implied.

       DOCUMENT sysid
              This specifies that the document entity is sysid.  This entry is used only with the -C option.

       CATALOG sysid
              This specifies that sysid is the system identifier of an additional catalog entry file to be read after this one.  Multiple  CATALOG
              entries are allowed and will be read in order.  This is an extension to the SGML Open format.

       The  delimiters can be omitted from the sysid provided it does not contain any white space.  Comments are allowed between parameters delim‐
       ited by -- as in SGML.

       The environment variable SGML_CATALOG_FILES contains a list of catalog entry files.  The list is separated by  colons  under  Unix  and  by
       semi-colons  under  MSDOS.  These will be searched after any catalog entry files specified using the -m option, and after the catalog entry
       file called catalog in the same place as the document entity.  If this environment variable is not set, then a  system  dependent  list  of
       catalog  entry  files  will  be  used.   In fact catalog entry files are not restricted to being files: the name of a catalog entry file is
       interpreted as a system identifier.

       A match in one catalog entry file will take precedence over any match in a later catalog entry file.  A match in a catalog entry file for a
       SYSTEM  entry  will  take precedence over a match in the same file for a PUBLIC, ENTITY, DOCTYPE, LINKTYPE or NOTATION entry.  A match in a
       catalog entry file for a PUBLIC entry will take precedence over a match in the same file for  an  ENTITY,  DOCTYPE,  LINKTYPE  or  NOTATION
       entry.

   System declaration
       The system declaration for nsgmls is as follows:

                               SYSTEM "ISO 8879:1986"
                                       CHARSET
       BASESET  "ISO 646-1983//CHARSET
                 International Reference Version (IRV)//ESC 2/5 4/0"
       DESCSET  0 128 0
       CAPACITY PUBLIC  "ISO 8879:1986//CAPACITY Reference//EN"
                                      FEATURES
       MINIMIZE DATATAG NO        OMITTAG  YES     RANK     YES   SHORTTAG YES
       LINK     SIMPLE  YES 65535 IMPLICIT YES     EXPLICIT YES 1
       OTHER    CONCUR  NO        SUBDOC   YES 100 FORMAL   YES
       SCOPE    DOCUMENT
       SYNTAX   PUBLIC  "ISO 8879:1986//SYNTAX Reference//EN"
       SYNTAX   PUBLIC  "ISO 8879:1986//SYNTAX Core//EN"
                                      VALIDATE
                GENERAL YES       MODEL    YES     EXCLUDE  YES   CAPACITY NO
                NONSGML YES       SGML     YES     FORMAL   YES
                                        SDIF
                PACK    NO        UNPACK   NO

       The limit for the SUBDOC parameter is memory dependent.

       Any legal concrete syntax may be used.

    declaration
       If the  declaration is omitted and there is no applicable SGMLDECL entry in a catalog, the following declaration will be implied:

                           <!SGML "ISO 8879:1986"
                                   CHARSET
       BASESET  "ISO 646-1983//CHARSET
                 International Reference Version (IRV)//ESC 2/5 4/0"
       DESCSET    0  9 UNUSED
                  9  2  9
                 11  2 UNUSED
                 13  1 13
                 14 18 UNUSED
                 32 95 32
                127  1 UNUSED
       CAPACITY PUBLIC    "ISO 8879:1986//CAPACITY Reference//EN"
       SCOPE    DOCUMENT
       SYNTAX
       SHUNCHAR CONTROLS 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17
                18 19 20 21 22 23 24 25 26 27 28 29 30 31 127 255
       BASESET  "ISO 646-1983//CHARSET International Reference Version
                 (IRV)//ESC 2/5 4/0"
       DESCSET  0 128 0
       FUNCTION RE                    13
                RS                    10
                SPACE                 32
                TAB       SEPCHAR     9
       NAMING   LCNMSTRT  ""
                UCNMSTRT  ""
                LCNMCHAR  "-."
                UCNMCHAR  "-."
                NAMECASE  GENERAL     YES
                          ENTITY      NO
       DELIM    GENERAL   SGMLREF
                SHORTREF  SGMLREF
       NAMES    SGMLREF
       QUANTITY SGMLREF
                ATTCNT    99999999
                ATTSPLEN  99999999
                DTEMPLEN  24000
                ENTLVL    99999999
                GRPCNT    99999999
                GRPGTCNT  99999999
                GRPLVL    99999999
                LITLEN    24000
                NAMELEN   99999999
                PILEN     24000
                TAGLEN    99999999
                TAGLVL    99999999
                                  FEATURES
       MINIMIZE DATATAG   NO
                OMITTAG   YES
                RANK      YES
                SHORTTAG  YES
       LINK     SIMPLE    YES 1000
                IMPLICIT  YES
                EXPLICIT  YES 1
       OTHER    CONCUR    NO
                SUBDOC    YES 99999999
                FORMAL    YES
                                APPINFO NONE>
       with the exception that all characters that are neither significant not shunned will be assigned to DATACHAR.

       A  character in a base character set is described either by giving its number in a universal character set, or by specifying a minimum lit‐
       eral.  The constraints on the choice of universal character set are that characters that are significant in  the  SGML  reference  concrete
       syntax  must  be  in  the  universal character set and must have the same number in the universal character set as in ISO 646 and that each
       character in the character set must be represented by exactly one number; that character numbers in the range 0 to 31 and 127  to  159  are
       control  characters  (for the purpose of enforcing SHUNCHAR CONTROLS).  It is recommended that ISO 10646 (Unicode) be used as the universal
       character set, except in environments where the normal document character sets are large character set which cannot be compactly  described
       in  terms of ISO 10646.  The public identifier of a base character set can be associated with an entity that describes it by using a PUBLIC
       entry in the catalog entry file.  The entity must be a fragment of an SGML declaration  consisting  of  the  portion  of  a  character  set
       description,  following  the  DESCSET  keyword,  that is, it must be a sequence of character descriptions, where each character description
       specifies a described character number, the number of characters and either a character number in the universal character  set,  a  minimum
       literal or the keyword UNUSED.  Character numbers in the universal character set can be as big as 99999999.

       In addition nsgmls has built in knowledge of a few character sets.  These are identified using the designating sequence in the public iden‐
       tifier.  The following designating sequences are recognized:

       Designating       ISO         Minimum      Number
         Escape      Registration   Character       of             Description
        Sequence        Number       Number     Characters
       ──────────────────────────────────────────────────────────────────────────────
       ESC 2/5 4/0        -             0          128       full set of ISO 646 IRV
       ESC 2/8 4/0        2             0          128       G0 set of ISO 646 IRV
       ESC 2/8 4/2        6             0          128       G0 set of ASCII
       ESC 2/1 4/0        1             0           32       C0 set of ISO 646

       The graphic character sets do not strictly include C0 and C1 control character sets.  For convenience, nsgmls augments the graphic  charac‐
       ter sets with the appropriate control character sets.

       It  is  not  necessary  for every character set used in the SGML declaration to be known to nsgmls provided that characters in the document
       character set that are significant both in the reference concrete syntax and in the described concrete syntax  are  described  using  known
       base  character  sets and that characters that are significant in the described concrete syntax are described using the same base character
       sets or the same minimum literals in both the document character set description and the syntax reference character set description.

       The public identifier for a public concrete syntax can be associated with an entity that describes using a  PUBLIC  entry  in  the  catalog
       entry  file.   The  entity must be a fragment of an SGML declaration consisting of a concrete syntax description starting with the SHUNCHAR
       keyword as in an SGML declaration.  The entity can also make use of the following extensions:

              An added function can be expressed as a parameter literal instead of a name.

              The replacement for a reference reserved name can be expressed as a parameter literal instead of a name.

              The LCNMSTRT, UCNMSTRT, LCNMCHAR and UCNMCHAR keywords may each be followed by more than  one  parameter  literal.   A  sequence  of
              parameter  literals  has the same meaning as a single parameter literal whose content is the concatenation of the content of each of
              the literals in the sequence.  This extension is useful because of the restriction on the length of a parameter literal in the  SGML
              declaration to 240 characters.

              The  total  number of characters specified for UCNMCHAR or UCNMSTRT may exceed the total number of characters specified for LCNMCHAR
              or LCNMSTRT respectively.  Each character in UCNMCHAR or UCNMSTRT which does not have a corresponding character in the same position
              in LCNMCHAR or LCNMSTRT is simply assigned to UCNMCHAR or UCNMSTRT without making it the upper-case form of any character.

              A  parameter  following any of LCNMSTRT, UCNMSTRT, LCNMCHAR and UCNMCHAR keywords may be followed by the name token ...  and another
              parameter literal.  This has the same meaning as the two parameter literals with a parameter literal in between containing in  order
              each character whose number is greater than the number of the last character in the first parameter literal and less than the number
              of the first character in the second parameter literal.  A parameter literal must contain at least one character for  each  ...   to
              which it is adjacent.

              A  number may be used as a parameter following the LCNMSTRT, UCNMSTRT, LCNMCHAR and UCNMCHAR keywords or as a delimiter in the DELIM
              section with the same meaning as a parameter literal containing just a numeric character reference with that number.

              The parameters following the LCNMSTRT, UCNMSTRT, LCNMCHAR and UCNMCHAR keywords may be omitted.  This has the same meaning as speci‐
              fying an empty parameter literal.

              Within  the specification of the short reference delimiters, a parameter literal containing exactly one character may be followed by
              the name token ...  and another parameter literal containing exactly one character.  This has the same  meaning  as  a  sequence  of
              parameter literals one for each character number that is greater than or equal to the number of the character in the first parameter
              literal and less than or equal to the number of the character in the second parameter literal.

       The public identifier for a public capacity set can be associated with an entity that describes using a PUBLIC entry in the  catalog  entry
       file.  The entity must be a fragment of an SGML declaration consisting of a sequence of capacity names and numbers.

   Output format
       The  output is a series of lines.  Lines can be arbitrarily long.  Each line consists of an initial command character and one or more argu‐
       ments.  Arguments are separated by a single space, but when a command takes a fixed number of arguments the last argument can contain  spa‐
       ces.  There is no space between the command character and the first argument.  Arguments can contain the following escape sequences.

       \\     A \.

       \n     A record end character.

       \|     Internal SDATA entities are bracketed by these.

       \nnn   The character whose code is nnn octal.

       A record start character will be represented by \012.  Most applications will need to ignore \012 and translate \n into newline.

       \#n;   The  character  whose  number  is  n  in decimal.  n can have any number of digits.  This is used for characters that are not repre‐
              sentable by the encoding translation used for output (as specified by the NSGML_CODE environment variable).  This  will  only  occur
              with the multibyte version of nsgmls.

       The possible command characters and arguments are as follows:

       (gi    The start of an element whose generic identifier is gi.  Any attributes for this element will have been specified with A commands.

       )gi    The end of an element whose generic identifier is gi.

       -data  Data.

       &name  A reference to an external data entity name; name will have been defined using an E command.

       ?pi    A processing instruction with data pi.

       Aname val
              The next element to start has an attribute name with value val which takes one of the following forms:

              IMPLIED
                     The value of the attribute is implied.

              CDATA data
                     The attribute is character data.  This is used for attributes whose declared value is CDATA.

              NOTATION nname
                     The attribute is a notation name; nname will have been defined using a N command.  This is used for attributes whose declared
                     value is NOTATION.

              ENTITY name...
                     The attribute is a list of general entity names.  Each entity name will have been defined using an I, E or S  command.   This
                     is used for attributes whose declared value is ENTITY or ENTITIES.

              TOKEN token...
                     The attribute is a list of tokens.  This is used for attributes whose declared value is anything else.

              ID token
                     The attribute is an ID value.  This will be output only if the -oid option is specified.  Otherwise TOKEN will be used for ID
                     values.

       Dename name val
              This is the same as the A command, except that it specifies a data attribute for an external entity named  ename.   Any  D  commands
              will come after the E command that defines the entity to which they apply, but before any & or A commands that reference the entity.

       atype name val
              The  next element to start has a link attribute with link type type, name name, and value val, which takes the same form as with the
              A command.

       Nnname nname.  Define a notation.  This command will be preceded by a p command if the notation was declared with a public identifier,  and
              by  a  s  command  if the notation was declared with a system identifier.  If the -n option was specified, this command will also be
              preceded by an f command giving the system identifier generated by the entity manager (unless it was unable  to  generate  one).   A
              notation will only be defined if it is to be referenced in an E command or in an A command for an attribute with a declared value of
              NOTATION.

       Eename typ nname
              Define an external data entity named ename with type typ (CDATA, NDATA or SDATA) and notation not.  This command will be preceded by
              an  f command giving the system identifier generated by the entity manager (unless it was unable to generate one), by a p command if
              a public identifier was declared for the entity, and by a s command if a system identifier was declared for the  entity.   not  will
              have  been  defined using a N command.  Data attributes may be specified for the entity using D commands.  If the -oentity option is
              not specified, an external data entity will only be defined if it is to be referenced in a & command or  in  an  A  command  for  an
              attribute whose declared value is ENTITY or ENTITIES.

       Iename typ text
              Define  an  internal data entity named ename with type typ and entity text text.  The typ will be CDATA or SDATA unless the -oentity
              option was specified, in which case it can also be PI or TEXT (for an  text entity).  If the -oentity option is  not  specified,  an
              internal  data  entity  will  only be defined if it is referenced in an A command for an attribute whose declared value is ENTITY or
              ENTITIES.

       Sename Define a subdocument entity named ename.  This command will be preceded by an f command giving the system  identifier  generated  by
              the entity manager (unless it was unable to generate one), by a p command if a public identifier was declared for the entity, and by
              a s command if a system identifier was declared for the entity.  If the -oentity option is not specified, a subdocument entity  will
              only be defined if it is referenced in a { command or in an A command for an attribute whose declared value is ENTITY or ENTITIES.

       Tename Define  an external SGML text entity named ename.  This command will be preceded by an f command giving the system identifier gener‐
              ated by the entity manager (unless it was unable to generate one), by a p command if  a  public  identifier  was  declared  for  the
              entity,  and  by  a  s command if a system identifier was declared for the entity.  This command will be output only if the -oentity
              option is specified.

       ssysid This command applies to the next E, S, T or N command and specifies the associated system identifier.

       ppubid This command applies to the next E, S, T or N command and specifies the associated public identifier.

       fsysid This command applies to the next E, S, T or, if the -n option was specified, N command and specifies the system identifier generated
              by the entity manager from the specified external identifier and other information about the entity or notation.

       {ename The start of the  subdocument entity ename; ename will have been defined using a S command.

       }ename The end of the  subdocument entity ename.

       Llineno file
       Llineno
              Set the current line number and filename.  The file argument will be omitted if only the line number has changed.  This will be out‐
              put only if the -l option has been given.

       #text  An APPINFO parameter of text was specified in the  declaration.  This is not strictly part of the ESIS, but  a  structure-controlled
              application  is  permitted to act on it.  No # command will be output if APPINFO NONE was specified.  A # command will occur at most
              once, and may be preceded only by a single L command.

       C      This command indicates that the document was a conforming  document.  If this command is output, it will be the  last  command.   An
              document is not conforming if it references a subdocument entity that is not conforming.

ENVIRONMENT
       SP_BCTF
              If this is set to one of identity, utf-8, euc-jp and sjis, then that BCTF will be used as the default BCTF for everything (including
              file input, file output, message output, filenames and command line arguments).

SEE ALSO
       The  Handbook, Charles F. Goldfarb
       ISO 8879 (Standard Generalized Markup Language), International Organization for Standardization

       More complete HTML documentation can be found in: /usr/share/doc/sp/index.htm

BUGS
       Only with -t is all ESIS information for LINK is reported.

AUTHOR
       James Clark (jjc@jclark.com).

                                                                                                                                         NSGMLS(1)
