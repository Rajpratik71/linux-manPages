ATRUN(8)                                                                                  Linux Programmer's Manual                                                                                  ATRUN(8)



NAME
       atrun - run jobs queued for later execution

SYNOPSIS
       atrun [-l load_avg] [-d]

DESCRIPTION
       atrun runs jobs queued by at(1).  It is a shell script invoking /usr/sbin/atd with the -s option, and is provided for backward compatibility with older installations.

SEE ALSO
       at(1), atd(8).

AUTHOR
       At was mostly written by Thomas Koenig, ig25@rz.uni-karlsruhe.de.



local                                                                                              Nov 1996                                                                                          ATRUN(8)
