QMQP-SINK(1)                            General Commands Manual                           QMQP-SINK(1)

NAME
       qmqp-sink - parallelized QMQP test server

SYNOPSIS
       qmqp-sink [-46cv] [-x time] [inet:][host]:port backlog

       qmqp-sink [-46cv] [-x time] unix:pathname backlog

DESCRIPTION
       qmqp-sink  listens on the named host (or address) and port.  It receives messages from the net‐
       work and throws them away.  The purpose is to measure QMQP  client  performance,  not  protocol
       compliance.   Connections can be accepted on IPv4 or IPv6 endpoints, or on UNIX-domain sockets.
       IPv4 and IPv6 are the default.  This program is the complement of the qmqp-source(1) program.

       Note: this is an unsupported test program. No attempt is made to maintain compatibility between
       successive versions.

       Arguments:

       -4     Support IPv4 only. This option has no effect when Postfix is built without IPv6 support.

       -6     Support  IPv6 only. This option is not available when Postfix is built without IPv6 sup‐
              port.

       -c     Display a running counter that is updated whenever a delivery is completed.

       -v     Increase verbosity. Specify -v -v to see some of the QMQP conversation.

       -x time
              Terminate after time seconds. This is to facilitate memory leak testing.

SEE ALSO
       qmqp-source(1), QMQP message generator

LICENSE
       The Secure Mailer license must be distributed with this software.

AUTHOR(S)
       Wietse Venema
       IBM T.J. Watson Research
       P.O. Box 704
       Yorktown Heights, NY 10598, USA

       Wietse Venema
       Google, Inc.
       111 8th Avenue
       New York, NY 10011, USA

                                                                                          QMQP-SINK(1)
