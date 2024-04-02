tcpconnlat(8)                                                 System Manager's Manual                                                tcpconnlat(8)

NAME
       tcpconnlat - Trace TCP active connection latency. Uses Linux eBPF/bcc.

SYNOPSIS
       tcpconnlat [-h] [-t] [-p PID] [-v] [min_ms]

DESCRIPTION
       This tool traces active TCP connections (eg, via a connect() syscall), and shows the latency (time) for the connection as measured locally:
       the time from SYN sent to the response packet.  This is a useful performance metric that typically spans kernel TCP/IP processing  and  the
       network round trip time (not application runtime).

       All connection attempts are traced, even if they ultimately fail (RST packet in response).

       This  tool works by use of kernel dynamic tracing of TCP/IP functions, and will need updating to match any changes to these functions. This
       tool should be updated in the future to use static tracepoints, once they are available.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -t     Include a timestamp column.

       -p PID Trace this process ID only (filtered in-kernel).

       -v     Print the resulting BPF program, for debugging purposes.

       min_ms Minimum duration to trace, in milliseconds.

EXAMPLES
       Trace all active TCP connections, and show connection latency (SYN->response round trip):
              # tcpconnlat

       Include timestamps:
              # tcpconnlat -t

       Trace PID 181 only:
              # tcpconnlat -p 181

       Trace connects with latency longer than 10 ms:
              # tcpconnlat 10

       Print the BPF program:
              # tcpconnlat -v

FIELDS
       TIME(s)
              Time of the response packet, in seconds.

       PID    Process ID that initiated the connection.

       COMM   Process name that initiated the connection.

       IP     IP address family (4 or 6).

       SADDR  Source IP address.

       DADDR  Destination IP address.

       DPORT  Destination port

       LAT(ms)
              The time from when a TCP connect was issued (measured in-kernel) to when a response packet was received for this connection (can  be
              SYN,ACK,  or  RST, etc).  This time spans kernel to kernel latency, involving kernel TCP/IP processing and the network round trip in
              between. This typically does not include time spent by the application processing the new connection.

OVERHEAD
       This traces the kernel tcp_v[46]_connect functions and prints output for each event. As the rate of this is generally expected to be low (<
       1000/s),  the  overhead is also expected to be negligible. If you have an application that is calling a high rate of connects()s, such as a
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
       tcpconnect(8), tcpaccept(8), funccount(8), tcpdump(8)

USER COMMANDS                                                       2016-02-19                                                       tcpconnlat(8)
