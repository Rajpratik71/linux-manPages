GRAPHML2GV(1)                                                                            General Commands Manual                                                                            GRAPHML2GV(1)

NAME
       graphml2gv - GRAPHML-DOT converter

SYNOPSIS
       graphml2gv [ -?v ] [ -ggname ] [ -ooutfile ] [ files ]

DESCRIPTION
       graphml2gv converts a graph specified in the GRAPHML format to a graph in the GV (formerly DOT) format.

OPTIONS
       The following options are supported:

       -v     Turns on verbose mode

       -?     Prints usage information and exits.

       -ggname
              The string gname is used as the name of the generated graph.  If multiple graphs are generated, subsequent graphs use the name gname appended with an integer.

       -ooutfile
              Prints output to the file outfile. If not given, graphml2gv uses stdout.

       OPERANDS
              The following operand is supported:

       files   Names of files containing 1 or more graphs in GRAPHML.  If no files operand is specified, the standard input will be used.

RETURN CODES
       Return 0 if there were no problems during conversion; and non-zero if any error occurred.

LIMITATIONS
       As  both  the graph and graphics models of GV and GML differ significantly, the conversion can only be at best approximate.  In particular, GV currently has no notion of hyperedges or edges con‐
       taining graphs.

       At present, graphml2gv only supports the basic graph topology. Specifically, the <KEY> and <DATA> elements are not handled, though they could be.

AUTHORS
       Emden R. Gansner <erg@research.att.com>

SEE ALSO
       dot(1), libcgraph(3)

                                                                                               14 July 2011                                                                                 GRAPHML2GV(1)
