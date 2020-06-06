GVMAP.SH(1)                                                                              General Commands Manual                                                                              GVMAP.SH(1)

NAME
       gvmap.sh - pipeline for running gvmap

SYNOPSIS
       gvmap.sh [-vV?]  [ options ] [ -o outfile ] [ files ]

DESCRIPTION
       gvmap.sh takes as input a graph in DOT format, performs a layout, runs the output through gvmap and renders the output. At some point, it is hoped to integrate all of these tasks into gvmap.

OPTIONS
       The following options are supported:

       -a k   The  integer  k  specifies the average number of artificial points added along the bounding box of the labels. Such artificial points are added to avoid a country boundary cutting through
              the boundary box of the labels. Computing time is proportional to k; hence, for large graphs, a small value of k is suggested. If k = -1, a suitable value of k is  automatically  selected
              based on the graph size. By default k = -1.

       -K layout
              specifies  which  program  should be use for the initial layout. By default, sfdp is run. Also by default, the layout is passed the flag -Goverlap=prism. This can be overridden using a -g
              flag.

       -T format
              specifies the final output format. This works the same way as the -T flag for any Graphviz layout program.

       -N attr=val
              specifies the setting of a default node attribute during the rendering phase. This works the same way as the -N flag for any Graphviz layout program.

       -G attr=val
              specifies the setting of a graph attribute during the rendering phase. This works the same way as the -G flag for any Graphviz layout program.

       -E attr=val
              specifies the setting of a default edge attribute during the rendering phase. This works the same way as the -E flag for any Graphviz layout program.

       -n attr=val
              specifies the setting of a default node attribute during the layout phase. This works the same way as the -N flag for any Graphviz layout program.

       -g attr=val
              specifies the setting of a graph attribute during the layout phase. This works the same way as the -G flag for any Graphviz layout program.

       -e attr=val
              specifies the setting of a default edge attribute during the layout phase. This works the same way as the -E flag for any Graphviz layout program.

       -A flag
              specifies a flag to be passed to gvmap. For example, gvmap.sh -Ae -As3 causes gvmap -e -s3 to be run.

       -v     Set verbose mode.

       -V     Print version information and exit.

       -?     Print usage information and exit.

EXAMPLES
       The following invocation creates a map with edges in semi-transparent light gray and nodes laid out using sfdp:

       gvmap.sh -Ae -Ecolor=#55555522 -Tpng foo.gv > foo.png

       It is equivalent to running the pipeline

       sfdp -Goverlap=prism foo.gv | gvmap -e | neato -n2 -Ecolor=#55555522 -Tpng > foo.png

AUTHOR
       Emden R. Gansner <erg@research.att.com>

SEE ALSO
       gvmap(1), sfdp(1), neato(1), gvpr(1)

       E. R. Gansner, Y. Hu, S. G. Kobourov, "GMap: Visualizing graphs and clusters as maps," Proc. Pacific Vis. 2010, pp. 201‐208.

                                                                                              31 March 2011                                                                                   GVMAP.SH(1)
