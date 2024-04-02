fixcrio(1)                                                    General Commands Manual                                                   fixcrio(1)

NAME
       fixcrio - inserts missing CRs at the ends of lines.

SYNOPSIS
       fixcrio prog

DESCRIPTION
       fixcrio runs prog.  It inserts CR at the end of each line of input or output to prog that does not have a CR.

       fixcrio runs as a child process of prog.  It exits when it sees the end of prog's output.

SEE ALSO
       tcpserver(1),  tcprules(1),  tcprulescheck(1),  argv0(1),  recordio(1), rblsmtpd(1), tcpclient(1), who@(1), date@(1), finger@(1), http@(1),
       tcpcat(1), mconnect(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                        fixcrio(1)
