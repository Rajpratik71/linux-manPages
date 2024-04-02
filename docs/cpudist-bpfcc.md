cpudist(8)                                                    System Manager's Manual                                                   cpudist(8)

NAME
       cpudist - On- and off-CPU task time as a histogram.

SYNOPSIS
       cpudist [-h] [-O] [-T] [-m] [-P] [-L] [-p PID] [interval] [count]

DESCRIPTION
       This measures the time a task spends on the CPU before being descheduled, and shows the times as a histogram. Tasks that spend a very short
       time on the CPU can be indicative of excessive context-switches and poor workload distribution, and possibly point to a  shared  source  of
       contention that keeps tasks switching in and out as it becomes available (such as a mutex).

       Similarly,  the  tool can also measure the time a task spends off-CPU before it is scheduled again. This can be helpful in identifying long
       blocking and I/O operations, or alternatively very short descheduling times due to short-lived locks or timers.

       This tool uses in-kernel eBPF maps for storing timestamps and the histogram, for efficiency. Despite this, the overhead of  this  tool  may
       become significant for some workloads: see the OVERHEAD section.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -O     Measure off-CPU time instead of on-CPU time.

       -T     Include timestamps on output.

       -m     Output histogram in milliseconds.

       -P     Print a histogram for each PID (tgid from the kernel's perspective).

       -L     Print a histogram for each TID (pid from the kernel's perspective).

       -p PID Only show this PID (filtered in kernel for efficiency).

       interval
              Output interval, in seconds.

       count  Number of outputs.

EXAMPLES
       Summarize task on-CPU time as a histogram:
              # cpudist

       Summarize task off-CPU time as a histogram:
              # cpudist -O

       Print 1 second summaries, 10 times:
              # cpudist 1 10

       Print 1 second summaries, using milliseconds as units for the histogram, and include timestamps on output:
              # cpudist -mT 1

       Trace PID 186 only, 1 second summaries:
              # cpudist -P 185 1

FIELDS
       usecs  Microsecond range

       msecs  Millisecond range

       count  How many times a task event fell into this range

       distribution
              An ASCII bar chart to visualize the distribution (count column)

OVERHEAD
       This  traces scheduler tracepoints, which can become very frequent. While eBPF has very low overhead, and this tool uses in-kernel maps for
       efficiency, the frequency of scheduler events for some workloads may be high enough that the overhead of  this  tool  becomes  significant.
       Measure in a lab environment to quantify the overhead before use.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _example.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Sasha Goldshtein

SEE ALSO
       pidstat(1), runqlat(8)

USER COMMANDS                                                       2016-06-28                                                          cpudist(8)
