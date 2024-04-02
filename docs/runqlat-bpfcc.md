runqlat(8)                                                    System Manager's Manual                                                   runqlat(8)

NAME
       runqlat - Run queue (scheduler) latency as a histogram.

SYNOPSIS
       runqlat [-h] [-T] [-m] [-P] [--pidnss] [-L] [-p PID] [interval] [count]

DESCRIPTION
       This measures the time a task spends waiting on a run queue (or equivalent scheduler data structure) for a turn on-CPU, and shows this time
       as a histogram. This time should be small, but a task may need to wait its turn due to CPU load. The higher the CPU load, the longer a task
       will generally need to wait its turn.

       This tool measures two types of run queue latency:

       1. The time from a task being enqueued on a run queue to its context switch and execution. This traces ttwu_do_wakeup(), wake_up_new_task()
       -> finish_task_switch() with either raw tracepoints (if supported) or kprobes and instruments the run queue latency after a voluntary  con‐
       text switch.

       2.  The  time  from when a task was involuntary context switched and still in the runnable state, to when it next executed. This is instru‐
       mented from finish_task_switch() alone.

       This tool uses in-kernel eBPF maps for storing timestamps and the histogram, for efficiency. Despite this, the overhead of  this  tool  may
       become significant for some workloads: see the OVERHEAD section.

       This  works by tracing various kernel scheduler functions using dynamic tracing, and will need updating to match any changes to these func‐
       tions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -T     Include timestamps on output.

       -m     Output histogram in milliseconds.

       -P     Print a histogram for each PID.

       --pidnss
              Print a histogram for each PID namespace (short for PID namespaces). For container analysis.

       -L     Print a histogram for each thread ID.

       -p PID Only show this PID (filtered in kernel for efficiency).

       interval
              Output interval, in seconds.

       count  Number of outputs.

EXAMPLES
       Summarize run queue latency as a histogram:
              # runqlat

       Print 1 second summaries, 10 times:
              # runqlat 1 10

       Print 1 second summaries, using milliseconds as units for the histogram, and include timestamps on output:
              # runqlat -mT 1

       Trace PID 186 only, 1 second summaries:
              # runqlat -P 185 1

FIELDS
       usecs  Microsecond range

       msecs  Millisecond range

       count  How many times a task event fell into this range

       distribution
              An ASCII bar chart to visualize the distribution (count column)

OVERHEAD
       This traces scheduler functions, which can become very frequent. While eBPF has very low overhead, and this tool uses  in-kernel  maps  for
       efficiency,  the  frequency  of  scheduler events for some workloads may be high enough that the overhead of this tool becomes significant.
       Measure in a lab environment to quantify the overhead before use.

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
       runqlen(8), runqslower(8), pidstat(1)

USER COMMANDS                                                       2016-02-07                                                          runqlat(8)
