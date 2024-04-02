xfsdist(8)                                                    System Manager's Manual                                                   xfsdist(8)

NAME
       xfsdist.bt - Summarize XFS operation latency. Uses bpftrace/eBPF.

SYNOPSIS
       xfsdist.bt

DESCRIPTION
       This  tool  summarizes time (latency) spent in common XFS file operations: reads, writes, opens, and syncs, and presents it as a power-of-2
       histogram. It uses an in-kernel eBPF map to store the histogram for efficiency.

       Since this works by tracing the xfs_file_operations interface functions, it will need updating to match any changes to these functions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace XFS operation time, and print a summary on Ctrl-C:
              # xfsdist.bt

FIELDS
       0th    The operation name (shown in "@[...]") is printed before each I/O histogram.

       1st, 2nd
              This is a range of latency, in microseconds (shown in "[...)" set notation).

       3rd    A column showing the count of operations in this range.

       4th    This is an ASCII histogram representing the count column.

OVERHEAD
       This adds low-overhead instrumentation to these XFS operations, including reads and writes from the  file  system  cache.  Such  reads  and
       writes  can be very frequent (depending on the workload; eg, 1M/sec), at which point the overhead of this tool may become noticeable.  Mea‐
       sure and quantify before use.

SOURCE
       This is from bpftrace.

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

       This is a bpftrace version of the bcc tool of the same name. The bcc tool may provide more options and customizations.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       biolatency(8)

USER COMMANDS                                                       2018-09-08                                                          xfsdist(8)
