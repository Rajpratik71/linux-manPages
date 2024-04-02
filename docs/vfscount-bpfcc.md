vfscount(8)                                                   System Manager's Manual                                                  vfscount(8)

NAME
       vfscount - Count VFS calls ("vfs_*"). Uses Linux eBPF/bcc.

SYNOPSIS
       vfscount [duration]

DESCRIPTION
       This counts VFS calls. This can be useful for general workload characterization of these operations.

       This  works  by tracing all kernel functions beginning with "vfs_" using dynamic tracing. This may match more functions than you are inter‐
       ested in measuring: Edit the script to customize which functions to trace.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       duration
              duration of the trace in seconds.

EXAMPLES
       Count some VFS calls until Ctrl-C is hit:
              # vfscount

       Count some VFS calls in ten seconds
              # vfscount 10

FIELDS
       ADDR   Address of the instruction pointer that was traced (only useful if the FUNC column is suspicious and you would like to double  check
              the translation).

       FUNC   Kernel function name

       COUNT  Number of calls while tracing

OVERHEAD
       This traces kernel vfs functions and maintains in-kernel counts, which are asynchronously copied to user-space. While the rate of VFS oper‐
       ations can be very high (>1M/sec), this is a relatively efficient way to trace these events, and so the overhead is expected  to  be  small
       for  normal  workloads.  Measure in a test environment, and if overheads are an issue, edit the script to reduce the types of vfs functions
       traced (currently all beginning with "vfs_").

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
       vfsstat(8)

USER COMMANDS                                                       2015-08-18                                                         vfscount(8)
