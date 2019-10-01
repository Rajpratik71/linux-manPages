rapper(1)                                                                                  General Commands Manual                                                                                  rapper(1)



NAME
       rapper - Raptor RDF parsing and serializing utility

SYNOPSIS
       rapper [OPTIONS] INPUT-URI [INPUT-BASE-URI]

EXAMPLE
       rapper -o ntriples http://planetrdf.com/guide/rss.rdf
       rapper -i rss-tag-soup -o rss-1.0 pile-of-rss.xml http://example.org/base/
       rapper --count http://example.org/index.rdf

DESCRIPTION
       The  rapper  utility  allows  parsing of RDF content by the Raptor RDF parser toolkit emitting the results as RDF triples in a choice of syntaxes.  The INPUT-URI can be a file name, '-' for standard
       input or if Raptor is built with a WWW retrieval library, a general URI.  The optional INPUT-BASE-URI is used as the document parser base URI if present otherwise defaults to the INPUT-URI.  A value
       of '-' means no base URI.

OPTIONS
       rapper uses the usual GNU command line syntax, with long options starting with two dashes (`-') if supported by the getopt_long function.  Otherwise the short options are only available.

       -h, --help
              Show a summary of the options.

       -i, --input FORMAT
              Set the input FORMAT to one of 'rdfxml' (RDF/XML, default), 'ntriples' (N-Triples, see below), 'turtle' (Turtle, see below) or 'rss-tag-soup' (RSS Tag Soup).  The RSS Tag Soup parser can turn
              the many XML RSS formats and Atom 0.3 into RDF triples.

              The list of parsers depends on how libraptor(3) was built.  The list of supported parsers is given in the help summary given by -h.

       -I, --input-uri URI
              Set the input/parser base URI or use value '-' for no base.  The default is the INPUT-URI argument value.

       -o, --output FORMAT
              Set the output FORMAT to 'ntriples' (N-Triples, default), 'rdfxml' (RDF/XML), 'rdfxml-abbrev' (RDF/XML with abbreviations) or 'rss-1.0' (RSS 1.0, also an RDF/XML syntax).

              The list of serializers depends on how libraptor(3) was built.  The list of supported serializers is given in the help summary given by -h.

       -O, --output-uri URI
              Set the output/serializer base URI or use value '-' for no base.  The default is the input base uri, either set by the argument INPUT-BASE-URI or via options -I, --input-uri URI

       -c, --count
              Only count the triples and produce no other output.

       -e, --ignore-errors
              Ignore errors, do not emit the messages and try to continue parsing.

       -f, --feature FEATURE[=VALUE]
              Set a parser or serializer feature FEATURE to a value, or to 1 if VALUE is omitted, Use -f help to get lists of valid parser and serializer features.

              If the form -f 'xmlns:prefix="uri"' is used, the prefix and namespace uri given will be set for serializing.  The syntax matches XML in that either or both of prefix or uri can be omitted.

       -g, --guess
              Guess the parser to use from the source-URI rather than use the -i FORMAT.

       -q, --quiet
              No extra information messages.

       -r, --replace-newlines
              Replace newlines in multi-line literals with spaces.

       --show-graphs
              Print graph names (URIs) as they are seen in the input.  This only has a meaning for parsers that support graph names such as the TRiG parser.

       --show-namespaces
              Print namespaces as they are seen in the input.

       -t, --trace
              Print URIs retrieved during parsing.  Especially useful for monitoring what the guess and GRDDL parsers are doing.

       -w, --ignore-warnings
              Ignore warnings, do not emit the messages.

       -v, --version
              Print the raptor version and exit.

EXAMPLES
       rapper -q -i ntriples -o rdfxml -f 'xmlns:rss="http://purl.org/rss/1.0/"' -f 'xmlns:ex="http://example.org/"' tests/test.nt
       rapper -q -o rdfxml -f 'xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"' tests/rdf-schema.rdf 'http://www.w3.org/2000/01/rdf-schema#'

CONFORMING TO
       RDF/XML Syntax (Revised), W3C Recommendation, http://www.w3.org/TR/rdf-syntax-grammar/ ⟨http://www.w3.org/TR/rdf-syntax-grammar/⟩

       N-Triples, in RDF Test Cases, Jan Grant and Dave Beckett (eds.), W3C Recommendation, http://www.w3.org/TR/rdf-testcases/#ntriples ⟨http://www.w3.org/TR/rdf-testcases/#ntriples⟩

       Turtle Terse RDF Triple Language, Dave Beckett, http://www.dajobe.org/2004/01/turtle/ ⟨http://www.dajobe.org/2004/01/turtle/⟩

       RDFA in XHTML: Syntax and Processing, Ben Adida, Mark  Birbeck,  Shane  McCarron  and  Steven  Pemberton  (eds.),  W3C  Candidate  Recommendation,  20  June  2008  http://www.w3.org/TR/2008/CR-rdfa-
       syntax-20080620/ ⟨http://www.w3.org/TR/2008/CR-rdfa-syntax-20080620/⟩

       RDF Site Summary (RSS) 1.0, 2000-12-06 http://purl.org/rss/1.0/spec ⟨http://purl.org/rss/1.0/spec⟩

SEE ALSO
       libraptor(3),raptor-config(1)

CHANGES
   2.0.0
       Removed -a option that did nothing.

       Removed -m option from rapper but it was never documented here.

       Removed -n option that was long hidden.

       Removed -s option that was equivalent to -f scanForRDF

   1.4.16
       Added -I/--input-uri and -O/--output-uri to set the input and output (parser and serializer) base URIs separately.

   1.4.15
       Added -t/--trace to do URI traces.

   1.4.5
       Updated to add serializer rdfxml-abbrev

   1.4.3
       Updated potential parser and serializers and described -f for defining namespaces.

   1.3.0
       Added -f for features.
       Added -g for guessing the parser to use.

   1.1.0
       Removed -a, --assume since rdf:RDF is now always optional.

AUTHOR
       Dave Beckett - http://www.dajobe.org/ ⟨http://www.dajobe.org/⟩



                                                                                                  2010-04-28                                                                                        rapper(1)
