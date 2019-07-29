tcpclient(1)                                                  General Commands Manual                                                 tcpclient(1)

NAME
       tcpclient - creates an outgoing TCP connection.

SYNOPSIS
       tcpclient [ opts ] host port prog

DESCRIPTION
       opts is a series of getopt-style options.  host is one argument.  port is one argument.  prog consists of one or more arguments.

       tcpclient attempts to connect to a TCP server. If it is successful, it runs prog, with descriptor 6 reading from the network and descriptor
       7 writing to the network. It also sets up several environment variables (see tcp-environ(5) ).

       The server's address is given by host and port.  port may be a name from /etc/services or a number.  host may be 0, referring to the  local
       machine, or a dotted-decimal IP address, or a host name; it is fed through qualification using dns_ip4_qualify.

       If the server has several IP addresses, tcpclient tries each address in turn.

OPTIONS
       General options:

       -q     Quiet. Do not print error messages.

       -Q     (Default.) Print error messages.

       -v     Verbose. Print error messages and status messages.

       Connection options:

       -T x+y Give up on the connection attempt after x+y seconds. Default: 2+58. When a host has several IP addresses, tcpclient tries to connect
              to the first IP address, waits x seconds, tries to connect to the second IP address, waits x seconds, etc.;  then  it  retries  each
              address  that  timed  out,  waiting y seconds per address. You may omit +y to skip the second try. Before version 0.88, tcpclient(1)
              will use only x (default: 60).

       -i localip
              Use localip as the IP address for the local side of the connection; quit if localip is not available. Normally  tcpclient  lets  the
              operating system choose an address.

       -p localport
              Use  localport as the TCP port for the local side of the connection; quit if localport is not available. Normally tcpclient lets the
              operating system choose a port.

       -d     Delay sending data for a fraction of a second whenever the remote host is responding slowly. This is currently the default,  but  it
              may not be in the future; if you want it, set it explicitly.

       -D     Never delay sending data; enable TCP_NODELAY.

       Data-gathering options:

       -h     (Default.) Look up the remote host name in DNS to set the environment variable $TCPREMOTEHOST.

       -H     Do not look up the remote host name in DNS; remove the environment variable $TCPREMOTEHOST.

       -l localname
              Do  not  look up the local host name in DNS; use localname for the environment variable $TCPLOCALHOST. A common choice for localname
              is 0.

       -r     (Default.) Attempt to obtain $TCPREMOTEINFO from the remote host.

       -R     Do not attempt to obtain $TCPREMOTEINFO from the remote host.

       -t n   Give up on the $TCPREMOTEINFO connection attempt after n seconds. Default: 26.

SEE ALSO
       tcpserver(1), tcprules(1), tcprulescheck(1), argv0(1), fixcrio(1), recordio(1), rblsmtpd(1), who@(1), date@(1), finger@(1), http@(1),  tcp‐
       cat(1), mconnect(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                      tcpclient(1)
