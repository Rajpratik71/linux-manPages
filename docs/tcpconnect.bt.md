tcpconnect(8)                                                 System Manager's Manual                                                tcpconnect(8)

NAME
       tcpconnect.bt - Trace TCP active connections (connect()). Uses Linux bpftrace/eBPF

SYNOPSIS
       tcpconnect.bt

DESCRIPTION
       This  tool  traces  active  TCP connections (eg, via a connect() syscall; accept() are passive connections). This can be useful for general
       troubleshooting to see what connections are initiated by the local server.

       All connection attempts are traced, even if they ultimately fail.

       This works by tracing the kernel tcp_v4_connect() and tcp_v6_connect() functions using dynamic tracing, and will need updating to match any
       changes to these functions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace all active TCP connections:
              # tcpconnect.bt

       FIELDS

       TIME(s)
              Time of the call, in HH:MM:SS format.

       PID    Process ID

       COMM   Process name

       SADDR  Source IP address.

       SPORT  Source port.

       DADDR  Destination IP address.

       DPORT  Destination port

OVERHEAD
       This traces the kernel tcp_v[46]_connect functions and prints output for each event. As the rate of this is generally expected to be low (<
       1000/s), the overhead is also expected to be negligible. If you have an application that is calling a high rate of connects()s, such  as  a
       proxy server, then test and understand this overhead before use.

SOURCE
       This is from bpftrace

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

       This is a bpftrace version of the bcc tool of the same name. The bcc tool may provide more options and customizations.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg, adapted for bpftrace by Dale Hamel

SEE ALSO
       tcpaccept(8), funccount(8), tcpdump(8)

USER COMMANDS                                                       2018-11-24                                                       tcpconnect(8)
