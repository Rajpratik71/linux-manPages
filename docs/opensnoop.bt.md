opensnoop(8)                                                  System Manager's Manual                                                 opensnoop(8)

NAME
       opensnoop.bt - Trace open() syscalls. Uses bpftrace/eBPF.

SYNOPSIS
       opensnoop.bt

DESCRIPTION
       opensnoop traces the open() syscall, showing which processes are attempting to open which files. This can be useful for determining the lo‐
       cation of config and log files, or for troubleshooting applications that are failing, specially on startup.

       This works by tracing the open() syscall tracepoint.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Trace all open() syscalls:
              # opensnoop.bt

FIELDS
       PID Process ID

       TID    Thread ID

       COMM   Process name

       FD     File descriptor (if success), or -1 (if failed)

       ERR    Error number (see the system's errno.h)

       PATH   Open path

OVERHEAD
       This traces the open tracepoint and prints output for each event. As the rate of this is generally expected to be low (< 1000/s), the over‐
       head  is  also expected to be negligible. If you have an application that is calling a high rate of open()s, then test and understand over‐
       head before use.

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
       statsnoop(8), execsnoop(8)

USER COMMANDS                                                       2018-09-08                                                        opensnoop(8)
