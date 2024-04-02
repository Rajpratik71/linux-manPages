filetop(8)                                                    System Manager's Manual                                                   filetop(8)

NAME
       filetop - File reads and writes by filename and process. Top for files.

SYNOPSIS
       filetop [-h] [-C] [-r MAXROWS] [-s {reads,writes,rbytes,wbytes}] [-p PID] [interval] [count]

DESCRIPTION
       This is top for files.

       This traces file reads and writes, and prints a per-file summary every interval (by default, 1 second). By default the summary is sorted on
       the highest read throughput (Kbytes). Sorting order can be changed via -s option. By default only IO on regular files is shown. The -a  op‐
       tion will list all file types (sokets, FIFOs, etc).

       This uses in-kernel eBPF maps to store per process summaries for efficiency.

       This script works by tracing the __vfs_read() and __vfs_write() functions using kernel dynamic tracing, which instruments explicit read and
       write calls. If files are read or written using another means (eg, via mmap()), then they will not be visible using this tool.  Also,  this
       tool will need updating to match any code changes to those vfs functions.

       This should be useful for file system workload characterization when analyzing the performance of applications.

       Note  that  tracing  VFS level reads and writes can be a frequent activity, and this tool can begin to cost measurable overhead at high I/O
       rates.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -a     Include non-regular file types (sockets, FIFOs, etc).

       -C     Don't clear the screen.

       -r MAXROWS
              Maximum number of rows to print. Default is 20.

       -s {reads,writes,rbytes,wbytes}
              Sort column. Default is rbytes (read throughput).

       -p PID Trace this PID only.

       interval
              Interval between updates, seconds.

       count  Number of interval summaries.

EXAMPLES
       Summarize block device I/O by process, 1 second screen refresh:
              # filetop

       Don't clear the screen, and top 8 rows only:
              # filetop -Cr 8

       5 second summaries, 10 times only:
              # filetop 5 10

FIELDS
       loadavg:
              The contents of /proc/loadavg

       PID    Process ID.

       COMM   Process name.

       READS  Count of reads during interval.

       WRITES Count of writes during interval.

       R_Kb   Total read Kbytes during interval.

       W_Kb   Total write Kbytes during interval.

       T      Type of file: R == regular, S == socket, O == other (pipe, etc).

       FILE   Filename.

OVERHEAD
       Depending on the frequency of application reads and writes, overhead can become significant, in the worst case slowing applications by over
       50%.  Hopefully  for  real world workloads the overhead is much less -- test before use. The reason for the high overhead is that VFS reads
       and writes can be a frequent event, and despite the eBPF overhead being very small per event, if you multiply this small overhead by a mil‐
       lion  events  per  second,  it  becomes a million times worse. Literally. You can gauge the number of reads and writes using the vfsstat(8)
       tool, also from bcc.

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
       vfsstat(8), vfscount(8), fileslower(8)

USER COMMANDS                                                       2016-02-08                                                          filetop(8)
