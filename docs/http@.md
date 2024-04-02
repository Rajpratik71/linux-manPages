http@(1)                                                      General Commands Manual                                                     http@(1)

NAME
       http@ - gets a web page from a remote host.

SYNOPSIS
       http@ [ host [ page [ port ] ] ]

DESCRIPTION
       http@ connects to port on host, sends

              GET /page HTTP/1.0

              Host: host

       to host, and prints the contents of the response, removing CR from the end of each line.

       If port is not supplied, http@ uses TCP port 80 (HTTP).

       If page is not supplied, http@ asks for / from host.

       If host is not supplied, http@ connects to the local host.

SEE ALSO
       tcpserver(1),  tcprules(1),  tcprulescheck(1), argv0(1), fixcrio(1), recordio(1), rblsmtpd(1), tcpclient(1), who@(1), date@(1), finger@(1),
       tcpcat(1), mconnect(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                          http@(1)
