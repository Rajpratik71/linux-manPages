MM2GV(1)                                                                                   General Commands Manual                                                                                   MM2GV(1)



NAME
       mm2gv - Matrix Market-DOT converters

SYNOPSIS
       mm2gv [ -cluv?  ] [ -ooutfile ] [ file ]

DESCRIPTION
       mm2gv converts a sparse matrix of the Matrix Market format to a graph in the GV (formerly DOT) format.

OPTIONS
       The following options are supported:

       -c     This flag causes mm2gv to assign colors to the edges. The matrix element is scaled to the range [0,1] depending on where it lies between the minimum and maximum set matrix values. This scaled
              value is used as the "wt" attribute of the corresponding edge.  In addition, this scalar value is mapped to an RGB value, which is stored as the edge "color".

       -l     If set, mm2gv attaches a label to the graph indicating the base name of the input file, and the number of nodes and edges.

       -u     If specified, the graph is assumed to be undirected. By default, the graph generated is directed.

       -v     This flag causes mm2gv to store the matrix values as the "len" attribute of the corresponding edge.

       -ooutfile
              Prints output to the file outfile. If not given, mm2gv uses stdout.


       OPERANDS
              The following operand is supported:

       file    Name of the file in MatrixMarket format.  If no file operand is specified, the standard input will be used.

RETURN CODES
       Return 0 if there were no problems during conversion; and non-zero if any error occurred.

AUTHORS
       Yifan Hu <yifanhu@research.att.com>
       Emden R. Gansner <erg@research.att.com>

ADDITIONAL INFO
       See http://math.nist.gov/MatrixMarket/ for description of the format and http://www.cise.ufl.edu/research/sparse/matrices/ for a large collection of sparse matrices in this format.



                                                                                                 31 July 2008                                                                                        MM2GV(1)
