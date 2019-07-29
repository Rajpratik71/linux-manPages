finger@(1)                                                    General Commands Manual                                                   finger@(1)

NAME
       finger@ - gets user information from a remote host.

SYNOPSIS
       finger@ [ host [ user ] ]

DESCRIPTION
       finger@ connects to TCP port 79 (Finger) on host, sends user (with an extra CR) to host, and prints any data it receives. It removes CR and
       converts unprintable characters to a visible format.

       Some computers respond to port 79 with information about user.

       If user is not supplied, finger@ sends a blank line to host. Some computers respond with information about all the users who are logged in.

       If host is not supplied, finger@ connects to the local host.

SEE ALSO
       tcpserver(1), tcprules(1), tcprulescheck(1), argv0(1), fixcrio(1), recordio(1), rblsmtpd(1),  tcpclient(1),  who@(1),  date@(1),  http@(1),
       tcpcat(1), mconnect(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                        finger@(1)
