cpuunclaimed(8)                                               System Manager's Manual                                              cpuunclaimed(8)

NAME
       cpuunclaimed - Sample CPU run queues and calculate unclaimed idle CPU. Uses Linux eBPF/bcc.

SYNOPSIS
       cpuunclaimed [-T] [-j] [-J] [interval [count]]

DESCRIPTION
       This  tool  samples  the length of the run queues and determine when there are idle CPUs, yet queued threads waiting their turn. It reports
       the amount of idle (yet unclaimed by waiting threads) CPU as a system-wide percentage.

       This situation can happen for a number of reasons:

       -      An application has been bound to some, but not all, CPUs, and has runnable threads that cannot migrate to other  CPUs  due  to  this
              configuration.

       -      CPU affinity: an optimization that leaves threads on CPUs where the CPU caches are warm, even if this means short periods of waiting
              while other CPUs are idle. The wait period is tunale (see sysctl, kernel.sched*).

       -      Scheduler bugs.

       An unclaimed idle of < 1% is likely to be CPU affinity, and not usually a cause for concern. By leaving the CPU idle, overall throughput of
       the system may be improved. This tool is best for identifying larger issues, > 2%, due to the coarseness of its 99 Hertz samples.

       This is an experimental tool that currently works by use of sampling to keep overheads low. Tool assumptions:

       -      CPU samples consistently fire around the same offset. There will sometimes be a lag as a sample is delayed by higher-priority inter‐
              rupts, but it is assumed the subsequent samples will catch up to the expected offsets (as is seen in practice). You can  use  -J  to
              inspect  sample  offsets.  Some systems can power down CPUs when idle, and when they wake up again they may begin firing at a skewed
              offset: this tool will detect the skew, print an error, and exit.

       -      All CPUs are online (see ncpu).

       If this identifies unclaimed CPU, you can double check it by dumping raw samples (-j), as well as using other tracing tools  to  instrument
       scheduler events (although this latter approach has much higher overhead).

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Sample and calculate unclaimed idle CPUs, output every 1 second (default:
              # cpuunclaimed

       Print 5 second summaries, 10 times:
              # cpuunclaimed 5 10

       Print 1 second summaries with timestamps:
              # cpuunclaimed -T 1

       Raw dump of all samples (verbose), as comma-separated values:
              # cpuunclaimed -j

FIELDS
       %CPU   CPU utilization as a system-wide percentage.

       unclaimed idle
              Percentage of CPU resources that were idle when work was queued on other CPUs, as a system-wide percentage.

       TIME   Time (HH:MM:SS)

       TIMESTAMP_ns
              Timestamp, nanoseconds.

       CPU#   CPU ID.

       OFFSET_ns_CPU#
              Time offset that a sample fired within a sample group for this CPU.

OVERHEAD
       The  overhead is expected to be low/negligible as this tool uses sampling at 99 Hertz (on all CPUs), which has a fixed and low cost, rather
       than sampling every scheduler event as many other approaches use (which can involve instrumenting millions of events per  second).  Sampled
       CPUs,  run  queue lengths, and timestamps are written to ring buffers that are periodically read by user space for reporting. Measure over‐
       head in a test environment.

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
       runqlen(8)

USER COMMANDS                                                       2016-12-21                                                     cpuunclaimed(8)
