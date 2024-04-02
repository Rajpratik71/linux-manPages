tcplife(8)                                                    System Manager's Manual                                                   tcplife(8)

NAME
       tcplife - Trace TCP session lifespans with connection details. Uses bpftrace/eBPF.

SYNOPSIS
       tcplife

DESCRIPTION
       This tool shows the lifespan of TCP sessions that open and close while tracing, and shows the duration and throughput statistics. For effi‐
       ciency, this tool only instruments TCP state changes, rather than all packets.

       This tool works by using the sock:inet_sock_set_state tracepoint, which was added in Linux 4.16.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF, bpftrace, and the sock:inet_sock_set_state tracepoint (Linux 4.16+).

EXAMPLES
       Show TCP sessions with details:
              # tcplife.bt

FIELDS
       PID    Process ID

       COMM   Process name

       LADDR  Local IP address.

       DADDR  Remote IP address.

       LPORT  Local port.

       RPORT  Remote port.

       TX_KB  Total transmitted Kbytes.

       RX_KB  Total received Kbytes.

       MS     Lifespan of the session, in milliseconds.

OVERHEAD
       This traces the kernel TCP set state function, which should be called much less often than send/receive tracing, and therefore  have  lower
       overhead.  The overhead of the tool is relative to the rate of new TCP sessions: if this is high, over 10,000 per second, then there may be
       noticeable overhead just to print out 10k lines of formatted output per second.

       You can find out the rate of new TCP sessions using "sar -n TCP 1", and adding the active/s and passive/s columns.

       As always, test and understand this tools overhead for your types of workloads before production use.

SOURCE
       This tool originated from BCC:

              https://github.com/iovisor/bcc

       The BCC version has many command line options for customizing the output.

       This bpftrace version originated from the book "BPF Performance Tools", published by Addison Wesley (2019):

              http://www.brendangregg.com/bpf-performance-tools-book.html

       See the book for more documentation on this tool.

       This bpftrace version is in the bpftrace repository:

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       tcptop(8)

USER COMMANDS                                                       2019-07-03                                                          tcplife(8)
