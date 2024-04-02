offcputime(8)                                                 System Manager's Manual                                                offcputime(8)

NAME
       offcputime - Summarize off-CPU time by kernel stack trace. Uses Linux eBPF/bcc.

SYNOPSIS
       offcputime  [-h]  [-p  PID  |  -t  TID  |  -u  |  -k] [-U | -K] [-d] [-f] [--stack-storage-size STACK_STORAGE_SIZE] [-m MIN_BLOCK_TIME] [-M
       MAX_BLOCK_TIME] [--state STATE] [duration]

DESCRIPTION
       This program shows stack traces and task names that were blocked and "off-CPU", and the total duration they were not running:  their  "off-
       CPU  time".   It works by tracing when threads block and when they return to CPU, measuring both the time they were off-CPU and the blocked
       stack trace and the task name.  This data is summarized in the kernel using an eBPF map, and by summing the off-CPU time  by  unique  stack
       trace and task name.

       The  output summary will help you identify reasons why threads were blocking, and quantify the time they were off-CPU. This spans all types
       of blocking activity: disk I/O, network I/O, locks, page faults, involuntary context switches, etc.

       This is complementary to CPU profiling (e.g., CPU flame graphs) which shows the time spent on-CPU. This shows the time spent  off-CPU,  and
       the output, especially the -f format, can be used to generate an "off-CPU time flame graph".

       See http://www.brendangregg.com/FlameGraphs/offcpuflamegraphs.html

       This tool only works on Linux 4.6+. It uses the new `BPF_STACK_TRACE` table APIs to generate the in-kernel stack traces.  For kernels older
       than 4.6, see the version under tools/old.

       Note: this tool only traces off-CPU times that began and ended while tracing.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -p PID Trace this process ID only (filtered in-kernel).

       -t TID Trace this thread ID only (filtered in-kernel).

       -u     Only trace user threads (no kernel threads).

       -k     Only trace kernel threads (no user threads).

       -U     Show stacks from user space only (no kernel space stacks).

       -K     Show stacks from kernel space only (no user space stacks).

       -d     Insert delimiter between kernel/user stacks.

       -f     Print output in folded stack format.

       --stack-storage-size STACK_STORAGE_SIZE
              Change the number of unique stack traces that can be stored and displayed.

       -m MIN_BLOCK_TIME
              The minimum time in microseconds over which we store traces (default 1)

       -M MAX_BLOCK_TIME
              The maximum time in microseconds under which we store traces (default U64_MAX)

       --state
              Filter on this thread state bitmask (eg, 2 == TASK_UNINTERRUPTIBLE).  See include/linux/sched.h for states.

       duration
              Duration to trace, in seconds.

EXAMPLES
       Trace all thread blocking events, and summarize (in-kernel) by kernel stack trace and total off-CPU time:
              # offcputime

       Trace for 5 seconds only:
              # offcputime 5

       Trace for 5 seconds, and emit output in folded stack format (suitable for flame graphs):
              # offcputime -f 5

       Trace PID 185 only:
              # offcputime -p 185

OVERHEAD
       This summarizes unique stack traces in-kernel for efficiency, allowing it to trace a higher rate of events than methods  that  post-process
       in  user space. The stack trace and time data is only copied to user space once, when the output is printed. While these techniques greatly
       lower overhead, scheduler events are still a high frequency event, as they can exceed 1 million events per second, and  so  caution  should
       still be used. Test before production use.

       If  the  overhead  is  still  a  problem,  take a look at the MINBLOCK_US tunable in the code. If your aim is to chase down longer blocking
       events, then this could be increased to filter shorter blocking events, further lowering overhead.

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
       stackcount(8)

USER COMMANDS                                                       2016-01-14                                                       offcputime(8)
