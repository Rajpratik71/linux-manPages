NOP(1)                                                        General Commands Manual                                                       NOP(1)

NAME
       nop - pretty-print graph file

SYNOPSIS
       nop [ -p?  ] [ files ]

DESCRIPTION
       nop reads a stream of graphs and prints each in pretty-printed (canonical) format on stdout. If no files are given, it reads from stdin.

OPTIONS
       The following options are supported:

       -p     Produce no output - just check the input for valid DOT.

       -?     Print usage information.

EXIT STATUS
       If  any  errors  occurred  while  processing any input, such as a file not found or a file containing illegal DOT, a non-zero exit value is
       returned. Otherwise, zero is returned.

SEE ALSO
       wc(1), acyclic(1), gvpr(1), gvcolor(1), ccomps(1), sccmap(1), tred(1), libgraph(3)

                                                                   21 March 2001                                                            NOP(1)
