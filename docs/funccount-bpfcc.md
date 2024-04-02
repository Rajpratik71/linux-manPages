funccount(8)                                                  System Manager's Manual                                                 funccount(8)

NAME
       funccount - Count function, tracepoint, and USDT probe calls matching a pattern. Uses Linux eBPF/bcc.

SYNOPSIS
       funccount [-h] [-p PID] [-i INTERVAL] [-d DURATION] [-T] [-r] [-D] pattern

DESCRIPTION
       This  tool  is  a  quick way to determine which functions are being called, and at what rate. It uses in-kernel eBPF maps to count function
       calls.

       WARNING: This uses dynamic tracing of (what can be many) functions, an activity that has had issues on some kernel versions (risk of panics
       or freezes). Test, and know what you are doing, before use.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       pattern Search pattern. Supports "*" wildcards. See EXAMPLES. You can also use -r for regular expressions.

       -h     Print usage message.

       -p PID Trace this process ID only.

       -i INTERVAL
              Print output every interval seconds.

       -d DURATION
              Total duration of trace in seconds.

       -T     Include timestamps on output.

       -r     Use regular expressions for the search pattern.

       -D     Print the BPF program before starting (for debugging purposes).

EXAMPLES
       Count kernel functions beginning with "vfs_", until Ctrl-C is hit:
              # funccount 'vfs_*'

       Count kernel functions beginning with "tcp_send", until Ctrl-C is hit:
              # funccount 'tcp_send*'

       Print kernel functions beginning with "vfs_", every second:
              # funccount -i 1 'vfs_*'

       Print kernel functions beginning with "vfs_", for ten seconds only:
              # funccount -d 10 'vfs_*'

       Match kernel functions beginning with "vfs_", using regular expressions:
              # funccount -r '^vfs_.*'

       Count vfs calls for process ID 181 only:
              # funccount -p 181 'vfs_*'

       Count calls to the sched_fork tracepoint, indicating a fork() performed:
              # funccount t:sched:sched_fork

       Count all GC USDT probes in the Node process:
              # funccount -p 185 u:node:gc*

       Count all malloc() calls in libc:
              # funccount c:malloc

FIELDS
       FUNC   Function name

       COUNT  Number of calls while tracing

OVERHEAD
       This  traces  functions and maintains in-kernel counts, which are asynchronously copied to user-space. While the rate of calls be very high
       (>1M/sec), this is a relatively efficient way to trace these events, and so the overhead is expected to  be  small  for  normal  workloads.
       Measure in a test environment before use.

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
       stackcount(8) funclatency(8) vfscount(8)

USER COMMANDS                                                       2015-08-18                                                        funccount(8)
