killsnoop(8)                                                  System Manager's Manual                                                 killsnoop(8)

NAME
       killsnoop.bt - Trace signals issued by the kill() syscall. Uses bpftrace/eBPF.

SYNOPSIS
       killsnoop.bt

DESCRIPTION
       killsnoop  traces  the kill() syscall, to show signals sent via this method. This may be useful to troubleshoot failing applications, where
       an unknown mechanism is sending signals.

       This works by tracing the kill() syscall tracepoints.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace all kill() syscalls:
              # killsnoop.bt

FIELDS
       TIME   Time of the kill call.

       PID    Source process ID

       COMM   Source process name

       SIG    Signal number. See signal(7).

       TPID   Target process ID

       RES    Result. 0 == success, a negative value (of the error code) for failure.

OVERHEAD
       This traces the kernel kill function and prints output for each event. As the rate of this is generally expected to be low (<  100/s),  the
       overhead  is  also  expected to be negligible. If you have an application that is calling a very high rate of kill()s for some reason, then
       test and understand overhead before use.

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
       opensnoop(8)

USER COMMANDS                                                       2018-09-07                                                        killsnoop(8)
