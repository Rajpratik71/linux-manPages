btrfsdist(8)                                                  System Manager's Manual                                                 btrfsdist(8)

NAME
       btrfsdist - Summarize btrfs operation latency. Uses Linux eBPF/bcc.

SYNOPSIS
       btrfsdist [-h] [-T] [-N] [-d] [interval] [count]

DESCRIPTION
       This tool summarizes time (latency) spent in common btrfs file operations: reads, writes, opens, and syncs, and presents it as a power-of-2
       histogram. It uses an in-kernel eBPF map to store the histogram for efficiency.

       Since this works by tracing the btrfs_file_operations interface functions, it will need updating to match any changes to these functions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -T     Don't include timestamps on interval output.

       -m     Output in milliseconds.

       -p PID Trace this PID only.

EXAMPLES
       Trace btrfs operation time, and print a summary on Ctrl-C:
              # btrfsdist

       Trace PID 181 only:
              # btrfsdist -p 181

       Print 1 second summaries, 10 times:
              # btrfsdist 1 10

       1 second summaries, printed in milliseconds
              # btrfsdist -m 1

FIELDS
       msecs  Range of milliseconds for this bucket.

       usecs  Range of microseconds for this bucket.

       count  Number of operations in this time range.

       distribution
              ASCII representation of the distribution (the count column).

OVERHEAD
       This adds low-overhead instrumentation to btrfs writes and fsyncs, as well as all system reads and opens (due to the current implementation
       of  the  btrfs_file_operations  interface).  Particularly,  all reads and writes from the file system cache will incur extra overhead while
       tracing. Such reads and writes can be very frequent (depending on the workload; eg, 1M/sec), at which point the overhead of this  tool  may
       become noticeable.  Measure and quantify before use.

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
       btrfsslower(8)

USER COMMANDS                                                       2016-02-15                                                        btrfsdist(8)
