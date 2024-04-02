threadsnoop(8)                                                System Manager's Manual                                               threadsnoop(8)

NAME
       threadsnoop.bt - Trace thread creation via pthread_create(). Uses bpftrace/eBPF.

SYNOPSIS
       threadsnoop.bt

DESCRIPTION
       threadsnoop traces calls to pthread_create(), showing this path of thread creation. This can be used for workload characterization and dis‐
       covery, and is a companion to execsnoop(8) which traces execve(2).

       This works by tracing the pthread_create() from libpthread.so.0. The path to this library may need adjusting in the tool  source  to  match
       your system.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace calls pthread_create():
              # threadsnoop.bt

FIELDS
       TIME(ms)
              Elapsed time since the tool began tracing (in milliseconds).

       PID    The process ID.

       COMM   The process (thread) name.

       FUNC   The name of the start routine, if the symbol is available, else a hex address for the start routine address.

OVERHEAD
       Thread creation is expected to be low (<< 1000/s), so the overhead of this tool is expected to be negligible.

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
       execsnoop(8)

USER COMMANDS                                                       2019-07-02                                                      threadsnoop(8)
