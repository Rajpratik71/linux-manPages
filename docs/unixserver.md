UNIXSERVER(1)                                                 General Commands Manual                                                UNIXSERVER(1)

NAME
       unixserver - UNIX domain socket server

SYNOPSIS
       unixserver [options] socket program

DESCRIPTION
       Unixserver is  UNIX domain socket server that conform to UCSPI, the UNIX Client-Server Program Interface.

OPTIONS

       -q     Quiet. Do not print any messages.

       -Q     (default) Print error messages.

       -v     Verbose.  Print error and status messages.

       -d     Do not delete the socket file on exit.

       -D     (default) Delete the socket file on exit.

       -u UID Change user id to UID after creating socket.

       -g GID Change group id to GID after creating socket.

       -U     Same as '-u $UID -g $GID'.

       -o UID Make the socket owned by UID.

       -r GID Make the socket group owned by GID.

       -O     Same as '-o $SOCKET_UID -r $SOCKET_GID'.

       -p PERM
              Set the permissions on the created socket (in octal).  Note: this option, if set, overrides the mask below.  (defaults to 0666 minus
              umask)

       -m MASK
              Set umask to MASK (in octal) before creating socket.  (defaults to 0, previous value is restored afterwards)

       -c N   Do not handle more than N simultaneous connections.  (default 10)

       -b N   Allow a backlog of N connections.

       -B BANNER
              Write BANNER to the client immediately after connecting.

SEE ALSO
       unixclient(1), unixcat(1) http://cr.yp.to/proto/ucspi.txt

AUTHOR
       ucspi-unix package was written by Bruce Guenter <bruceg@em.ca>

       This manual page was originally written by Tomas Kuliavas <tokul@bigfoot.com> for the Debian GNU/Linux system, but may  be  used  elsewhere
       under the GPL.

                                                                                                                                     UNIXSERVER(1)
