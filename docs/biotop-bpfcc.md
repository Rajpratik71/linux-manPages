biotop(8)                                                     System Manager's Manual                                                    biotop(8)

NAME
       biotop - Block device (disk) I/O by process top.

SYNOPSIS
       biotop [-h] [-C] [-r MAXROWS] [interval] [count]

DESCRIPTION
       This is top for disks.

       This  traces  block device I/O (disk I/O), and prints a per-process summary every interval (by default, 1 second). The summary is sorted on
       the top disk consumers by throughput (Kbytes). The PID and process name shown are measured from when the I/O was first created, which  usu‐
       ally identifies the responsible process.

       For  efficiency,  this uses in-kernel eBPF maps to cache process details (PID and comm) by I/O request, as well as a starting timestamp for
       calculating I/O latency, and the final summary.

       This works by tracing various kernel blk_*() functions using dynamic tracing, and will need updating to match any changes  to  these  func‐
       tions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -C     Don't clear the screen.

       -r MAXROWS
              Maximum number of rows to print. Default is 20.

       interval
              Interval between updates, seconds.

       count  Number of interval summaries.

EXAMPLES
       Summarize block device I/O by process, 1 second screen refresh:
              # biotop

       Don't clear the screen:
              # biotop -C

       5 second summaries, 10 times only:
              # biotop 5 10

FIELDS
       loadavg:
              The contents of /proc/loadavg

       PID    Cached process ID, if present. This usually (but isn't guaranteed) to identify the responsible process for the I/O.

       COMM   Cached process name, if present. This usually (but isn't guaranteed) to identify the responsible process for the I/O.

       D      Direction: R == read, W == write. This is a simplification.

       MAJ    Major device number.

       MIN    Minor device number.

       DISK   Disk device name.

       I/O    Number of I/O during the interval.

       Kbytes Total Kbytes for these I/O, during the interval.

       AVGms  Average time for the I/O (latency) from the issue to the device, to its completion, in milliseconds.

OVERHEAD
       Since block device I/O usually has a relatively low frequency (< 10,000/s), the overhead for this tool is expected to be low or negligible.
       For high IOPS storage systems, test and quantify before use.

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
       biosnoop(8), biolatency(8), iostat(1)

USER COMMANDS                                                       2016-02-06                                                           biotop(8)
