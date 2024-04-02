tcpdrop(8)                                                    System Manager's Manual                                                   tcpdrop(8)

NAME
       tcpdrop - Trace kernel-based TCP packet drops with details. Uses Linux eBPF/bcc.

SYNOPSIS
       tcpdrop [-h]

DESCRIPTION
       This  tool traces TCP packets or segments that were dropped by the kernel, and shows details from the IP and TCP headers, the socket state,
       and the kernel stack trace. This is useful for debugging cases of high kernel drops, which can cause timer-based  retransmits  and  perfor‐
       mance issues.

       This tool works using dynamic tracing of the tcp_drop() kernel function, which requires a recent kernel version.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.  tcpdrop

FIELDS
       TIME   Time of the drop, in HH:MM:SS format.

       PID    Process  ID  that was on-CPU during the drop. This may be unrelated, as drops can occur on the receive interrupt and be unrelated to
              the PID that was interrupted.

       IP     IP address family (4 or 6)

       SADDR  Source IP address.

       SPORT  Source TCP port.

       DADDR  Destination IP address.

       DPORT  Destionation TCP port.

       STATE  TCP session state ("ESTABLISHED", etc).

       FLAGS  TCP flags ("SYN", etc).

OVERHEAD
       This traces the kernel tcp_drop() function, which should be low frequency, and therefore the overhead of this tool should be negligible.

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
       tcplife(8), tcpaccept(8), tcpconnect(8), tcptop(8)

USER COMMANDS                                                       2018-05-30                                                          tcpdrop(8)
