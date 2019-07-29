who@(1)                                                       General Commands Manual                                                      who@(1)

NAME
       who@ - prints the list of active users on a remote host.

SYNOPSIS
       who@ [ host ]

DESCRIPTION
       who@  connects to TCP port 11 (Systat) on host and prints any data it receives. It removes CR (\015) and converts unprintable characters to
       a visible format.

       If host is not supplied, who@ connects to the local host.

       Some computers respond to port 11 with a list of active users. For example, they may be running

              tcpserver -RHl0 0 11 who

       using tcpserver.

SEE ALSO
       tcpserver(1), tcprules(1), tcprulescheck(1), argv0(1), fixcrio(1), recordio(1), rblsmtpd(1), tcpclient(1), date@(1), finger@(1),  http@(1),
       tcpcat(1), mconnect(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                           who@(1)
