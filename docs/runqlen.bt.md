runqlen(8)                                                    System Manager's Manual                                                   runqlen(8)

NAME
       runqlen.bt - CPU scheduler run queue length as a histogram. Uses bpftrace/eBPF.

SYNOPSIS
       runqlen.bt

DESCRIPTION
       This  program  summarizes  scheduler queue length as a histogram, and can also show run queue occupancy. It works by sampling the run queue
       length on all CPUs at 99 Hertz.

       This tool can be used to identify imbalances, eg, when processes are bound to CPUs causing queueing,  or  interrupt  mappings  causing  the
       same.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace CPU run queue length system wide, printing a histogram on Ctrl-C:
              # runqlen.bt

FIELDS
       1st, 2nd
              The run queue length is shown in the first field (after "[").

       3rd    A column showing the count of samples in for that length.

       4th    This is an ASCII histogram representing the count column.

OVERHEAD
       This  samples scheduler structs at 99 Hertz across all CPUs. Relatively, this is a low rate of events, and the overhead of this tool is ex‐
       pected to be near zero.

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
       runqlat(8), mpstat(1), pidstat(1), uptime(1)

USER COMMANDS                                                       2018-10-07                                                          runqlen(8)
