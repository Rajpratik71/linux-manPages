xentop(1)                          Xen                         xentop(1)

NAME
       xentop - displays real-time information about a Xen system and
       domains

SYNOPSIS
       xentop [-h] [-V] [-dSECONDS] [-n] [-r] [-v] [-f] [-b]
       [-iITERATIONS]

DESCRIPTION
       xentop displays information about the Xen system and domains, in
       a continually-updating manner.  Command-line options and
       interactive commands can change the detail and format of the
       information displayed by xentop.

OPTIONS
       -h, --help
           display help and exit

       -V, --version
           output version information and exit

       -d, --delay=SECONDS
           seconds between updates (default 3)

       -n, --networks
           output network information

       -x, --vbds
           output vbd block device data

       -r, --repeat-header
           repeat table header before each domain

       -v, --vcpus
           output VCPU data

       -f, --full-name
           output the full domain name (not truncated)

       -b, --batch
           output data in batch mode (to stdout)

       -i, --iterations=ITERATIONS
           maximum number of iterations xentop should produce before
           ending

INTERACTIVE COMMANDS
       All interactive commands are case-insensitive.

       D   set delay between updates

       N   toggle display of network information

       Q, Esc
           quit

       R   toggle table header before each domain

       S   cycle sort order

       V   toggle display of VCPU information

       Arrows
           scroll domain display

AUTHORS
       Written by Judy Fischbach, David Hendricks, and Josh Triplett

REPORTING BUGS
       Report bugs to <xen-devel@lists.xen.org>.

COPYRIGHT
       Copyright 2005  International Business Machines  Corp

       This is free software; see the source for copying conditions.
       There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR
       A PARTICULAR PURPOSE.

4.6.5                          2017-03-07                      xentop(1)
