nfsslower(8)                                                  System Manager's Manual                                                 nfsslower(8)

NAME
       nfsslower - Trace slow NFS file operations, with per-event details.

SYNOPSIS
       nfsslower [-h] [-j] [-p PID] [min_ms]

DESCRIPTION
       This  tool traces common NFSv3 & NFSv4 file operations: reads, writes, opens, and getattrs. It measures the time spent in these operations,
       and prints details for each that exceeded a threshold.

       WARNING: See the OVERHEAD section.

       By default, a minimum millisecond threshold of 10 is used. If a threshold of 0 is used, all events are printed (warning: verbose).

       Since this works by tracing the nfs_file_operations interface functions, it will need updating to match any changes to these functions.

       This tool uses kprobes to instrument the kernel for entry and exit information, in the future a preferred way would be to use  tracepoints.
       Currently  there aren't any tracepoints available for nfs_read_file, nfs_write_file and nfs_open_file, nfs_getattr does have entry and exit
       tracepoints but we chose to use kprobes for consistency

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -p PID Trace this PID only.

       -j     Trace output in CSV format.

       min_ms Minimum I/O latency (duration) to trace, in milliseconds. Default is 10 ms.

EXAMPLES
       Trace synchronous file reads and writes slower than 10 ms:
              # nfsslower

       Trace slower than 1 ms:
              # nfsslower 1

       Trace slower than 1 ms, and output just the fields in parsable format (CSV):
              # nfsslower -j 1

       Trace all file reads and writes (warning: the output will be verbose):
              # nfsslower 0

       Trace slower than 1 ms, for PID 181 only:
              # nfsslower -p 181 1

FIELDS
       TIME(s)
              Time of I/O completion since the first I/O seen, in seconds.

       COMM   Process name.

       PID    Process ID.

       T      Type of operation. R == read, W == write, O == open, G == getattr.

       OFF_KB File offset for the I/O, in Kbytes.

       BYTES  Size of I/O, in bytes.

       LAT(ms)
              Latency (duration) of I/O, measured from when it was issued by VFS to the filesystem, to when it completed. This time  is  inclusive
              of  RPC  latency,  network latency, cache lookup, remote fileserver processing latency, etc.  Its a more accurate measure of the la‐
              tency suffered by applications performing NFS read/write calls to a fileserver.

       FILENAME
              A cached kernel file name (comes from dentry->d_name.name).

       ENDTIME_us
              Completion timestamp, microseconds (-j only).

       OFFSET_b
              File offset, bytes (-j only).

       LATENCY_us
              Latency (duration) of the I/O, in microseconds (-j only).

OVERHEAD
       This adds low-overhead instrumentation to NFS operations, including reads and writes from the file system cache. Such read, writes and par‐
       ticularly  getattrs  can  be  very  frequent  (depending on the workload; eg, 1M/sec), at which point the overhead of this tool (even if it
       prints no "slower" events) can begin to become significant. Measure and quantify before use. If this continues to be  a  problem,  consider
       switching  to  a tool that prints in-kernel summaries only. This tool has been tested with NFSv3 & NVSv4, but it might work with NFSv{1,2},
       since it is tracing the generic functions from nfs_file_operations.

       Note that the overhead of this tool should be less than fileslower(8), as this tool targets NFS functions only, and not all file read/write
       paths.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also  look  in  the  bcc distribution for a companion nfsslower_examples.txt file containing example usage, output, and commentary for this
       tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Samuel Nair

SEE ALSO
       biosnoop(8), funccount(8), fileslower(8)

USER COMMANDS                                                       2017-09-01                                                        nfsslower(8)
