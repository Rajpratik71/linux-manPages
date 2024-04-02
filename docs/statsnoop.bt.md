statsnoop(8)                                                  System Manager's Manual                                                 statsnoop(8)

NAME
       statsnoop.bt - Trace stat() syscalls. Uses bpftrace/eBPF.

SYNOPSIS
       statsnoop.bt

DESCRIPTION
       statsnoop traces the stat() syscall, showing which processes are attempting to stat which files. This can be useful for determining the lo‐
       cation of config and log files, or for troubleshooting applications that are failing, specially on startup.

       This traces the tracepoints for statfs(), statx(), newstat(), and newlstat(). These aren't the only the stat syscalls: if you  are  missing
       activity, you may need to add more variants.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Trace all stat() syscalls:
              # statsnoop.bt

FIELDS
       PID Process ID

       TID    Thread ID

       COMM   Process name

       FD     File descriptor (if success), or -1 (if failed)

       ERR    Error number (see the system's errno.h)

       PATH   Stat path

OVERHEAD
       This  traces  the  stat  tracepoints  and prints output for each event. As the rate of this is generally expected to be low (< 1000/s), the
       overhead is also expected to be negligible. If you have an application that is calling a high rate of stat()s,  then  test  and  understand
       overhead before use.

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
       opensnoop(8), execsnoop(8)

USER COMMANDS                                                       2018-09-08                                                        statsnoop(8)
