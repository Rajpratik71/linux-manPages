CLUSTER(1)                                                                               General Commands Manual                                                                               CLUSTER(1)

NAME
       cluster - find clusters in a graph and augment the graph with this information.

SYNOPSIS
       cluster [-v?]  [ -Ck ] [ -ck ] [ -o outfile ] [ files ]

DESCRIPTION
       cluster  takes as input a graph in DOT format, finds node clusters and augments the graph with this information.  The clusters are specified by the "cluster" attribute attached to nodes; cluster
       values are non-negative integers.  cluster attempts to maximize the modularity of the clustering.  If the edge attribute "weight" is defined, this will be used in computing the clustering.

OPTIONS
       The following options are supported:

       -Ck    specifies a targeted number of clusters that should be generated.  The specified number k is only a suggestion and may not be realisable.  If k == 0, the default, the number  of  clusters
              that approximately optimizes the modularity is returned.

       -ck    specifies clustering method.  If k == 0, the default, modularity clustering will be used.  If k == 1 modularity quality will be used.

       -ooutfile
              Specifies that output should go into the file outfile. By default, stdout is used.

       -v     Verbose mode.

EXAMPLES
       Applying cluster to the following graph,

          graph {
              1--2 [weight=10.]
              2--3 [weight=1]
              3--4 [weight=10.]
              4--5 [weight=10]
              5--6 [weight=10]
              3--6 [weight=0.1]
              4--6 [weight=10.]
             }

       gives

          graph {
                node [cluster="-1"];
                1 [cluster=1];
                2 [cluster=1];
                3 [cluster=2];
                4 [cluster=2];
                5 [cluster=2];
                6 [cluster=2];
                1 -- 2 [weight="10."];
                2 -- 3 [weight=1];
                3 -- 4 [weight="10."];
                4 -- 5 [weight=10];
                5 -- 6 [weight=10];
                3 -- 6 [weight="0.1"];
                4 -- 6 [weight="10."];
          }

AUTHOR
       Yifan Hu <yifanhu@research.att.com>

SEE ALSO
       gvmap(1)

       Blondel, V.D., Guillaume, J.L., Lambiotte, R., Lefebvre, E.: Fast unfolding of communities in large networks. Journal of Statistical Mechanics: Theory and Experiment (2008), P10008.

                                                                                               3 March 2011                                                                                    CLUSTER(1)
