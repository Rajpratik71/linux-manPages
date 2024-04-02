VALGRIND-LISTENER(1)                                              Release 3.12.0                                              VALGRIND-LISTENER(1)

NAME
       valgrind-listener - listens on a socket for Valgrind commentary

SYNOPSIS
       valgrind-listener [options]

DESCRIPTION
       valgrind-listener accepts (multiple) connections from valgrind processes that use the --log-socket option on the specified port and copies
       the commentary it is sent to stdout.

OPTIONS
       -e --exit-at-zero
           When the number of connected processes falls back to zero, exit. Without this, it will run forever, that is, until you send it
           Control-C.

       --max-connect=INTEGER
           By default, the listener can connect to up to 50 processes. Occasionally, that number is too small. Use this option to provide a
           different limit. E.g.  --max-connect=100.

       portnumber
           Changes the port it listens on from the default (1500). The specified port must be in the range 1024 to 65535. The same restriction
           applies to port numbers specified by a --log-socket to Valgrind itself.

SEE ALSO
       valgrind(1), $INSTALL/share/doc/valgrind/html/index.html or http://www.valgrind.org/docs/manual/index.html.

AUTHOR
       Julian Seward.

Release 3.12.0                                                      12/06/2016                                                VALGRIND-LISTENER(1)
