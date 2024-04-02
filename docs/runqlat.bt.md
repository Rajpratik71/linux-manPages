runqlat(8)                                                    System Manager's Manual                                                   runqlat(8)

NAME
       runqlat.bt - CPU scheduler run queue latency as a histogram. Uses bpftrace/eBPF.

SYNOPSIS
       runqlat.bt

DESCRIPTION
       This traces time spent waiting in the CPU scheduler for a turn on-CPU. This metric is often called run queue latency, or scheduler latency.
       This tool shows this latency as a power-of-2 histogram in nanoseconds, allowing multimodal distributions to be studied, as well as  latency
       outliers.

       This tool uses the sched tracepoints.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace CPU run queue latency system wide, printing a histogram on Ctrl-C:
              # runqlat.bt

FIELDS
       1st, 2nd
              This is a range of latency, in microseconds (shown in "[...)" set notation).

       3rd    A column showing the count of scheduler events in this range.

       4th    This is an ASCII histogram representing the count column.

OVERHEAD
       This  traces  scheduler  functions, which can become very frequent. While eBPF has very low overhead, and this tool uses in-kernel maps for
       efficiency, the frequency of scheduler events for some workloads may be high enough that the overhead of  this  tool  becomes  significant.
       Measure in a lab environment to quantify the overhead before use.

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
       runqlen(8), mpstat(1), pidstat(1), uptime(1)

USER COMMANDS                                                       2018-09-17                                                          runqlat(8)
