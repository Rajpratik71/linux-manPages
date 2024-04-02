vfscount(8)                                                   System Manager's Manual                                                  vfscount(8)

NAME
       vfscount.bt - Count VFS calls ("vfs_*"). Uses bpftrace/eBPF.

SYNOPSIS
       vfscount.bt

DESCRIPTION
       This counts VFS calls. This can be useful for general workload characterization of these operations.

       This  works  by tracing all kernel functions beginning with "vfs_" using dynamic tracing. This may match more functions than you are inter‐
       ested in measuring: Edit the script to customize which functions to trace.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Count all VFS calls until Ctrl-C is hit:
              # vfscount.bt

FIELDS
       1st    Kernel function name (in @[])

       2nd    Number of calls while tracing

OVERHEAD
       This traces kernel vfs functions and maintains in-kernel counts, which are asynchronously copied to user-space. While the rate of VFS oper‐
       ations  can  be  very high (>1M/sec), this is a relatively efficient way to trace these events, and so the overhead is expected to be small
       for normal workloads.  Measure in a test environment, and if overheads are an issue, edit the script to reduce the types of  vfs  functions
       traced (currently all beginning with "vfs_").

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
       vfsstat.bt(8)

USER COMMANDS                                                       2018-09-06                                                         vfscount(8)
