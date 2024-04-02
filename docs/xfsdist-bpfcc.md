xfsdist(8)                                                    System Manager's Manual                                                   xfsdist(8)

NAME
       xfsdist - Summarize XFS operation latency. Uses Linux eBPF/bcc.

SYNOPSIS
       xfsdist [-h] [-T] [-m] [-p PID] [interval] [count]

DESCRIPTION
       This  tool  summarizes time (latency) spent in common XFS file operations: reads, writes, opens, and syncs, and presents it as a power-of-2
       histogram. It uses an in-kernel eBPF map to store the histogram for efficiency.

       Since this works by tracing the xfs_file_operations interface functions, it will need updating to match any changes to these functions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -T     Don't include timestamps on interval output.

       -m     Output in milliseconds.

       -p PID Trace this PID only.

EXAMPLES
       Trace XFS operation time, and print a summary on Ctrl-C:
              # xfsdist

       Trace PID 181 only:
              # xfsdist -p 181

       Print 1 second summaries, 10 times:
              # xfsdist 1 10

       1 second summaries, printed in milliseconds
              # xfsdist -m 1

FIELDS
       msecs  Range of milliseconds for this bucket.

       usecs  Range of microseconds for this bucket.

       count  Number of operations in this time range.

       distribution
              ASCII representation of the distribution (the count column).

OVERHEAD
       This adds low-overhead instrumentation to these XFS operations, including reads and writes from the  file  system  cache.  Such  reads  and
       writes  can be very frequent (depending on the workload; eg, 1M/sec), at which point the overhead of this tool may become noticeable.  Mea‐
       sure and quantify before use.

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
       xfssnoop(8)

USER COMMANDS                                                       2016-02-12                                                          xfsdist(8)
