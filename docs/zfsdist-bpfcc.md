zfsdist(8)                                                    System Manager's Manual                                                   zfsdist(8)

NAME
       zfsdist - Summarize ZFS operation latency. Uses Linux eBPF/bcc.

SYNOPSIS
       zfsdist [-h] [-T] [-m] [-p PID] [interval] [count]

DESCRIPTION
       This  tool  summarizes time (latency) spent in common ZFS file operations: reads, writes, opens, and syncs, and presents it as a power-of-2
       histogram. It uses an in-kernel eBPF map to store the histogram for efficiency.

       This uses kernel dynamic tracing of the ZPL interface (ZFS POSIX Layer), and will need updates to match any changes to this interface.

       This is intended to work with the ZFS on Linux project:
              http://zfsonlinux.org

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -T     Don't include timestamps on interval output.

       -m     Output in milliseconds.

       -p PID Trace this PID only.

EXAMPLES
       Trace ZFS operation time, and print a summary on Ctrl-C:
              # zfsdist

       Trace PID 181 only:
              # zfsdist -p 181

       Print 1 second summaries, 10 times:
              # zfsdist 1 10

       1 second summaries, printed in milliseconds
              # zfsdist -m 1

FIELDS
       msecs  Range of milliseconds for this bucket.

       usecs  Range of microseconds for this bucket.

       count  Number of operations in this time range.

       distribution
              ASCII representation of the distribution (the count column).

OVERHEAD
       This adds low-overhead instrumentation to these ZFS operations, including reads and writes from the  file  system  cache.  Such  reads  and
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
       zfssnoop(8)

USER COMMANDS                                                       2016-02-12                                                          zfsdist(8)
