tcpsynbl(8)                                                   System Manager's Manual                                                  tcpsynbl(8)

NAME
       tcpsynbl - Show the TCP SYN backlog as a histogram. Uses bpftrace/eBPF.

SYNOPSIS
       tcpsynbl

DESCRIPTION
       This  tool  shows the TCP SYN backlog size during SYN arrival as a histogram.  This lets you see how close your applications are to hitting
       the backlog limit and dropping SYNs (causing performance issues with SYN retransmits), and is a measure of workload  saturation.  The  his‐
       togram shown is measured at the time of SYN received, and a separate histogram is shown for each backlog limit.

       This  works  by  tracing  the tcp_v4_syn_recv_sock() and tcp_v6_syn_recv_sock() kernel functions using dynamic instrumentation. Since these
       functions may change in future kernels, this tool may need maintenance to keep working.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Show the TCP SYN backlog as a histogram.
              # tcpsynbl.bt

FIELDS
       backlog
              The backlog size when a SYN was received.

       count  The number of times this backlog size was encountered.

       distribution
              An ASCII visualization of the count column.

OVERHEAD
       Inbound SYNs should be relatively low compared to packets and other events, so the overhead of this tool is expected to be negligible.

SOURCE
       This tool originated from the book "BPF Performance Tools", published by Addison Wesley (2019):

              http://www.brendangregg.com/bpf-performance-tools-book.html

       See the book for more documentation on this tool.

       This version is in the bpftrace repository:

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

USER COMMANDS                                                       2019-07-03                                                         tcpsynbl(8)
