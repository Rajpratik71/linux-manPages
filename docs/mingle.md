MINGLE(1)                              General Commands Manual                              MINGLE(1)

delim $$

NAME
       mingle - fast edge bundling

SYNOPSIS
       mingle [ options ] [ -o outfile ] [ files ]

DESCRIPTION
       mingle takes as input a graph in DOT format with node position information (the pos attribute)
       and bundles the edges.

OPTIONS
       The following options are supported:

       -m k   indicates which method to use for bundling. A  value  of  0  corresponds  to  a  force-
              directed bundling.  A value of 2 uses a cluster plus ink saving approach. If available,
              a value 1 denotes an agglomerative  ink  saving  method.  Normally,  the  last  is  the
              default.

       -a k   specifies  the  maximum  turning angle, in degrees, as a non-negative real.  The larger
              the value, the more edges may bend. If the value is 0, there is no  limitation  on  the
              turning  angle.  The  default  is  40.   The  parameter  is  not used in force-directed
              bundling.

       -c v   specifies which compatability measure to use. The value 0, the default, uses a distance
              metric,  while  a  value  of 1 relies on full compatability. This value is only used in
              force-directed bundling.

       -i k   gives the maximum number of iterative  divisions  of  edges  allowd  in  force-directed
              bundling.  The default is 4.

       -k k   gives  the  number  of  neighbors  to be used in forming a nearest neighbor graph. This
              parameter is only used in the agglomerative method. The default is 10.

       -K k   is a positive real value giving the force constant used in force-directed bundling.  By
              default, the value is determined automatically.

       -o file
              puts output in file. Default output is stdout

       -p k   Except  for  the  force-directed  method,  bundling  minimizes  $ink * (k - cos(turning
              angle))$. The larger the value of k, the less emphasis is put on avoiding sharp turning
              angles and the faster the bundling.  The default value is -1.

       -r k   is  a non-negative integer giving the maximum recursion level used in the agglomerative
              method. The default is 100.

       -T fmt specifies the output format. At present, the output is always in the DOT format. If fmt
              is  "simple", the output is a simple, schematic representation of the drawing. Only the
              node positions and edges are retained from the original graph.  If  fmt  is  "gv",  the
              drawing information is attached to the input graph.

       -v k   determines  the  verbose level used for tracing the algorithm. The value k is optional;
              if not provided, the value 1 is used.

       -?     Print usage and exit.

BUGS
       At present, mingle does not handle graphs with loops or directed multiedges. So, a graph  with
       edges a -> b and b -> a is acceptable, but not if it has edges a -> b and a -> b or a -- b and
       a -- b.

AUTHOR
       Emden R. Gansner <erg@graphviz.org>, Yifan Hu <yifanhu@yahoo.com>

SEE ALSO
       sfdp(1), neato(1), gvpr(1)

       Emden R. Gansner, Yifan Hu, Stephen C. North and Carlos Scheidegger,  ``Multilevel  Agglomera‐
       tive  Edge Bundling for Visualizing Large Graphs'', IEEE Pacific Visualization Symposium Paci‐
       ficVis, pp. 187‐194, 2011.

                                            16 August 2013                                  MINGLE(1)
