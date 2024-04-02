funclatency(8)                                                System Manager's Manual                                               funclatency(8)

NAME
       funclatency - Time functions and print latency as a histogram.

SYNOPSIS
       funclatency [-h] [-p PID] [-i INTERVAL] [-d DURATION] [-T] [-u] [-m] [-F] [-r] [-v] pattern

DESCRIPTION
       This tool traces function calls and times their duration (latency), and shows the latency distribution as a histogram. The time is measured
       from when the function is called to when it returns, and is inclusive of both on-CPU time and time spent blocked.

       This tool uses in-kernel eBPF maps for storing timestamps and the histogram, for efficiency.

       Currently nested or recursive functions are not supported properly, and timestamps will be overwritten, creating  dubious  output.  Try  to
       match single functions, or groups of functions that run at the same stack layer, and don't ultimately call each other.

       WARNING: This uses dynamic tracing of (what can be many) functions, an activity that has had issues on some kernel versions (risk of panics
       or freezes). Test, and know what you are doing, before use.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       pattern Function name or search pattern. Supports "*" wildcards. See EXAMPLES.  You can also use -r for regular expressions.  -h Print  us‐
       age message.

       -p PID Trace this process ID only.

       -i INTERVAL
              Print output every interval seconds.

       -d DURATION
              Total duration of trace, in seconds.

       -T     Include timestamps on output.

       -u     Output histogram in microseconds.

       -m     Output histogram in milliseconds.

       -F     Print a separate histogram per function matched.

       -r     Use regular expressions for the search pattern.

       -v     Print the BPF program (for debugging purposes).

EXAMPLES
       Time the do_sys_open() kernel function, and print the distribution as a histogram:
              # funclatency do_sys_open

       Time the read() function in libc across all processes on the system:
              # funclatency c:read

       Time vfs_read(), and print the histogram in units of microseconds:
              # funclatency -u vfs_read

       Time do_nanosleep(), and print the histogram in units of milliseconds:
              # funclatency -m do_nanosleep

       Time libc open(), and print output every 2 seconds, for duration 10 seconds:
              # funclatency -i 2 -d 10 c:read

       Time vfs_read(), and print output every 5 seconds, with timestamps:
              # funclatency -mTi 5 vfs_read

       Time vfs_read() for process ID 181 only:
              # funclatency -p 181 vfs_read:

       Time both vfs_fstat() and vfs_fstatat() calls, by use of a wildcard:
              # funclatency 'vfs_fstat*'

       Time both vfs_fstat* calls, and print a separate histogram for each:
              # funclatency -F 'vfs_fstat*'

FIELDS
       necs   Nanosecond range

       usecs  Microsecond range

       msecs  Millisecond range

       count  How many calls fell into this range

       distribution
              An ASCII bar chart to visualize the distribution (count column)

OVERHEAD
       This  traces kernel functions and maintains in-kernel timestamps and a histogram, which are asynchronously copied to user-space. While this
       method is very efficient, the rate of kernel functions can also be very high (>1M/sec), at which point the overhead is expected to be  mea‐
       surable.  Measure in a test environment and understand overheads before use. You can also use funccount to measure the rate of kernel func‐
       tions over a short duration, to set some expectations before use.

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
       funccount(8)

USER COMMANDS                                                       2015-08-18                                                      funclatency(8)
