tcplife(8)                                                    System Manager's Manual                                                   tcplife(8)

NAME
       tcplife - Trace TCP sessions and summarize lifespan. Uses Linux eBPF/bcc.

SYNOPSIS
       tcplife [-h] [-T] [-t] [-w] [-s] [-p PID] [-D PORTS] [-L PORTS]

DESCRIPTION
       This  tool  traces  TCP sessions that open and close while tracing, and prints a line of output to summarize each one. This includes the IP
       addresses, ports, duration, and throughput for the session. This is useful for workload characterisation and flow  accounting:  identifying
       what connections are happening, with the bytes transferred.

       This tool works using the sock:inet_sock_set_state tracepoint if it exists, added to Linux 4.16, and switches to using kernel dynamic trac‐
       ing for older kernels. Only TCP state changes are traced, so it is expected that the overhead of this  tool  is  much  lower  than  typical
       send/receive tracing.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -s     Comma separated values output (parseable).

       -t     Include a timestamp column (seconds).

       -T     Include a time column (HH:MM:SS).

       -w     Wide column output (fits IPv6 addresses).

       -p PID Trace this process ID only (filtered in-kernel).

       -L PORTS
              Comma-separated list of local ports to trace (filtered in-kernel).

       -D PORTS
              Comma-separated list of destination ports to trace (filtered in-kernel).

EXAMPLES
       Trace all TCP sessions, and summarize lifespan and throughput:
              # tcplife

       Include a timestamp column, and wide column output:
              # tcplife -tw

       Trace PID 181 only:
              # tcplife -p 181

       Trace connections to local ports 80 and 81 only:
              # tcplife -L 80,81

       Trace connections to remote port 80 only:
              # tcplife -D 80

FIELDS
       TIME   Time of the call, in HH:MM:SS format.

       TIME(s)
              Time of the call, in seconds.

       PID    Process ID

       COMM   Process name

       IP     IP address family (4 or 6)

       LADDR  Local IP address.

       RADDR  Remote IP address.

       LPORT  Local port.

       RPORT  Remote port.

       TX_KB  Total transmitted Kbytes.

       RX_KB  Total received Kbytes.

       MS     Lifespan of the session, in milliseconds.

OVERHEAD
       This  traces  the kernel TCP set state function, which should be called much less often than send/receive tracing, and therefore have lower
       overhead. The overhead of the tool is relative to the rate of new TCP sessions: if this is high, over 10,000 per second, then there may  be
       noticeable overhead just to print out 10k lines of formatted output per second.

       You can find out the rate of new TCP sessions using "sar -n TCP 1", and adding the active/s and passive/s columns.

       As always, test and understand this tools overhead for your types of workloads before production use.

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
       tcpaccept(8), tcpconnect(8), tcptop(8)

USER COMMANDS                                                       2016-10-19                                                          tcplife(8)
