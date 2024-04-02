pidpersec(8)                                                  System Manager's Manual                                                 pidpersec(8)

NAME
       pidpersec.bt - Count new processes (via fork()). Uses bpftrace/eBPF.

SYNOPSIS
       pidpersec.bt

DESCRIPTION
       pidpersec  shows  how  many  new  processes were created each second. There can be performance issues caused by many short-lived processes,
       which may not be visible in sampling tools like top(1). pidpersec provides one way to investigate this behavior.

       This works by tracing the tracepoint:sched:sched_process_fork tracepoint.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Count new processes, printing per-second summaries until Ctrl-C is hit:
              # pidpersec.bt

FIELDS
       1st    Count of processes (after "@")

OVERHEAD
       This traces kernel forks, and maintains an in-kernel count which is read asynchronously from user-space. As the rate of this  is  generally
       expected to be low (<< 1000/s), the overhead is also expected to be negligible.

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
       top(1)

USER COMMANDS                                                       2018-09-06                                                        pidpersec(8)
