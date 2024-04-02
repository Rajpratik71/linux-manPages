SWAP-OFFSET(8)                                swap-offset                               SWAP-OFFSET(8)

NAME
       swap-offset - program to calculate the offset of a swap file in a partition

SYNOPSIS

DESCRIPTION
       This manual page documents briefly the swap-offset.

       The programs s2disk and s2both can be used to save the state of the whole system to a swap
       partition or file and power off or suspend your system. After restarting your system it will be
       put back in the exact system state you left it (this is sometimes called hibernation).

       In the case of using a swap file you will have to specify the location of the swap file's
       header as the offset from the beginning of the partition that contains the swap file. The
       swap-offset utility can be used to determine this value.

SEE ALSO
       uswsusp.conf(5), s2disk(8)

       For more information see the README file.

AUTHOR
       This manual page was written by Tim Dijkstra <tim@famdijkstra>.org for the Debian(TM) system
       (but may be used by others). Was updated by Rodolfo García <kix@kix.es>. Permission is granted
       to copy, distribute and/or modify this document under the terms of the GNU General Public
       License, Version 2 any later version published by the Free Software Foundation.

COPYRIGHT
       Copyright © 2006 Tim Dijkstra Copyright © 2012 Rodolfo García (kix)

uswsusp                                      Feb 29, 2012                               SWAP-OFFSET(8)
