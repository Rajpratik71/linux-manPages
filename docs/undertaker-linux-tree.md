UNDERTAKER-LINUX-TREE(1)                                           User Commands                                          UNDERTAKER-LINUX-TREE(1)

NAME
       undertaker-linux-tree - run undertaker on linux tree

SYNOPSIS
       undertaker-linux-tree [-m DIR] [-a ARCH] [-t PROCS] [-c]

DESCRIPTION
       `undertaker-linux-tree' runs the undertaker a whole linux-tree

       -m <modeldir>
              Specify the directory for the models

              (default: models)

       -a <arch>
              Default architecture to check for

              (default: x86)

       -t <count>
              Number of analyzing processes

              (default: _NPROCESSORS_ONLN)

       -c     Do coverage analysis instead of dead block search

AUTHOR
       Written by the VAMOS team <URL:http://vamos.informatik.uni-erlangen.de>

REPORTING BUGS
       Report bugs to <vamos-dev@i4.informatik.uni-erlangen.de>.

SEE ALSO
       undertaker(1) undertaker-kconfigdump(1), undertaker-linux-tree(1).

undertaker-linux-tree undertaker-linux-tree                        December 2011                                          UNDERTAKER-LINUX-TREE(1)
