profile(8)                                                    System Manager's Manual                                                   profile(8)

NAME
       profile - Profile CPU usage by sampling stack traces. Uses Linux eBPF/bcc.

SYNOPSIS
       profile [-adfh] [-p PID | -L TID] [-U | -K] [-F FREQUENCY | -c COUNT] [--stack-storage-size COUNT] [duration]

DESCRIPTION
       This  is a CPU profiler. It works by taking samples of stack traces at timed intervals. It will help you understand and quantify CPU usage:
       which code is executing, and by how much, including both user-level and kernel code.

       By default this samples at 49 Hertz (samples per second), across all CPUs.  This frequency can be tuned using a command  line  option.  The
       reason for 49, and not 50, is to avoid lock-step sampling.

       This  is  also an efficient profiler, as stack traces are frequency counted in kernel context, rather than passing each stack to user space
       for frequency counting there. Only the unique stacks and counts are passed to user space at the end of the profile,  greatly  reducing  the
       kernel<->user transfer.

REQUIREMENTS
       CONFIG_BPF and bcc.

       This also requires Linux 4.9+ (BPF_PROG_TYPE_PERF_EVENT support). See tools/old for an older version that may work on Linux 4.6 - 4.8.

OPTIONS
       -h     Print usage message.

       -p PID Trace this process ID only (filtered in-kernel).

       -L TID Trace this thread ID only (filtered in-kernel).

       -F frequency
              Frequency to sample stacks.

       -c count
              Sample stacks every one in this many events.

       -f     Print output in folded stack format.

       -d     Include an output delimiter between kernel and user stacks (either "--", or, in folded mode, "-").

       -U     Show stacks from user space only (no kernel space stacks).

       -K     Show stacks from kernel space only (no user space stacks).

       -I     Include CPU idle stacks (by default these are excluded).

       --stack-storage-size COUNT
              The  maximum  number of unique stack traces that the kernel will count (default 16384). If the sampled count exceeds this, a warning
              will be printed.

       -C cpu Collect stacks only from specified cpu.

       duration
              Duration to trace, in seconds.

EXAMPLES
       Profile (sample) stack traces system-wide at 49 Hertz (samples per second) until Ctrl-C:
              # profile

       Profile for 5 seconds only:
              # profile 5

       Profile at 99 Hertz for 5 seconds only:
              # profile -F 99 5

       Profile 1 in a million events for 5 seconds only:
              # profile -c 1000000 5

       Profile process with PID 181 only:
              # profile -p 181

       Profile thread with TID 181 only:
              # profile -L 181

       Profile for 5 seconds and output in folded stack format (suitable as input for flame graphs), including a delimiter between kernel and user
       stacks:
              # profile -df 5

       Profile kernel stacks only:
              # profile -K

DEBUGGING
       See  "[unknown]" frames with bogus addresses? This can happen for different reasons. Your best approach is to get Linux perf to work first,
       and then to try this tool. Eg, "perf record -F 49 -a -g -- sleep 1; perf script", and to check for unknown frames there.

       The most common reason for "[unknown]" frames is that the target software has not been compiled with frame pointers, and so  we  can't  use
       that  simple  method for walking the stack. The fix in that case is to use software that does have frame pointers, eg, gcc -fno-omit-frame-
       pointer, or Java's -XX:+PreserveFramePointer.

       Another reason for "[unknown]" frames is JIT compilers, which don't use a traditional symbol table. The fix in that case is to  populate  a
       /tmp/perf-PID.map file with the symbols, which this tool should read. How you do this depends on the runtime (Java, Node.js).

       If  you seem to have unrelated samples in the output, check for other sampling or tracing tools that may be running. The current version of
       this tool can include their events if profiling happened concurrently. Those samples may be filtered in a future version.

OVERHEAD
       This is an efficient profiler, as stack traces are frequency counted in kernel context, and only the unique stacks  and  their  counts  are
       passed  to  user  space.  Contrast this with the current "perf record -F 99 -a" method of profiling, which writes each sample to user space
       (via a ring buffer), and then to the file system (perf.data), which must be post-processed.

       This uses perf_event_open to setup a timer which is instrumented by BPF, and for efficiency it does not initialize the perf ring buffer, so
       the redundant perf samples are not collected.

       It's expected that the overhead while sampling at 49 Hertz (the default), across all CPUs, should be negligible. If you increase the sample
       rate, the overhead might begin to be measurable.

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
       offcputime(8)

USER COMMANDS                                                       2016-07-17                                                          profile(8)
