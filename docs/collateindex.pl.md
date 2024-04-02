COLLATEINDEX(1)                                                    DocBook DSSSL                                                   COLLATEINDEX(1)

NAME
       collateindex.pl - generate DocBook index files

SYNOPSIS
       collateindex.pl [-f] [-g] [-i id] [-I scope] [-N]
                       [-o file] [-p] [-P file] [-q] [-s name]
                       [-S scope] [-t name] [-x] file

DESCRIPTION
       collateindex.pl creates index data for DocBook XML or SGML files.

OPTIONS
       -f   Force the output file to be written, even if it appears to have been edited by hand.

       -g   Group terms with IndexDiv based on the first letter of the term (or its SortAs attribute).  (This might not handle all language envi‐
            ronments.)

       -i id
            The ID to use for the <index> tag.

       -I scope
            The implied scope, must be "all", "local", or "global".  IndexTerms which do not specify a scope will have the implied scope.  If
            unspecified, "all" is assumed.

       -N   New index (generates an empty index file).

       -o file
            Output to file. Defaults to stdout.

       -p   Link to points in the document.  The default is to link to the closest containing section.

       -P file
            Read a preamble from file.  The contents of file will be inserted before the <index> tag.

       -q   Run quietly.

       -s name
            Name the IndexDiv that contains symbols.  The default is "Symbols".  Meaningless if -g is not used.

       -S scope
            Scope of the index, must be "all", "local", or "global".  If unspecified, "all" is assumed.

       -t name
            Title for the index.

       -x   Make a SetIndex.

       -V   Print version number and exit.

       file The file containing index data generated with the DocBook DSSSL HTML stylesheet (usually called HTML.index).

EXAMPLE
       collateindex.pl -o index.sgml HTML.index

EXIT STATUS
       0    Success

       1    Failure

AUTHOR
       Norm Walsh <ndw@nwalsh.com>

       Minor updates by Adam Di Carlo <adam@onshore.com> and Peter Eisentraut <peter_e@gmx.net>

docbook-dsssl 1.79                                                  2004-11-04                                                     COLLATEINDEX(1)
