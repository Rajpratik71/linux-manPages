vfsstat(8)                                                    System Manager's Manual                                                   vfsstat(8)

NAME
       vfsstat.bt - Count key VFS calls. Uses bpftrace/eBPF.

SYNOPSIS
       vfsstat.bt

DESCRIPTION
       This  traces  some  common VFS calls and prints per-second summaries. This can be useful for general workload characterization, and looking
       for patterns in operation usage over time.

       This works by tracing some kernel vfs functions using dynamic tracing, and will need updating to match any changes to these functions. Edit
       the script to customize which functions are traced. Also see vfscount, which is more easily customized to trace multiple functions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Count some VFS calls, printing per-second summaries until Ctrl-C is hit:
              # vfsstat.bt

FIELDS
       HH:MM:SS
              Each output summary is prefixed by the time of printing in "HH:MM:SS" format.

       1st    Kernel function name (in @[])

       2nd    Number of calls while tracing

OVERHEAD
       This  traces  various kernel vfs functions and maintains in-kernel counts, which are asynchronously copied to user-space. While the rate of
       VFS operations can be very high (>1M/sec), this is a relatively efficient way to trace these events, and so the overhead is expected to  be
       small for normal workloads.  Measure in a test environment.

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
       vfscount.bt(8)

USER COMMANDS                                                       2018-09-06                                                          vfsstat(8)
