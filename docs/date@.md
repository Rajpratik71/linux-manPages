date@(1)                                                      General Commands Manual                                                     date@(1)

NAME
       date@ - prints the date on a remote host.

SYNOPSIS
       date@ [ host ]

DESCRIPTION
       date@  connects  to TCP port 13 (Daytime) on host and prints any data it receives. It removes CR (\015) and converts unprintable characters
       to a visible format.

       If host is not supplied, date@ connects to the local host.

       Some computers respond to port 13 with a human-readable date. For example, they may be running

              tcpserver -RHl0 0 13 date

       using tcpserver.

SEE ALSO
       tcpserver(1), tcprules(1), tcprulescheck(1), argv0(1), fixcrio(1), recordio(1), rblsmtpd(1), tcpclient(1), who@(1),  finger@(1),  http@(1),
       tcpcat(1), mconnect(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                          date@(1)
