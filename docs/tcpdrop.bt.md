tcpdrop(8)                                                    System Manager's Manual                                                   tcpdrop(8)

NAME
       tcpdrop.bt - Trace kernel-based TCP packet drops with details. Uses Linux bpftrace/eBPF

SYNOPSIS
       tcpdrop.bt

DESCRIPTION
       This  tool traces TCP packets or segments that were dropped by the kernel, and shows details from the IP and TCP headers, the socket state,
       and the kernel stack trace. This is useful for debugging cases of high kernel drops, which can cause timer-based  retransmits  and  perfor‐
       mance issues.

       This tool works using dynamic tracing of the tcp_drop() kernel function, which requires a recent kernel version.

       This tool is limited to ipv4, and cannot parse tcpflags as bpftrace currently cannot parse socket buffers in the way that bcc can.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace all tcp drops:
              # tcpdrop.bt

       FIELDS

       TIME   Time of the call, in HH:MM:SS format.

       PID    Process  ID  that was on-CPU during the drop. This may be unrelated, as drops can occur on the receive interrupt and be unrelated to
              the PID that was interrupted.

       COMM   Process name

       SADDR  Source IP address.

       SPORT  Source TCP port.

       DADDR  Destination IP address.

       DPORT  Destionation TCP port.

       STATE  TCP session state ("ESTABLISHED", etc).

OVERHEAD
       This traces the kernel tcp_drop() function, which should be low frequency, and therefore the overhead of this tool should be negligible.

       As always, test and understand this tools overhead for your types of workloads before production use.

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
       tcplife(8), tcpaccept(8), tcpconnect(8), tcptop(8)

USER COMMANDS                                                       2018-11-24                                                          tcpdrop(8)
