argv0(1)                                                      General Commands Manual                                                     argv0(1)

NAME
       argv0 - runs a program with a specified 0th argument.

SYNOPSIS
       argv0 realname zero args

DESCRIPTION
       realname is one argument.  zero is one argument.  args is any number of arguments.

       argv0  runs  the  program  stored as realname on disk, with zero as the 0th argument (rather than realname) and args as the remaining argu‐
       ments.

APPLICATIONS
       Some programs pay special attention to the 0th argument.  argv0 makes these programs usable from shell scripts.

       For example,

              argv0 /bin/csh -csh

       runs /bin/csh with a 0th argument of -csh. /bin/csh will think it is a login shell and behave accordingly.

       As another example, the command

              tcpserver 0 ftp argv0 tcpd ftpd -l -A

       has a similar effect to the line

              ftp stream tcp nowait root tcpd ftpd -l -A

       in /etc/inetd.conf. The tcpd program is run with 0th argument ftpd and remaining arguments -l -A. Note that tcpd can and should be replaced
       by the -x option of tcpserver(1):

              tcpserver -x ftp.tcp 0 ftp ftpd -l -A

SEE ALSO
       tcpserver(1),  tcprules(1),  tcprulescheck(1), fixcrio(1), recordio(1), rblsmtpd(1), tcpclient(1), who@(1), date@(1), finger@(1), http@(1),
       tcpcat(1), mconnect(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                          argv0(1)
