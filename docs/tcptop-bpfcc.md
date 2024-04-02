tcptop(8)                                                     System Manager's Manual                                                    tcptop(8)

NAME
       tcptop - Summarize TCP send/recv throughput by host. Top for TCP.

SYNOPSIS
       tcptop [-h] [-C] [-S] [-p PID] [interval] [count]

DESCRIPTION
       This is top for TCP sessions.

       This summarizes TCP send/receive Kbytes by host, and prints a summary that refreshes, along other system-wide metrics.

       This uses dynamic tracing of kernel TCP send/receive functions, and will need to be updated to match kernel changes.

       The  traced  TCP functions are usually called at a lower rate than per-packet functions, and therefore have lower overhead. The traced data
       is summarized in-kernel using a BPF map to further reduce overhead. At very high TCP event rates, the overhead may still be measurable. See
       the OVERHEAD section for more details.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print USAGE message.

       -C     Don't clear the screen.

       -S     Don't print the system summary line (load averages).

       -p PID Trace this PID only.

       interval
              Interval between updates, seconds (default 1).

       count  Number of interval summaries (default is many).

EXAMPLES
       Summarize TCP throughput by active sessions, 1 second refresh:
              # tcptop

       Don't clear the screen (rolling output), and 5 second summaries:
              # tcptop -C 5

       Trace PID 181 only, and don't clear the screen:
              # tcptop -Cp 181

FIELDS
       loadavg:
              The contents of /proc/loadavg

       PID    Process ID.

       COMM   Process name.

       LADDR  Local address (IPv4), and TCP port

       RADDR  Remote address (IPv4), and TCP port

       LADDR6 Source address (IPv6), and TCP port

       RADDR6 Destination address (IPv6), and TCP port

       RX_KB  Received Kbytes

       TX_KB  Transmitted Kbytes

OVERHEAD
       This  traces  all  send/receives  in TCP, high in the TCP/IP stack (close to the application) which are usually called at a lower rate than
       per-packet functions, lowering overhead. It also summarizes data in-kernel to further reduce overhead. These techniques help, but there may
       still be measurable overhead at high send/receive rates, eg, ~13% of one CPU at 100k events/sec.  use funccount to count the kprobes in the
       tool to find out this rate, as the overhead is relative to the rate. Some sample production servers tested found total TCP event  rates  of
       4k  to  15k  per  second,  and  the  CPU overhead at these rates ranged from 0.5% to 2.0% of one CPU. If your send/receive rate is low (eg,
       <1000/sec) then the overhead is expected to be negligible; Test in a lab environment first.

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

INSPIRATION
       top(1) by William LeFebvre

SEE ALSO
       tcpconnect(8), tcpaccept(8)

USER COMMANDS                                                       2016-09-13                                                           tcptop(8)
