ACYCLIC(1)                                                                               General Commands Manual                                                                               ACYCLIC(1)

NAME
       acyclic - make directed graph acyclic

SYNOPSIS
       acyclic [ -nv?  ] [ -o outfile ] [ file ]

DESCRIPTION
       acyclic  is  a  filter  that  takes  a  directed  graph  as  input and outputs a copy of the graph with sufficient edges reversed to make the graph acyclic. The reversed edge inherits all of the
       attributes of the original edge. The optional file argument specifies where the the input graph is stored; by default, the program reads from stdin.

OPTIONS
       The following options are supported:

       -n     No output is produced, though the return value will indicate whether the graph is acyclic or not.

       -v     Print information about whether the file is acyclic, has a cycle or is undirected.

       -o outfile
              causes the output to be written to the specified file; by default, output is written to stdout.

       -?     option causes the program to print usage information.

RETURN CODES
       acyclic returns 0 if the graph is acyclic; 1 if the graph has a cycle; 2 if the graph is undirected; and 255 if there are any errors.

BUGS
       If the graph is strict and there is a cycle of length 2, the attributes of the reversed edge are lost.

       Some edge attributes are non-symmetric, referring to either the head or tail node. At present, there is no mechanism or convention for correctly switching or renaming these.

AUTHORS
       Stephen C. North <north@research.att.com>
       Emden R. Gansner <erg@research.att.com>

SEE ALSO
       gc(1), dot(1), gvpr(1), gvcolor(1), ccomps(1), sccmap(1), tred(1), libgraph(3)

                                                                                              21 March 2001                                                                                    ACYCLIC(1)
