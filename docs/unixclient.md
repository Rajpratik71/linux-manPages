UNIXCLIENT(1)                                                 General Commands Manual                                                UNIXCLIENT(1)

NAME
       unixclient - UNIX domain socket client

SYNOPSIS
       unixclient [options] socket program

DESCRIPTION
       Unixclient is  UNIX domain socket client that conform to UCSPI, the UNIX Client-Server Program Interface.

OPTIONS

       -q     Quiet. Do not print any messages.

       -Q     (default) Print error messages.

       -v     Verbose.  Print error and status messages.  -c N Do not handle more than N simultaneous connections.  (default 10)

SEE ALSO
       unixserver(1), unixcat(1) http://cr.yp.to/proto/ucspi.txt

AUTHOR
       ucspi-unix package was written by Bruce Guenter <bruceg@em.ca>

       This  manual  page  was originally written by Tomas Kuliavas <tokul@bigfoot.com> for the Debian GNU/Linux system, but may be used elsewhere
       under the GPL.

                                                                                                                                     UNIXCLIENT(1)
