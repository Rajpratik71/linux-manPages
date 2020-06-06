UNFLATTEN(1)                                                                             General Commands Manual                                                                             UNFLATTEN(1)

NAME
       unflatten - adjust directed graphs to improve layout aspect ratio

SYNOPSIS
       unflatten [-f] [-llen] [-clen ] [ -o outfile ] [ files ]

DESCRIPTION
       unflatten is a preprocessor to dot that is used to improve the aspect ratio of graphs having many leaves or disconnected nodes.  The usual layout for such a graph is generally very wide or tall.
       unflatten inserts invisible edges or adjusts the minlen on edges to improve layout compaction.

OPTIONS
       The following options are supported:

       -l len The minimum length of leaf edges is staggered between 1 and len (a small integer).

       -f     Enables the staggering of the -l option to fanout nodes whose indegree and outdegree are both 1. This helps with structures such as a -> {w x y z} -> b.  This option only works if the  -l
              flag is set.

       -c len Form disconnected nodes into chains of up to len nodes.

       -o outfile
              causes the output to be written to the specified file; by default, output is written to stdout.

OPERANDS
       The following operand is supported:

       files   Names of files containing 1 or more graphs in dot format.  If no files operand is specified, the standard input will be used.

AUTHORS
       Stephen C. North <north@research.att.com>
       Emden R. Gansner <erg@research.att.com>

SEE ALSO
       gc(1), dot(1), acyclic(1), gvpr(1), gvcolor(1), ccomps(1), tred(1), libgraph(3)

                                                                                             21 January 2001                                                                                 UNFLATTEN(1)
