OPENJADE(1)                                                                                                                                                                                       OPENJADE(1)



NAME
       openjade - apply a DSSSL stylesheet to an SGML or XML document

SYNOPSIS
       openjade [-vCegG2s] [-b encoding] [-f error_file]
                [-c catalog_sysid] [-D dir] [-a link_type]
                [-A arch] [-E max_errors] [-i entity]
                [-w warning_type] [-d dsssl_spec] [-V variable=value]
                [-t output_type] [-o output_file] [sysid...]



DESCRIPTION
       openjade is an implementation of the ISO/IEC 10179:1996 standard DSSSL language. The DSSSL engine receives as input an SGML or XML document and transforms it into formats like:


       * XML representation of the flow object tree.


       * RTF format that can be rendered and printed with Microsoft's free Word Viewer 97


       * TeX format


       * MIF format that can be rendered and printed with Framemaker


       * SGML or XML format. This is used in conjunction with non-standard flow object classes to generate SGML, thus allowing openjade to be used for SGML/XML transformations.


       The system identifier of the document to be processed is specified as an argument to openjade. If this is omitted, standard input will be read.


       openjade determines the system identifier for the DSSSL specification as follows:


       1. If the -d option is specified, it will use the argument as the system identifier.


       2. Otherwise, it will look for processing instructions in the prolog of the document. Two kinds of processing instruction are recognized:


       <?stylesheet href="sysid" type="text/dsssl">


       The  system  data  of the processing instruction is parsed like an SGML start-tag. It will be parsed using the reference concrete syntax whatever the actual concrete syntax of the document. The name
       that starts the processing instruction can be either stylesheet, xml-stylesheet or xml:stylesheet. The processing instruction will be ignored unless the  value  of  the  type  attribute  is  one  of
       text/dsssl, text/x-dsssl, application/dsssl, or application/x-dsssl. The value of href attribute is the system identifier of the DSSSL specification.


       <?dsssl sysid>


       The system identifier is the portion of the system data of the processing instruction following the initial name and any whitespace.


       Although  the processing instruction is only recognized in the prolog, it need not occur in the document entity. For example, it could occur in a DTD. The system identifier will be interpreted rela‐
       tive to where the the processing instruction occurs.


       3. Otherwise, it will use the system identifier of the document with any extension changed to .dsl.


       A DSSSL specification document can contain more than one style-specification. If the system identifier of the DSSSL specification is followed by #id, then openjade will use  the  style-specification
       whose unique identifier is id. This is allowed both with the -d option and with the processing instructions.


       The DSSSL specification must be an SGML document conforming to the DSSSL architecture. For an example, see dsssl/demo.dsl.


       openjade supports the following options in addition to the normal OpenSP (see onsgmls(1)) options (note that all options are case-sensitive, ie -g and -G are different options):


       -d dsssl_spec
              This specifies that dsssl_spec is the system identifier of the DSSSL specification to be used.


       -G     Debug mode. When an error occurs in the evaluation of an expression, openjade will display a stack trace. Note that this disables tail-call optimization.


       -c filename
              The filename arguments specify catalog files rather than the document entity. The document entity is specified by the first DOCUMENT entry in the catalog files.


       -s     Strict  compliance  mode.  Currently  the  only effect is that jade doesn't use any predefined character names, sdata-entity mappings or name-characters. This is useful for checking that your
              stylesheet is portable to other DSSSL implementations and that it is strictly compliant to the DSSSL specifications.


       -t output_type
              output_type specifies the type of output as follows:

              fot  An XML representation of the flow object tree

              rtf rtf-95  RTF (used for SGML/XML to RTF transformations) Microsoft's Rich Text Format. rtf-95 produces output optimized for Word 95 rather than Word 97.

              tex TeX (used for SGML/XML to TeX transformations)

              sgml sgml-raw SGML (used for SGML/XML to SGML transformations). sgml-raw doesn't emit linebreaks in tags.

              xml xml-raw XML (used for SGML/XML to XML transformations). xml-raw doesn't emit linebreaks in tags.

              html  HTML (used for SGML/XML to HTML transformations)

              mif MIF (used for SGML/XML to MIF transformations)


       -o output_file
              Write output to output_file instead of the default. The default filename is the name of the last input file with its extension replaced by the name of the type of output. If there is no input
              filename, then the extension is added onto jade-out.


       -V variable
              This is equivalent to doing (define variable #t) except that this definition will take priority over any definition of variable in a style-sheet.


       -V variable=value
              This is equivalent to doing (define variable "value") except that this definition will take priority over any definition of variable in a style-sheet.


       -V (define variable value)
              This  is  equivalent  to doing (define variable value) except that this definition will take priority over any definition of variable in a style-sheet. Note that you will probably have to use
              some escaping mechanism for the spaces to get the entire scheme expression parsed as one cmdline argument.


       -wtype Control warnings and errors. Multiple -w options are allowed. The following values of type enable warnings:

              xml Warn about constructs that are not allowed by XML.

              mixed Warn about mixed content models that do not allow #pcdata anywhere.

              sgmldecl Warn about various dubious constructions in the SGML declaration.

              should Warn about various recommendations made in ISO 8879 that the document does not comply with. (Recommendations are expressed with ``should'', as distinct from requirements which are usu‐
              ally expressed with ``shall''.)

              default Warn about defaulted references.

              duplicate Warn about duplicate entity declarations.

              undefined Warn about undefined elements: elements used in the DTD but not defined.

              unclosed Warn about unclosed start and end-tags.

              empty Warn about empty start and end-tags.

              net Warn about net-enabling start-tags and null end-tags.

              min-tag Warn about minimized start and end-tags. Equivalent to combination of unclosed, empty and net warnings.

              unused-map Warn about unused short reference maps: maps that are declared with a short reference mapping declaration but never used in a short reference use declaration in the DTD.

              unused-param Warn about parameter entities that are defined but not used in a DTD. Unused internal parameter entities whose text is INCLUDE or IGNORE won't get the warning.

              notation-sysid Warn about notations for which no system identifier could be generated.

              all  Warn  about  conditions  that  should  usually  be avoided (in the opinion of the author). Equivalent to: mixed, should, default, undefined, sgmldecl, unused-map, unused-param, empty and
              unclosed.

              A warning can be disabled by using its name prefixed with no-. Thus -wall -wno-duplicate will enable all warnings except those about duplicate entity declarations.

              The following values for warning_type disable errors:

              no-idref Do not give an error for an ID reference value which no element has as its ID. The effect will be as if each attribute declared as an ID reference value had been declared as a name.

              no-significant Do not give an error when a character that is not a significant character in the reference concrete syntax occurs in a literal in the SGML declaration. This may  be  useful  in
              conjunction with certain buggy test suites.

              no-valid  Do  not  require  the document to be type-valid. This has the effect of changing the SGML declaration to specify VALIDITY NOASSERT and IMPLYDEF ATTLIST YES ELEMENT YES. An option of
              -wvalid has the effect of changing the SGML declaration to specify VALIDITY TYPE and IMPLYDEF ATTLIST NO ELEMENT NO. If neither -wvalid nor -wno-valid are specified,  then  the  VALIDITY  and
              IMPLYDEF specified in the SGML declaration will be used.


ENVIRONMENT
       OpenJade ignores the SP_CHARSET_FIXED and SP_SYSTEM_CHARSET environment variables and always uses Unicode as its internal character set, as if SP_CHARSET_FIXED was 1 and SP_SYSTEM_CHARSET was unset.
       Thus only the SP_ENCODING environment variable is relevant to OpenJade's handling of character sets.


OPENJADE EXTENSIONS
       The following external procedures are available. These external procedures are defined by a prototype in the same manner as in the standard. To use one of these external procedures,  you  must  make
       use of the standard external-procedure procedure, using a public identifier of "UNREGISTERED::James Clark//Procedure::name" where name is the name given here, typically by including the following in
       the DSSSL specification:


       (define name (external-procedure "UNREGISTERED::James Clark//Procedure::name"))


       Note that external-procedure returns #f if it doesn't know about the specified public identifier. You can use this to enable your DSSSL specifications to work gracefully with  other  implementations
       which do not support these extensions.


       For external procedures added by the OpenJade team, use a public identifier of the form "UNREGISTERED::OpenJade//Procedure::name".


       An  easy  way  to get access to all external procedures is to use the style specification dsssl/extensions.dsl#procedures. The file dsssl/extensions.dsl also contains style specifications which make
       the nonstandard flow object classes and inherited characteristics supported by the backends available in a convenient way.


       Debugging


       (debug obj)


       Generates a message including the value of obj and then returns obj.


       Simple-page-sequence header/footer control


       (if-first-page sosofo1 sosofo2)


       This can be used only in the specification of the value of one of the header/footer characteristics of simple-page-sequence. It returns a sosofo that will display as sosofo1 if the page is the first
       page of the simple-page-sequence and as sosofo2 otherwise.


       (if-front-page sosofo1 sosofo2)


       This  can  be used only in the specification of the value of one of the header/footer characteristics of simple-page-sequence. It returns a sosofo that will display as sosofo1 if the page is a front
       (ie recto, odd-numbered) page and as sosofo2 if it is a back (ie verso, even-numbered) page.


       Numbering


       (all-element-number)


       (all-element-number osnl)


       This is the same as element-number except it counts elements with any generic identifier. If osnl is not an element returns #f, otherwise returns 1 plus the number of elements  that  started  before
       osnl. This provides an efficient way of creating a unique identifier for any element in a document.


       External entity access


       (read-entity string)


       This  returns  a  string  containing  the  contents of the external entity with system identifier string. This should be used only for textual entities (CDATA and SDATA), and not for binary entities
       (NDATA).


       POSIX locale access


       (language lang country)


       This procedure returns an object of type language, if the system supports the specified language. lang is a string or symbol giving the two letter language code. country is a string or symbol giving
       the two letter country code.


       This procedure uses POSIX locales. It is an OpenJade addition. It is not supported on all operating systems.


       Extended standard procedures


       (sgml-parse sysid #!key active: parent: architecture:)


       This allows you to specify an SGML architecture with respect to which the document should be parsed. It is an OpenJade addition.


       (expt q k)


       This allows you to raise a quantity to an integral power. It is an OpenJade addition.


LIMITATIONS
       This section describes the limitations of the front-end (the general-purpose DSSSL engine); each backend also has its own limitations.


       openjade doesn't allow internal definitions at the beginning of bodies and the (test => recipient) variant of cond clauses.


       openjade supports only a single, fixed grove plan which comprises the following modules:


       * baseabs


       * prlgabs0


       * prlgabs1


       * instabs


       * basesds0


       * instsds0


       * subdcabs


       It doesn't implement the following parts of SDQL: HyTime support, auxiliary parsing, node regular expressions.


       Query rules, sosofo synchronization, indirect sosofos, reference values, decoration areas and font properties are not supported.


       Note that only inherited characteristics that are applicable to some supported flow object can be specified.


       Character/glyph handling


       It only supports a single pre-defined character repertoire. A character name of the form U-XXXX where XXXX are four upper-case hexadecimal digits, is recognized as referring to the Unicode character
       with that code. For many characters, it is also possible to use the ISO/IEC 10646 name in lower-case with words separated by hyphens.


       Some common SDATA entity names from the ISO entity sets are recognized and mapped to characters. In addition an SDATA entity name of the form U-XXXX, where XXXX are four upper-case hexadecimal  dig‐
       its, is mapped to the Unicode character with that code.


       OpenJade  now  supports the standard-chars, map-sdata-entity, add-name-chars, add-separator-chars and char-repertoire declaration element forms, allowing a style-sheet to define additional character
       names, sdata entity mappings, name characters (i.e. characters allowed in identifiers) and separator characters. Currently the only recognized character repertoire is the built-in repertoire. It has
       the public identifier "UNREGISTERED::OpenJade//Character Repertoire::OpenJade".


       Validation


       Several things that it would be desirable to have checked aren't checked:


       *  When  the allowed value of an inherited characteristic is a symbol, OpenJade checks only that the value is a symbol that is allowed as the value of some characteristic; #t and #f are treated as a
       special kind of symbol in this case.


       * OpenJade doesn't check whether a flow object is occurring in a context where it is allowed.


       * OpenJade does not prevent flow objects being attached to the principal port of a flow object when the flow object shouldn't have a principal port.


       * Most type-checking is done at run-time not compile-time.


       * OpenJade does not check for non-inherited characteristics that are required to be specified.


       * It doesn't check that optional features that have been used were declared in the features form.


       Other limitations


       The following primitives are just stubs:


       char-script-case Always returns last argument.


       address-visited? Always returns #f.


EXAMPLES
       Given an SGML file file.sgml, use the stylesheet file.dsl and publish as an rtf file.


       openjade -t rtf file.sgml


       Using a different stylesheet:


       openjade -t rtf -d docbook.dsl file.sgml


       Using the print style specification contained within the stylesheet


       openjade -t rtf -d docbook.dsl#print file.sgml


       And use the html specification within the style sheet to convert to html


       openjade -t sgml -i html -d docbook.dsl#html file.sgml


SEE ALSO
       onsgmls(1)


AUTHORS
       James Clark, Ian Castle <ian.castle@looksystems.co.uk>.



OpenJade                                                                                         January 2002                                                                                     OPENJADE(1)
