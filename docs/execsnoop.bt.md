execsnoop(8)                                                  System Manager's Manual                                                 execsnoop(8)

NAME
       execsnoop.bt - Trace new processes via exec() syscalls. Uses bpftrace/eBPF.

SYNOPSIS
       execsnoop.bt

DESCRIPTION
       This traces when processes call exec() (execve()). It is handy for identifying new processes created via the usual fork()->exec() sequence.
       Note that the return value is not currently traced, so the exec() may have failed.

       This tool is useful for debugging shell scripts, including application startup.  It is also useful for identifying a  type  of  performance
       issue: a flood of short-lived processes, that end quickly and aren't readily visible in top(1).

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace all new processes calling execve():
              # execsnoop.bt

FIELDS
       TIME   Time of the exec() call, in milliseconds since program start.

       PID    Process ID

       ARGS   Process name and arguments (16 word maximum).

OVERHEAD
       This  traces  the  execve() tracepoint and prints output for each event. As the rate of this is generally expected to be low (< 100/s), the
       overhead is also expected to be negligible. If you have an application that is spawning a high rate of new processes for  a  reason  (large
       build process), this could cause a small amount of overhead: test and understand overhead before use.

SOURCE
       This is from bpftrace.

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

       This is a bpftrace version of the bcc tool of the same name. The bcc tool provides more fields and options to customize the output.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       opensnoop(8)

USER COMMANDS                                                       2018-09-11                                                        execsnoop(8)
