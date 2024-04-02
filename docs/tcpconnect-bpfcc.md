tcpconnect(8)                                                 System Manager's Manual                                                tcpconnect(8)

NAME
       tcpconnect - Trace TCP active connections (connect()). Uses Linux eBPF/bcc.

SYNOPSIS
       tcpconnect [-h] [-c] [-t] [-x] [-p PID] [-P PORT]

DESCRIPTION
       This  tool  traces  active  TCP connections (eg, via a connect() syscall; accept() are passive connections). This can be useful for general
       troubleshooting to see what connections are initiated by the local server.

       All connection attempts are traced, even if they ultimately fail.

       This works by tracing the kernel tcp_v4_connect() and tcp_v6_connect() functions using dynamic tracing, and will need updating to match any
       changes to these functions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -t     Include a timestamp column.

       -c     Count connects per src ip and dest ip/port.

       -p PID Trace this process ID only (filtered in-kernel).

       -P PORT
              Comma-separated list of destination ports to trace (filtered in-kernel).

EXAMPLES
       -U     Include a UID column.

       -u UID Trace this UID only (filtered in-kernel).

       Trace all active TCP connections:
              # tcpconnect

       Trace all TCP connects, and include timestamps:
              # tcpconnect -t

       Trace PID 181 only:
              # tcpconnect -p 181

       Trace ports 80 and 81 only:
              # tcpconnect -P 80,81

       Trace all TCP connects, and include UID:
              # tcpconnect -U

       Trace UID 1000 only:
              # tcpconnect -u 1000

       Count connects per src ip and dest ip/port:
              # tcpconnect -c

FIELDS
       TIME(s)
              Time of the call, in seconds.

       UID    User ID

       PID    Process ID

       COMM   Process name

       IP     IP address family (4 or 6)

       SADDR  Source IP address.

       DADDR  Destination IP address.

       DPORT  Destination port

       CONNECTS
              Accumulated active connections since start.

OVERHEAD
       This traces the kernel tcp_v[46]_connect functions and prints output for each event. As the rate of this is generally expected to be low (<
       1000/s), the overhead is also expected to be negligible. If you have an application that is calling a high rate of connect()s,  such  as  a
       proxy server, then test and understand this overhead before use.

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
       tcpaccept(8), funccount(8), tcpdump(8)

USER COMMANDS                                                       2015-08-25                                                       tcpconnect(8)
