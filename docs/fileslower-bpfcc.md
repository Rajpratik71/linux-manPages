fileslower(8)                                                 System Manager's Manual                                                fileslower(8)

NAME
       fileslower - Trace slow synchronous file reads and writes.

SYNOPSIS
       fileslower [-h] [-p PID] [-a] [min_ms]

DESCRIPTION
       This  script  uses  kernel dynamic tracing of synchronous reads and writes at the VFS interface, to identify slow file reads and writes for
       any file system.

       This version traces __vfs_read() and __vfs_write() and only showing synchronous I/O (the path to new_sync_read() and new_sync_write()), and
       I/O  with  filenames.  This approach provides a view of just two file system request types: file reads and writes. There are typically many
       others: asynchronous I/O, directory operations, file handle operations, file open()s, fflush(), etc.

       WARNING: See the OVERHEAD section.

       By default, a minimum millisecond threshold of 10 is used.

       Since this works by tracing various kernel __vfs_*() functions using dynamic tracing, it will need updating to match any changes  to  these
       functions. A future version should switch to using FS tracepoints instead.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -p PID Trace this PID only.

       -a     Include non-regular file types in output (sockets, FIFOs, etc).

       min_ms Minimum I/O latency (duration) to trace, in milliseconds. Default is 10 ms.

EXAMPLES
       Trace synchronous file reads and writes slower than 10 ms:
              # fileslower

       Trace slower than 1 ms:
              # fileslower 1

       Trace slower than 1 ms, for PID 181 only:
              # fileslower -p 181 1

FIELDS
       TIME(s)
              Time of I/O completion since the first I/O seen, in seconds.

       COMM   Process name.

       PID    Process ID.

       D      Direction of I/O. R == read, W == write.

       BYTES  Size of I/O, in bytes.

       LAT(ms)
              Latency (duration) of I/O, measured from when the application issued it to VFS to when it completed. This time is inclusive of block
              device I/O, file system CPU cycles, file system locks, run queue latency, etc. It's a more accurate measure of the latency  suffered
              by applications performing file system I/O, than to measure this down at the block device interface.

       FILENAME
              A cached kernel file name (comes from dentry->d_name.name).

OVERHEAD
       Depending  on  the  frequency of application reads and writes, overhead can become severe, in the worst case slowing applications by 2x. In
       the best case, the overhead is negligible. Hopefully for real world workloads the overhead is often at the lower end  of  the  spectrum  --
       test  before  use. The reason for high overhead is that this traces VFS reads and writes, which includes FS cache reads and writes, and can
       exceed one million events per second if the application is I/O heavy. While the instrumentation is extremely lightweight, and uses  in-ker‐
       nel eBPF maps for efficient timing and filtering, multiply that cost by one million events per second and that cost becomes a million times
       worse. You can get an idea of the possible cost by just counting the instrumented events using the bcc funccount tool, eg:

       # ./funccount.py -i 1 -r '^__vfs_(read|write)$'

       This also costs overhead, but is somewhat less than fileslower.

       If the overhead is prohibitive for your workload, I'd recommend moving down-stack a little from VFS into the file system  functions  (ext4,
       xfs, etc).  Look for updates to bcc for specific file system tools that do this. The advantage of a per-file system approach is that we can
       trace post-cache, greatly reducing events and overhead. The disadvantage is needing custom tracing approaches for each different file  sys‐
       tem (whereas VFS is generic).

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
       biosnoop(8), funccount(8)

USER COMMANDS                                                       2016-02-07                                                       fileslower(8)
