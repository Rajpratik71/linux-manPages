addcr(1)                                                      General Commands Manual                                                     addcr(1)

NAME
       addcr - inserts a CR (\015) before each LF (\012)

SYNOPSIS
       addcr

DESCRIPTION
       addcr  inserts  a  CR (\015) before each LF (\012), i.e., at the end of each line of input. It does not insert a CR at the end of a partial
       final line.

       addcr reads input from stdin and writes to stdout.

SEE ALSO
       tcpserver(1), tcprules(1), tcprulescheck(1), argv0(1), fixcrio(1), recordio(1), rblsmtpd(1), tcpclient(1), who@(1),  date@(1),  finger@(1),
       http@(1), tcpcat(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                          addcr(1)
