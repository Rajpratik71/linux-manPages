naptime(8)                                                    System Manager's Manual                                                   naptime(8)

NAME
       naptime.bt - Trace voluntary sleep calls. Uses bpftrace/eBPF.

SYNOPSIS
       naptime.bt

DESCRIPTION
       This  tool traces application sleeps, and can be used for debugging high latency that may be caused by deliberate sleeps placed in applica‐
       tion routines, especially administration scripts.

       This tool works by tracing the nanosleep(2) syscall using the syscall tracepoints.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace application sleeps via nanosleep(2):
              # naptime.bt

FIELDS
       TIME   A timestamp in HH:MM:SS format.

       PPID   Parent process ID.

       PCOMM  Parent process name.

       PID    The sleeping process ID.

       COMM   The sleeping process name.

       SECONDS
              The requested duration of the sleep.

OVERHEAD
       nanosleep(2) calls are expected to be low frequency (<< 100/s), so the overhead of this tool is expected to be negligible.

SOURCE
       This tool originated from the book "BPF Performance Tools", published by Addison Wesley (2019):

              http://www.brendangregg.com/bpf-performance-tools-book.html

       See the book for more documentation on this tool.

       This version is in the bpftrace repository:

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       capable(8)

USER COMMANDS                                                       2019-07-05                                                          naptime(8)
