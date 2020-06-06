rdfproc(1)                                                                                 General Commands Manual                                                                                 rdfproc(1)



NAME
       rdfproc - Redland RDF processor utility

SYNOPSIS
       rdfproc [options] store-name command arg...

EXAMPLE
       rdfproc test parse http://planetrdf.com/guide/rss.rdf
       rdfproc test print
       rdfproc test serialize ntriples

DESCRIPTION
       The rdfproc utility allows parsing, querying, manipulating and  serializing of RDF content using the Redland RDF library.   The store-name is a Redland store name, typically a short identifier.  The
       arguments to command vary and are explained in section COMMANDS below.

OPTIONS
       rdfproc uses the usual GNU command line syntax, with long options starting with two dashes (`-') if supported by the getopt_long function.  Otherwise the short options are only available.

       -h, --help
              Show a summary of the options.

       -c, --contexts
              Use a store with Redland contexts.

       -n, --new
              Make a new store, overwriting any existing one.

       -o, --output FORMAT
              Set the output FORMAT for sequences of triples, such as from a search (find command) to a Redland serializer.  Use -h or -o help to see the full list of supported formats.

       -p, --password
              Read the storage option 'password' from standard input.  Terminated by end of line ('\n') or end of file.  This is equivalent to setting it using -t or --storage-options but does not  require
              exposing the password in the argument list.

       -q, --quiet
              Suppress informational messages (that go to stderr)

       -r, --results FORMAT
              Set the query results syntax format.  Use -h or -r help to see the full list of query result formats.

              The exact list of formats depends on what libraptor(3) was built with but is given correct in the usage message with -h.

       -s, --storage TYPE
              Set the Redland storage type (default 'hashes').  If environment variable RDFPROC_STORAGE_TYPE is set, the storage type given here will override it.  Use -h or -s help to see the full list of
              query result formats.

       -t, --storage-options OPTIONS
              Set options for the the Redland storage, default is "hash-type='bdb',dir='.'"  to match the default storage "hashes".  For storages types such as 'mysql' that need extra  options  this  would
              typically  be  something  like  "host='hostname',database='dbname',user='abc',password='pass'".  If environment variable RDFPROC_STORAGE_OPTIONS is set, the storage options given here will be
              applied afterwards.

       -v, --version
              Print the Redland version and exit.

       -V, --verbose
              Show informational messages on stderr.

COMMANDS
       Where a node is allowed, such as NODE, SUBJECT, PREDICATE or OBJECT below, simple heuristics are used to guess which are blank node identifiers, URIs or literals (to add a statement with a  literal,
       use add-typed).  If the item starts with _: then it is assumed to be a blank node identifier, otherwise if it matches something:// it is assumed to be a URI, otherwise it is a literal.  Literals are
       only allowed as objects of statements and blank nodes are not allowed as predicates.

       add SUBJECT PREDICATE OBJECT [CONTEXT]
              Add the given triple to graph, in the optional Redland context if the CONTEXT node is given.


       add-typed SUBJECT PREDICATE OBJECT OBJECT-LANG OBJECT-URI [CONTEXT]
              Add the triple with the datatyped literal object to the graph, in the optional Redland context if CONTEXT is given.


       arc SUBJECT OBJECT

       arcs SUBJECT OBJECT
              Show one node/all nodes that match triples (SUBJECT, ?, OBJECT)


       arcs-in NODE
              Show all properties of triples with NODE as a subject.


       arcs-out NODE
              Show all properties of triples with NODE as an object.


       contains SUBJECT PREDICATE OBJECT
              Check if the given triple is in the graph.


       contexts
              List all the contexts in the graph (if contexts are enabled).


       find SUBJECT|- PREDICATE|- OBJECT|- [CONTEXT]
              Find matching triples to the given statement where - stands for a blank that matches any node.  If CONTEXT is given, only search for triples in that context node.


       has-arc-in NODE ARC
              Check that there is a triple with NODE as a subject and ARC as a predicate.


       has-arc-out NODE ARC
              Check that there is a triple with NODE as a object and ARC as a predicate.


       parse URI|FILENAME [SYNTAX| [BASE URI]]
              Parse syntax at URI into the graph using SYNTAX which can be one of rdfxml (RDF/XML, default), ntriples, turtle, rss-tag-soup (for all RSS and Atoms), grddl and guess to use content hints and
              protocol information to work it out. (This list changes faster than this manual page) If FILENAME is a existing file, the appropriate URI will be generated for it.  If parsing returns errors,
              the return code will be non-0.


       parse-stream URI|FILENAME [SYNTAX [BASE URI [CONTEXT]]
              Streaming parse syntax at URI into the graph using SYNTAX which can be one of rdfxml (RDF/XML, default) or ntriples.  If FILENAME is an existing file, the appropriate URI  will  be  generated
              for it.  If the optional CONTEXT URI is given, the triples are added to that context.  If parsing returns errors, the return code will be non-0.


       print  Print the graph triples in a simple format showing context nodes if present.


       query NAME|- URI|- QUERY-STRING
              Run QUERY-STRING query in language NAME returning variable bindings, a boolean or RDF graph depending on the query.  Query language can be 'sparql' or 'rdql'.


       remove SUBJECT PREDICATE OBJECT [CONTEXT]
              Remove the given triple graph, in the optional Redland context if CONTEXT is given.


       remove-context CONTEXT
              Remove all triples in the graph with the Redland context CONTEXT.


       serialize [SYNTAX [URI [MIME-TYPE]]]
              Serializes  the graph to a syntax with a particular ISYNTAX URI or Internet Media Type/MIME Type.  The default is RDF/XML (NAME "rdfxml", MIME Type "application/rdf/xml") if none of the above
              are given.  Other alternatives are "ntriples" (no MIME Type).


       source PREDICATE OBJECT

       sources PREDICATE OBJECT
              Show one node/all nodes that match triples (?, PREDICATE, OBJECT)


       target SUBJECT PREDICATE

       targets SUBJECT PREDICATE
              Show one node/all nodes that match triples (SUBJECT, PREDICATE, ?)


ENVIRONMENT
       RDFPROC_STORAGE_OPTIONS can be set to provide storage options instead of using the option -t, --storage-options OPTIONS.  When both are given, command options are applied last.

       RDFPROC_STORAGE_TYPE can be set to provide a storage type instead of using the option -s, --storage TYPE.  When both are given, the storage type from the command is used.

CONFORMING TO
       RDF/XML Syntax (Revised), W3C Recommendation, http://www.w3.org/TR/rdf-syntax-grammar/ ⟨http://www.w3.org/TR/rdf-syntax-grammar/⟩

       N-Triples, in RDF Test Cases, Jan Grant and Dave Beckett (eds.)  W3C Recommendation, http://www.w3.org/TR/rdf-testcases/#ntriples ⟨http://www.w3.org/TR/rdf-testcases/#ntriples⟩

SEE ALSO
       redland(3), libraptor(3), rapper(1)

AUTHOR
       Dave Beckett - http://www.dajobe.org/ ⟨http://www.dajobe.org/⟩



                                                                                                  2010-08-29                                                                                       rdfproc(1)
