uthreads(8)                                                   System Manager's Manual                                                  uthreads(8)

NAME
       uthreads, cthreads, javathreads - Trace thread creation events in Java or pthreads.

SYNOPSIS
       cthreads [-h] [-v] pid  javathreads [-h] [-v] pid  uthreads [-h] [-l {c,java,none}] [-v] pid

DESCRIPTION
       This  traces  thread  creation  events  in Java processes, or pthread creation events in any process. When a thread is created, its name or
       start address is printed.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -l {c,java,none}
              The language to trace. C and none select tracing pthreads only, regardless of the runtime being traced.

       -v     Print the resulting BPF program, for debugging purposes.

       pid    The process id to trace.

EXAMPLES
       Trace Java thread creations:
              # uthreads -l java 148

       Trace pthread creations:
              # uthreads 1802

FIELDS
       TIME   The event's time in seconds from the beginning of the trace.

       ID     The thread's ID. The information in this column depends on the runtime.

       TYPE   Event type -- thread start, stop, or pthread event.

       DESCRIPTION
              The thread's name or start address function name.

OVERHEAD
       Thread start and stop events are usually not very frequent, which makes this tool's overhead negligible.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _example.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Sasha Goldshtein

SEE ALSO
       ustat(8), trace(8)

USER COMMANDS                                                       2018-10-09                                                         uthreads(8)
