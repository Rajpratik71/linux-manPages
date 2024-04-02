offwaketime(8)                                                System Manager's Manual                                               offwaketime(8)

NAME
       offwaketime - Summarize blocked time by off-CPU stack + waker stack. Uses Linux eBPF/bcc.

SYNOPSIS
       offwaketime  [-h]  [-p  PID  |  -t  TID  |  -u  |  -k]  [-U  |  -K]  [-f] [--stack-storage-size STACK_STORAGE_SIZE] [-m MIN_BLOCK_TIME] [-M
       MAX_BLOCK_TIME] [duration]

DESCRIPTION
       This program shows kernel stack traces and task names that were blocked and "off-CPU", along with the stack traces and task names  for  the
       threads  that  woke  them,  and the total elapsed time from when they blocked to when they were woken up.  This combines the summaries from
       both the offcputime and wakeuptime tools.  The time measurement will be very similar to off-CPU time, however, off-CPU time may  include  a
       little  extra  time  spent waiting on a run queue to be scheduled.  The combined stacks, task names, and total time is summarized in kernel
       context for efficiency, using an eBPF map.

       The output summary will further help you identify reasons why threads were blocking, and quantify the time from when they were  blocked  to
       woken  up.   This  spans all types of blocking activity: disk I/O, network I/O, locks, page faults, swapping, sleeping, involuntary context
       switches, etc.

       This is complementary to CPU profiling (e.g., CPU flame graphs) which shows the time spent on-CPU. This shows the time spent  blocked  off-
       CPU, and the output, especially the -f format, can be used to generate an "off-wake time flame graph".

       See http://www.brendangregg.com/FlameGraphs/offcpuflamegraphs.html

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -f     Print output in folded stack format.

       -p PID Trace this process ID only (filtered in-kernel).

       -t TID Trace this thread ID only (filtered in-kernel).

       -u     Only trace user threads (no kernel threads).

       -k     Only trace kernel threads (no user threads).

       -U     Show stacks from user space only (no kernel space stacks).

       -K     Show stacks from kernel space only (no user space stacks).

       --stack-storage-size STACK_STORAGE_SIZE
              Change the number of unique stack traces that can be stored and displayed.

       duration
              Duration to trace, in seconds.

       -m MIN_BLOCK_TIME
              The amount of time in microseconds over which we store traces (default 1)

       -M MAX_BLOCK_TIME
              The amount of time in microseconds under which we store traces (default U64_MAX)

EXAMPLES
       Trace all thread blocking events, and summarize (in-kernel) by user and kernel off-CPU stack trace, waker stack traces, task names, and to‐
       tal blocked time:
              # offwaketime

       Trace for 5 seconds only:
              # offwaketime 5

       Trace for 5 seconds, and emit output in folded stack format (suitable for flame graphs), user-mode threads only:
              # offwaketime -fu 5

       Trace PID 185 only:
              # offwaketime -p 185

OVERHEAD
       This summarizes unique stack trace pairs in-kernel for efficiency, allowing it to trace a higher rate of events  than  methods  that  post-
       process in user space.  The stack trace and time data is only copied to user space once, when the output is printed. While these techniques
       greatly lower overhead, scheduler events are still a high frequency event, as they can exceed 1 million events per second, and  so  caution
       should still be used. Test before production use.

       If  the  overhead  is still a problem, take a look at the min block option.  If your aim is to chase down longer blocking events, then this
       could be increased to filter shorter blocking events, further lowering overhead.

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
       offcputime(8), wakeuptime(8)

USER COMMANDS                                                       2016-01-30                                                      offwaketime(8)
