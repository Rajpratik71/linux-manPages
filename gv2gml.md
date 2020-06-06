GML2GV,GV2GML(1)                                                                         General Commands Manual                                                                         GML2GV,GV2GML(1)

NAME
       gml2gv,gv2gml - GML-DOT converters

SYNOPSIS
       gml2gv [ -?v ] [ -ggname ] [ -ooutfile ] [ files ]
       gv2gml [ -?  ] [ -ooutfile ] [ files ]

DESCRIPTION
       gml2gv converts a graph specified in the GML format to a graph in the GV (formerly DOT) format.  gv2gml converts a graph specified in the GV format to a graph in the GML format.

OPTIONS
       The following options are supported:

       -v     Turns on verbose mode

       -?     Prints usage information and exits.

       -ggname
              The string gname is used as the name of the generated graph.  If multiple graphs are generated, subsequent graphs use the name gname appended with an integer.

       -ooutfile
              Prints output to the file outfile. If not given, gml2gv uses stdout.

       OPERANDS
              The following operand is supported:

       files   Names of files containing 1 or more graphs in GML.  If no files operand is specified, the standard input will be used.

RETURN CODES
       Return 0 if there were no problems during conversion; and non-zero if any error occurred.

LIMITATIONS
       As  both the graph and graphics models of GV and GML differ significantly, the conversion is at best approximate. In particular, it is not clear how multiedges are differentiated in GML, so mul‐
       tiedges are created in GV with no user-available key. Also, no attribute information is lost, in that any GML attributes that aren't converted to GV equivalents are retained as attributes in the
       output graph.

       At  present,  gv2gml  does  not  support  subgraphs  and  clusters.  In  addition, there does not appear to be a standard mechanism for specifying default node and edge attributes in GML, so any
       attributes are repeated for every node and edge.

AUTHORS
       Emden R. Gansner <erg@research.att.com>

SEE ALSO
       dot(1), libcgraph(3)

                                                                                               24 June 2011                                                                              GML2GV,GV2GML(1)
