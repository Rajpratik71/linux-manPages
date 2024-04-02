wakeuptime(8)                                                 System Manager's Manual                                                wakeuptime(8)

NAME
       wakeuptime - Summarize sleep to wakeup time by waker kernel stack. Uses Linux eBPF/bcc.

SYNOPSIS
       wakeuptime [-h] [-u] [-p PID] [-v] [-f] [--stack-storage-size STACK_STORAGE_SIZE] [-m MIN_BLOCK_TIME] [-M MAX_BLOCK_TIME] [duration]

DESCRIPTION
       This  program  shows  the kernel stack traces for threads that woke up other blocked threads, along with the process names of the waker and
       target, along with a sum of the time that the target was blocked: the "blocked time".  It works by tracing when threads block and when they
       were then woken up, and measuring the time delta. This time measurement will be very similar to off-CPU time, however, off-CPU time may in‐
       clude a little extra time spent waiting on a run queue to be scheduled. The stack traces, process names, and time spent blocked  is  summa‐
       rized in the kernel using an eBPF map for efficiency.

       The  output  summary  will  help  you identify reasons why threads were blocking by showing who woke them up, along with the time they were
       blocked. This spans all types of blocking activity: disk I/O, network I/O, locks, page faults, involuntary context switches, etc.

       This can be used in conjunction with offcputime, which shows the stack trace of the blocked thread. wakeuptime shows the stack trace of the
       waker thread.

       See http://www.brendangregg.com/FlameGraphs/offcpuflamegraphs.html

       This tool only works on Linux 4.6+. It uses the new `BPF_STACK_TRACE` table APIs to generate the in-kernel stack traces.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -f     Print output in folded stack format.

       -u     Only trace user threads (not kernel threads).

       -v     Show raw addresses (for non-folded format).

       -p PID Trace this process ID only (filtered in-kernel).

       --stack-storage-size STACK_STORAGE_SIZE
              Change the number of unique stack traces that can be stored and displayed.

       duration
              Duration to trace, in seconds.

       -m MIN_BLOCK_TIME
              The amount of time in microseconds over which we store traces (default 1)

       -M MAX_BLOCK_TIME
              The amount of time in microseconds under which we store traces (default U64_MAX)

EXAMPLES
       Trace all thread blocking events, and summarize (in-kernel) by kernel stack trace and total blocked time:
              # wakeuptime

       Trace user-mode target threads only:
              # wakeuptime -u

       Trace for 5 seconds only:
              # wakeuptime 5

       Trace for 5 seconds, and emit output in folded stack format (suitable for flame graphs):
              # wakeuptime -f 5

       Trace PID 185 only:
              # wakeuptime -p 185

OVERHEAD
       This  summarizes  unique stack traces in-kernel for efficiency, allowing it to trace a higher rate of events than methods that post-process
       in user space. The stack trace and time data is only copied to user space once, when the output is printed. While these techniques  greatly
       lower  overhead,  scheduler  events are still a high frequency event, as they can exceed 1 million events per second, and so caution should
       still be used. Test before production use.

       If the overhead is still a problem, take a look at the min block option.  If your aim is to chase down longer blocking  events,  then  this
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
       offcputime(8), stackcount(8)

USER COMMANDS                                                       2016-01-27                                                       wakeuptime(8)
