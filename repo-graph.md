repo-graph(1)                                                                                                                                                                                   repo-graph(1)



NAME
       repo-graph - output a full package dependency graph in dot format

SYNOPSIS
       repo-graph [options]

DESCRIPTION
       repo-graph is a program that generates a full package dependency list from a yum repository and outputs it in dot format.

OPTIONS
       -h, --help
              Display a help message, and then quit.

       --repoid=REPOID
              Specify repo ids to query, can be specified multiple times (default is all enabled).

       -c CONFIG
              Config file to use (defaults to /etc/yum.conf).


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.



                                                                                               13 January 2013                                                                                  repo-graph(1)
