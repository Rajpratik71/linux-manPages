tcpaccept(8)                                                  System Manager's Manual                                                 tcpaccept(8)

NAME
       tcpaccept - Trace TCP passive connections (accept()). Uses Linux eBPF/bcc.

SYNOPSIS
       tcpaccept [-h] [-T] [-t] [-p PID] [-P PORTS]

DESCRIPTION
       This  tool  traces  passive TCP connections (eg, via an accept() syscall; connect() are active connections). This can be useful for general
       troubleshooting to see what new connections the local server is accepting.

       This uses dynamic tracing of the kernel inet_csk_accept() socket function (from tcp_prot.accept), and will need to  be  modified  to  match
       kernel changes.

       This  tool only traces successful TCP accept()s. Connection attempts to closed ports will not be shown (those can be traced via other func‐
       tions).

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -T     Include a time column on output (HH:MM:SS).

       -t     Include a timestamp column.

       -p PID Trace this process ID only (filtered in-kernel).

       -P PORTS
              Comma-separated list of local ports to trace (filtered in-kernel).

EXAMPLES
       Trace all passive TCP connections (accept()s):
              # tcpaccept

       Trace all TCP accepts, and include timestamps:
              # tcpaccept -t

       Trace connections to local ports 80 and 81 only:
              # tcpaccept -P 80,81

       Trace PID 181 only:
              # tcpaccept -p 181

FIELDS
       TIME   Time of the event, in HH:MM:SS format.

       TIME(s)
              Time of the event, in seconds.

       PID    Process ID

       COMM   Process name

       IP     IP address family (4 or 6)

       RADDR  Remote IP address.

       RPORT  Remote port

       LADDR  Local IP address.

       LPORT  Local port

OVERHEAD
       This traces the kernel inet_csk_accept function and prints output for each event.  The rate of this depends on your server application.  If
       it  is  a  web or proxy server accepting many tens of thousands of connections per second, then the overhead of this tool may be measurable
       (although, still a lot better than tracing every packet). If it is less than a thousand a second, then the overhead is expected to be  neg‐
       ligible. Test and understand this overhead before use.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       tcpconnect(8), funccount(8), tcpdump(8)

USER COMMANDS                                                       2019-03-08                                                        tcpaccept(8)
