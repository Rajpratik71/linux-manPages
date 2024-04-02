delcr(1)                                                      General Commands Manual                                                     delcr(1)

NAME
       delcr - removes a CR (\015) at the end of each line of input, if a CR is present.

SYNOPSIS
       delcr

DESCRIPTION
       delcr removes a CR (\015) at the end of each line of input, if a CR is present. It does not remove a CR at the end of a partial final line.

       delcr reads input from stdin and writes to stdout.

SEE ALSO
       tcpserver(1),  tcprules(1),  tcprulescheck(1), argv0(1), fixcrio(1), recordio(1), rblsmtpd(1), tcpclient(1), who@(1), date@(1), finger@(1),
       http@(1), tcpcat(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                          delcr(1)
