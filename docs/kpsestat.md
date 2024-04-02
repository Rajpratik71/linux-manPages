KPSESTAT(1)                                                                      General Commands Manual                                                                      KPSESTAT(1)

NAME
       kpsestat - compute octal mode from mode of existing file

SYNOPSIS
       kpsestat mode file

DESCRIPTION
       kpsestat prints the octal permission of file modified according to mode on standard output.  The mode parameter accepts a subset of the symbolic permissions accepted by chmod(1).
       Use = as the mode to obtain the unchanged permissions.

OPTIONS
       kpsestat accepts the following options:

       --help Print help message and exit.

       --version
              Print version information and exit.

SEE ALSO
       chmod(1).

Kpathsea 6.3.1/dev                                                                     1 March 2011                                                                           KPSESTAT(1)
