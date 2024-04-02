runqlen(8)                                                    System Manager's Manual                                                   runqlen(8)

NAME
       runqlen - Scheduler run queue length as a histogram.

SYNOPSIS
       runqlen [-h] [-T] [-O] [-C] [interval] [count]

DESCRIPTION
       This  program  summarizes  scheduler queue length as a histogram, and can also show run queue occupancy. It works by sampling the run queue
       length on all CPUs at 99 Hertz.

       This tool can be used to identify imbalances, eg, when processes are bound to CPUs causing queueing,  or  interrupt  mappings  causing  the
       same.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -T     Include timestamps on output.

       -O     Report run queue occupancy.

       -C     Report for each CPU.

       interval
              Output interval, in seconds.

       count  Number of outputs.

EXAMPLES
       Summarize run queue length as a histogram:
              # runqlen

       Print 1 second summaries, 10 times:
              # runqlen 1 10

       Print output every second, with timestamps, and show each CPU separately:
              # runqlen -CT 1

       Print run queue occupancy every second:
              # runqlen -O 1

       Print run queue occupancy, with timetamps, for each CPU:
              # runqlen -COT 1

FIELDS
       runqlen
              Scheduler run queue length: the number of threads (tasks) waiting to run, (excluding including the currently running task).

       count  Number of samples at this queue length.

       distribution
              An ASCII bar chart to visualize the distribution (count column)

OVERHEAD
       This uses sampling at 99 Hertz (on all CPUs), and in-kernel summaries, which should make overhead negligible. This does not trace scheduler
       events, like runqlen does, which comes at a much higher overhead cost.

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
       runqlat(8), runqslower(8), pidstat(1)

USER COMMANDS                                                       2016-12-12                                                          runqlen(8)
