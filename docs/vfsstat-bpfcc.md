vfsstat(8)                                                    System Manager's Manual                                                   vfsstat(8)

NAME
       vfsstat - Statistics for some common VFS calls. Uses Linux eBPF/bcc.

SYNOPSIS
       vfsstat [interval [count]]

DESCRIPTION
       This  traces  some  common VFS calls and prints per-second summaries. This can be useful for general workload characterization, and looking
       for patterns in operation usage over time.

       This works by tracing some kernel vfs functions using dynamic tracing, and will need updating to match any changes to these functions. Edit
       the script to customize which functions are traced. Also see vfscount, which is more easily customized to trace multiple functions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Print summaries each second:
              # vfsstat

       Print output every five seconds, three times:
              # vfsstat 5 3

FIELDS
       READ/s Number of vfs_read() calls as a per-second average.

       WRITE/s
              Number of vfs_write() calls as a per-second average.

       CREATE/s
              Number of vfs_create() calls as a per-second average.

       OPEN/s Number of vfs_open() calls as a per-second average.

       FSYNC/s
              Number of vfs_fsync() calls as a per-second average.

OVERHEAD
       This  traces  various kernel vfs functions and maintains in-kernel counts, which are asynchronously copied to user-space. While the rate of
       VFS operations can be very high (>1M/sec), this is a relatively efficient way to trace these events, and so the overhead is expected to  be
       small for normal workloads.  Measure in a test environment.

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
       vfscount(8)

USER COMMANDS                                                       2015-08-18                                                          vfsstat(8)
