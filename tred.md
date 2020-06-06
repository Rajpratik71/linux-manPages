TRED(1)                                                                                  General Commands Manual                                                                                  TRED(1)

NAME
       tred - transitive reduction filter for directed graphs

SYNOPSIS
       tred [ files ]

DESCRIPTION
       tred computes the transitive reduction of directed graphs, and prints the resulting graphs to standard output.  This removes edges implied by transitivity.  Nodes and subgraphs are not otherwise
       affected.  The ``meaning'' and validity of the reduced graphs is application dependent.  tred is particularly useful as a preprocessor to dot to reduce clutter in dense layouts.

       Undirected graphs are silently ignored.

OPERANDS
       The following operand is supported:

       files   Names of files containing 1 or more graphs in dot format.  If no files operand is specified, the standard input will be used.

BUGS
       Using bitmaps internally would substantially decrease running time.

DIAGNOSTICS
       If a graph has cycles, its transitive reduction is not uniquely defined.  In this case tred emits a warning.

AUTHORS
       Stephen C. North <north@research.att.com>
       Emden R. Gansner <erg@research.att.com>

SEE ALSO
       gc(1), dot(1), acyclic(1), gvpr(1), gvcolor(1), ccomps(1), sccmap(1), libgraph(3)

                                                                                              21 March 2001                                                                                       TRED(1)
