ZDUMP(8)                                                                               Linux System Administration                                                                               ZDUMP(8)

NAME
       zdump - timezone dumper

SYNOPSIS
       zdump [ --version ] [ --help ] [ -v ] [ -c [loyear,]hiyear ] [ zonename ... ]

DESCRIPTION
       Zdump prints the current time in each zonename named on the command line.

       These options are available:

       --version
              Output version information and exit.

       --help Output short usage and exit.

       -v     For  each  zonename  on  the  command  line,  print the time at the lowest possible time value, the time one day after the lowest possible time value, the times both one second before and
              exactly at each detected time discontinuity, the time at one day less than the highest possible time value, and the time at the highest possible time value.  Each line ends  with  isdst=1
              if the given time is Daylight Saving Time or isdst=0 otherwise.

       -c [loyear,]hiyear
              Cut  off  the  verbose output near the start of the given year(s).  The output still includes the lowest possible time value and one day after it, and the highest possible time value pre‐
              ceded by the time value one day before it.

SEE ALSO
       tzfile(5), zic(8)

COLOPHON
       This page is part of release 4.04 of the Linux man-pages project.  A description of the project, information about reporting bugs,  and  the  latest  version  of  this  page,  can  be  found  at
       http://www.kernel.org/doc/man-pages/.

                                                                                                2013-02-12                                                                                       ZDUMP(8)
