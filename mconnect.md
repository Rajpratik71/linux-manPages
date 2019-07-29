mconnect(1)                                                   General Commands Manual                                                  mconnect(1)

NAME
       mconnect - connects to a remote SMTP server.

SYNOPSIS
       mconnect [ host [ port ] ]

DESCRIPTION
       mconnect  connects  to  port  on host.  It sends its input to host, adding a CR to each line. Meanwhile it prints anything it receives from
       host.

       If port is not supplied, mconnect uses port 25 (SMTP).

       If host is not supplied, mconnect connects to the local host.

SEE ALSO
       tcpserver(1), tcprules(1), tcprulescheck(1), argv0(1), fixcrio(1), recordio(1), rblsmtpd(1), tcpclient(1), who@(1),  date@(1),  finger@(1),
       http@(1), tcpcat(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                       mconnect(1)
