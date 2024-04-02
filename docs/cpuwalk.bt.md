cpuwalk(8)                                                    System Manager's Manual                                                   cpuwalk(8)

NAME
       cpuwalk.bt - Sample which CPUs are executing processes.. Uses bpftrace/eBPF.

SYNOPSIS
       cpuwalk.bt

DESCRIPTION
       This  tool  samples  CPUs  at 99 Hertz, then prints a histogram showing which CPUs were active. 99 Hertz is used to avoid lockstep sampling
       that would skew results. This tool can help identify if your application's workload is evenly using the CPUs, or if there is  an  imbalance
       problem.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Sample CPUs and print a summary on Ctrl-C:
              # cpuwalk.bt

FIELDS
       1st, 2nd
              The CPU is shown in the first field, after the "[". Disregard the second field.

       3rd    A column showing the number of samples for this CPU.

       4th    This is an ASCII histogram representing the count column.

OVERHEAD
       This should be negligible.

SOURCE
       This is from bpftrace.

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       mpstat(1)

USER COMMANDS                                                       2018-09-08                                                          cpuwalk(8)
