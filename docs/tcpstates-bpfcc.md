tcpstates(8)                                                  System Manager's Manual                                                 tcpstates(8)

NAME
       tcpstates - Trace TCP session state changes with durations. Uses Linux eBPF/bcc.

SYNOPSIS
       tcpstates [-h] [-T] [-t] [-w] [-s] [-D PORTS] [-L PORTS] [-Y]

DESCRIPTION
       This  tool  traces  TCP session state changes while tracing, and prints details including the duration in each state. This can help explain
       the latency of TCP connections: whether the time is spent in the ESTABLISHED state (data transfer),  or  initialization  state  (SYN_SENT),
       etc.

       This  tool works using the sock:inet_sock_set_state tracepoint, which was added to Linux 4.16. Linux 4.16 also included extra state transi‐
       tions so that all TCP transitions could be observed by this tracepoint.

       Only TCP state changes are traced, so it is expected that the overhead of this tool is much lower than typical send/receive tracing.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc, and the sock:inet_sock_set_state tracepoint.

OPTIONS
       -h     Print usage message.

       -s     Comma separated values output (parseable).

       -t     Include a timestamp column (seconds).

       -T     Include a time column (HH:MM:SS).

       -w     Wide column output (fits IPv6 addresses).

       -L PORTS
              Comma-separated list of local ports to trace (filtered in-kernel).

       -D PORTS
              Comma-separated list of destination ports to trace (filtered in-kernel).

       -Y     Log session state changes to the systemd journal.

EXAMPLES
       Trace all TCP sessions, and show all state changes:
              # tcpstates

       Include a timestamp column, and wide column output:
              # tcpstates -tw

       Trace connections to local ports 80 and 81 only:
              # tcpstates -L 80,81

       Trace connections to remote port 80 only:
              # tcpstates -D 80

FIELDS
       TIME   Time of the change, in HH:MM:SS format.

       TIME(s)
              Time of the change, in seconds.

       C-PID  The current on-CPU process ID. This may show the process that owns the TCP session if  the  state  change  executes  in  synchronous
              process context, else it is likely to show the kernel (asynchronous state change).

       C-COMM The  current  on-CPU  process  name. This may show the process that owns the TCP session if the state change executes in synchronous
              process context, else it is likely to show the kernel (asynchronous state change).

       IP     IP address family (4 or 6)

       LADDR  Local IP address.

       RADDR  Remote IP address.

       LPORT  Local port.

       RPORT  Remote port.

       OLDSTATE
              Previous TCP state.

       NEWSTATE
              New TCP state.

       MS     Duration of this state.

OVERHEAD
       This traces the kernel TCP set state function, which should be called much less often than send/receive tracing, and therefore  have  lower
       overhead.  The overhead of the tool is relative to the rate of new TCP sessions: if this is high, over 10,000 per second, then there may be
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
       tcpaccept(8), tcpconnect(8), tcptop(8), tcplife(8)

USER COMMANDS                                                       2018-03-20                                                        tcpstates(8)
