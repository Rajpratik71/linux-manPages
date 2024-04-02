swapin(8)                                                     System Manager's Manual                                                    swapin(8)

NAME
       swapin - Count swapins by process. Uses bpftrace/eBPF.

SYNOPSIS
       swapin

DESCRIPTION
       This tool counts swapins by process, to show which process is affected by swapping (if swap devices are in use). This can explain a signif‐
       icant source of application latency, if it has began swapping due to memory pressure on the system.

       This works by tracing the swap_readpage() kernel function using dynamic instrumentation. This tool may need maintenance to keep working  if
       that function changes in later kernels.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Count swapins by process, showing per-second summaries.
              # swapin.bt

FIELDS
       1st    The process name.

       2nd    The process ID.

       3rd    The count of swapins during that interval.

OVERHEAD
       The rate of swapins should be low (bounded by swapin device IOPS), such that the overhead of this tool is expected to be negligible.

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
       swapon(8)

USER COMMANDS                                                       2019-07-05                                                           swapin(8)
