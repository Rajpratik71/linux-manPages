xfsslower(8)                                                  System Manager's Manual                                                 xfsslower(8)

NAME
       xfsslower - Trace slow xfs file operations, with per-event details.

SYNOPSIS
       xfsslower [-h] [-j] [-p PID] [min_ms]

DESCRIPTION
       This  tool  traces  common XFS file operations: reads, writes, opens, and syncs. It measures the time spent in these operations, and prints
       details for each that exceeded a threshold.

       WARNING: See the OVERHEAD section.

       By default, a minimum millisecond threshold of 10 is used. If a threshold of 0 is used, all events are printed (warning: verbose).

       Since this works by tracing the xfs_file_operations interface functions, it will need updating to match any changes to these functions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -p PID Trace this PID only.

       min_ms Minimum I/O latency (duration) to trace, in milliseconds. Default is 10 ms.

EXAMPLES
       Trace synchronous file reads and writes slower than 10 ms:
              # xfsslower

       Trace slower than 1 ms:
              # xfsslower 1

       Trace slower than 1 ms, and output just the fields in parsable format (csv):
              # xfsslower -j 1

       Trace all file reads and writes (warning: the output will be verbose):
              # xfsslower 0

       Trace slower than 1 ms, for PID 181 only:
              # xfsslower -p 181 1

FIELDS
       TIME(s)
              Time of I/O completion since the first I/O seen, in seconds.

       COMM   Process name.

       PID    Process ID.

       T      Type of operation. R == read, W == write, O == open, S == fsync.

       OFF_KB File offset for the I/O, in Kbytes.

       BYTES  Size of I/O, in bytes.

       LAT(ms)
              Latency (duration) of I/O, measured from when it was issued by VFS to the filesystem, to when it completed. This time  is  inclusive
              of  block device I/O, file system CPU cycles, file system locks, run queue latency, etc. It's a more accurate measure of the latency
              suffered by applications performing file system I/O, than to measure this down at the block device interface.

       FILENAME
              A cached kernel file name (comes from dentry->d_name.name).

       ENDTIME_us
              Completion timestamp, microseconds (-j only).

       OFFSET_b
              File offset, bytes (-j only).

       LATENCY_us
              Latency (duration) of the I/O, in microseconds (-j only).

OVERHEAD
       This adds low-overhead instrumentation to these XFS operations, including reads and writes from the  file  system  cache.  Such  reads  and
       writes  can  be  very  frequent  (depending  on  the  workload; eg, 1M/sec), at which point the overhead of this tool (even if it prints no
       "slower" events) can begin to become significant. Measure and quantify before use. If this continues to be a problem, consider switching to
       a tool that prints in-kernel summaries only.

       Note that the overhead of this tool should be less than fileslower(8), as this tool targets xfs functions only, and not all file read/write
       paths (which can include socket I/O).

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
       biosnoop(8), funccount(8), fileslower(8)

USER COMMANDS                                                       2016-02-11                                                        xfsslower(8)
