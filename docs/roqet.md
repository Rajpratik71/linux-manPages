roqet(1)                                                                                   General Commands Manual                                                                                   roqet(1)



NAME
       roqet - Rasqal RDF query utility

SYNOPSIS
       roqet [OPTIONS] <query-URI> [base-URI]
       roqet [OPTIONS]-e query-string [base-URI]
       roqet [OPTIONS]-p sparql-protocol-service-URI [-e query-string ] [base-URI]

DESCRIPTION
       The roqet utility allows querying of RDF content using the Rasqal RDF query library, printing the results in variable bindings, RDF graph or boolean format.  The query is read from query-URI and the
       optional base-URI is used as the base URI of the query if present.

MAIN OPTIONS
       roqet uses the usual GNU command line syntax, with long options starting with two dashes (`-') if supported by the getopt_long function.  Otherwise only the short options are available.

       -e, --exec QUERY
              Execute the query in the argument QUERY instead of reading the query from a URI (when -e / --exec is not given).

       -i, --input LANGUAGE
              Set the input query LANGUAGE to one of the supported languages which includes 'sparql' (SPARQL Query Language for RDF, default), 'sparql11' and 'laqrs'.  The full list of supported  languages
              and subsets is given in the help summary with the -h / --help option.

       -p, --protocol SERVICE-URI
              Call the SPARQL HTTP protocol SERVICE-URI to execute the query instead of executing it inside the Rasqal query engine locally.

       -r, --results FORMAT
              Set the query results format.

              For variable bindings, the values of FORMAT vary upon what Rasqal supports but include 'simple' for a simple text format (default), 'xml' for the SPARQL Query Results XML format, 'rdfxml' and
              'turtle' for RDF syntax formats, and 'json' for a JSON version of the results.

              For RDF graph results, the values of FORMAT are 'ntriples' (N-Triples, default), 'rdfxml-abbrev' (RDF/XML Abbreviated), 'rdfxml' (RDF/XML), 'turtle' (Turtle), 'json' (RDF/JSON  resource  cen‐
              tric), 'json-triples' (RDF/JSON triples) or 'rss-1.0' (RSS 1.0, also an RDF/XML syntax).

              The exact list of formats depends on what libraptor2(3) was built with but is given correct in the usage message with -h.

OTHER OPTIONS
       -c, --count
              Only count the triples and produce no other output.

       -d, --dump-query FORMAT
              Print the parsed query out in a given FORMAT one of 'none' (default), 'debug', 'structure' or 'sparql'

       -D, --data URI
              Add RDF data source URI (not a named graph).  If no data sources are given, the query itself must point to the data such as via SPARQL FROM uri statements.

       -E, --ignore-errors
              Do not print error messages and do not exit with a non-0 status.

       -f, --feature NAME(=VALUE)
              Set query feature NAME to the VALUE or integer 1 if omitted.  The known features can be shown with -f help or --feature help.

       -F, --format NAME
              Set the data source format name for subsequent data graphs called with -D / --data or -G / --named.  The default if this is not specified is for the query engine to guess.  The name is a Rap‐
              tor parser name.

       -G, --named URI
              Add RDF data source URI (named graph)

       -h, --help
              Show a summary of the options.

       -n, --dryrun
              Prepare the query but do not execute it.

       -q, --quiet
              No extra information messages.

       -s, --source URI
              Add RDF data source URI (named graph) URI by adding it to the list of query data source URIs.  FORMAT to 'simple' (default) or 'xml' (an experimental XML format)

       -v, --version
              Print the rasqal library version and exit.

       -W, --warnings LEVEL
              Set the warning LEVEL in the range 0 (do not warn about anything) to 100 (show every warning). The Rasqal default is in the middle (50).

EXAMPLES
              roqet sparql-query-file.rq

       Run a SPARQL query contained in the local file sparql-query-file.rq.  The data used would be described in FROM statements in the query file.

              roqet -q -i sparql http://example.org/sparql-query.rq

       Run a SPARQL query that is in the web at URI http://example.org/sparql-query.rq without an extra messages (quiet, -q).

              roqet -q query-file.rq http://example.org/base/

       Run an query (default languge SPARQL) from a local file query-file.rq but using base URI http://example.org/base/ to resolve any relative URIs.

              roqet -q -i sparql -r xml http://example.org/sparql-query.rq

       Run a SPARQL query that is in the web at URI http://example.org/sparql-query.rq and format the results in the SPARQL Query Results XML format with no extra messages.

              roqet -i sparql -e 'SELECT * WHERE { ?s ?p ?o }' -D stuff.rdf

       Run a SPARQL query given on the command line against data in the file stuff.rdf.  The type of the file will be guessed and likely is of format RDF/XML.

CONFORMING TO
       SPARQL  Query  Language  for   RDF,   Eric   Prud'hommeaux   and   Andy   Seaborne   (eds),   W3C   Recommendation,   15   January   2008.    http://www.w3.org/TR/2008/REC-rdf-sparql-query-20080115/
       ⟨http://www.w3.org/TR/2008/REC-rdf-sparql-query-20080115/⟩

       SPARQL   Query   Results   XML   Format,   Jeen   Broekstra   and   Dave   Beckett   (eds),   W3C   Recommendation,   15   January   2008.   http://www.w3.org/TR/2008/REC-rdf-sparql-XMLres-20080115/
       ⟨http://www.w3.org/TR/2008/REC-rdf-sparql-XMLres-20080115/⟩

SEE ALSO
       librasqal(3),libraptor(3)

CHANGES
AUTHOR
       Dave Beckett - http://www.dajobe.org/ ⟨http://www.dajobe.org/⟩



                                                                                                  2011-06-11                                                                                         roqet(1)
