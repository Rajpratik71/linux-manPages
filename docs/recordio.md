recordio(1)                                                   General Commands Manual                                                  recordio(1)

NAME
       recordio - records the input and output of a program.

SYNOPSIS
       recordio prog

DESCRIPTION
       recordio runs prog.  It prints lines to descriptor 2 showing the input and output of prog.

       At  the beginning of each line on descriptor 2, recordio inserts the prog process ID, along with < for input or > for output. At the end of
       each line it inserts +, a space, or [EOF]; a space indicates that there was a new line in the input or output, and [EOF] indicates the  end
       of input or output.

       recordio prints every packet of input and output immediately. It does not attempt to combine packets into coherent lines. For example,

              recordio sh -c 'cat /dev/fd/8 2>&1' > /dev/null

       could produce

            5135 > cat: /dev/fd/8: Bad file descriptor
            5135 > [EOF]

       or

            5135 > cat: +
            5135 > /dev/fd/8+
            5135 > : +
            5135 > Bad file descriptor
            5135 > [EOF]

       if the cat program prints several packets.

       recordio uses several lines for long packets to guarantee that each line is printed atomically.

       recordio runs as a child process of prog.  It exits when it sees the end of prog's output.

SEE ALSO
       tcpserver(1), tcprules(1), tcprulescheck(1), argv0(1), fixcrio(1), rblsmtpd(1), tcpclient(1), who@(1), date@(1), finger@(1), http@(1), tcp‐
       cat(1), mconnect(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                       recordio(1)
