DIJKSTRA(1)                                                                              General Commands Manual                                                                              DIJKSTRA(1)

NAME
       dijkstra - single-source distance filter

SYNOPSIS
       dijkstra [ -adp?  ] [ sourcenode file ]

DESCRIPTION
       dijkstra reads a stream of graphs and for each computes the distance of every node from sourcenode.  Edge length is given in the len attribute, and the default is 1.  The dist attribute of every
       node is set to its distance from sourcenode.  If the -p flag is used, the prev attribute of each node reachable from sourcenode is set to the name of the previous node on a shortest  path.   The
       graph attribute maxdist is set to the maximum dist of all nodes in the graph.

       If the -d flag is used, the graph is treated as directed and only forward edges are used.

       By default, if the graph is disconnected, the dist attribute of nodes unreachable from sourcenode are left untouched, and maxdist is set to the maximum of any previous value and the largest dis‐
       tance recorded in this run. On the other hand, if the -a flag is used, the dist attribute of an unreachable node is assigned a very large value, and maxdist records the maximum distance found in
       the component containing sourcenode.

       Any number of sourcenode file pairs may be given.  If the last file is missing, stdin is used.  All output is written to stdout.

       In a typical application, dist and maxdist can drive a downstream calculation of color or some other attribute.

SEE ALSO
       gvpr(1), gvcolor(1), libgraph(3)

                                                                                              21 March 2001                                                                                   DIJKSTRA(1)
