stackcount(8)                                                 System Manager's Manual                                                stackcount(8)

NAME
       stackcount - Count function calls and their stack traces. Uses Linux eBPF/bcc.

SYNOPSIS
       stackcount [-h] [-p PID] [-c CPU] [-i INTERVAL] [-D DURATION] [-T]
                     [-r] [-s] [-P] [-K] [-U] [-v] [-d] [-f] [--debug] pattern

DESCRIPTION
       stackcount  traces functions and frequency counts them with their entire stack trace, kernel stack and user stack, summarized in-kernel for
       efficiency.  This allows higher frequency events to be studied. The output consists of unique stack traces, and their occurrence counts. In
       addition to kernel and user functions, kernel tracepoints and USDT tracepoint are also supported.

       The  pattern is a string with optional '*' wildcards, similar to file globbing.  If you'd prefer to use regular expressions, use the -r op‐
       tion.

       This tool only works on Linux 4.6+. Stack traces are obtained using the new `BPF_STACK_TRACE` APIs.  For kernels older than  4.6,  see  the
       version under tools/old.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -r     Allow regular expressions for the search pattern. The default allows "*" wildcards only.

       -s     Show address offsets.

       -P     Display stacks separately for each process.

       -K     Show kernel stack only.

       -U     Show user stack only.

       -T     Include a timestamp with interval output.

       -v     Show raw addresses.

       -d     Print a delimiter ("--") in-between the kernel and user stacks.

       --debug
              Print the source of the BPF program when loading it (for debugging purposes).

       -i interval
              Summary interval, in seconds.

       -D duration
              Total duration of trace, in seconds.  -f Folded output format.

       -p PID Trace this process ID only (filtered in-kernel).

       -c CPU Trace this CPU only (filtered in-kernel).

       pattern
              A function name, or a search pattern. Can include wildcards ("*"). If the -r option is used, can include regular expressions.

EXAMPLES
       Count kernel and user stack traces for submit_bio():
              # stackcount submit_bio

       Count stacks with a delimiter for submit_bio():
              # stackcount -d submit_bio

       Count kernel stack trace only for submit_bio():
              # stackcount -K submit_bio

       Count user stack trace only for submit_bio():
              # stackcount -U submit_bio

       Count stack traces for ip_output():
              # stackcount ip_output

       Show symbol offsets:
              # stackcount -s ip_output

       Show offsets and raw addresses (verbose):
              # stackcount -sv ip_output

       Count stacks for kernel functions matching tcp_send*:
              # stackcount 'tcp_send*'

       Same as previous, but using regular expressions:
              # stackcount -r '^tcp_send.*'

       Output every 5 seconds, with timestamps:
              # stackcount -Ti 5 ip_output

       Only count stacks when PID 185 is on-CPU:
              # stackcount -p 185 ip_output

       Only count stacks for CPU 1:
              # stackcount -c 1 put_prev_entity

       Count user stacks for dynamic heap allocations with malloc in PID 185:
              # stackcount -p 185 c:malloc

       Count user stacks for thread creation (USDT tracepoint) in PID 185:
              # stackcount -p 185 u:pthread:pthread_create

       Count stacks for context switch events using a kernel tracepoint:
              # stackcount t:sched:sched_switch

OVERHEAD
       This  summarizes unique stack traces in-kernel for efficiency, allowing it to trace a higher rate of function calls than methods that post-
       process in user space. The stack trace data is only copied to user space when the output is printed, which usually only happens  once.  The
       stack walking also happens in an optimized code path in the kernel thanks to the new BPF_STACK_TRACE table APIs, which should be more effi‐
       cient than the manual walker in the eBPF tracer which older versions of this script used. With this in mind, call  rates  of  <  10,000/sec
       would incur negligible overhead. Test before production use. You can also use funccount to get a handle on function call rates first.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg, Sasha Goldshtein

SEE ALSO
       stacksnoop(8), funccount(8)

USER COMMANDS                                                       2016-01-14                                                       stackcount(8)
