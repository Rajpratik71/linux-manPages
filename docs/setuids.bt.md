setuids(8)                                                    System Manager's Manual                                                   setuids(8)

NAME
       setuids.bt - Trace setuid family of syscalls. Uses bpftrace/eBPF.

SYNOPSIS
       setuids.bt

DESCRIPTION
       This tool traces privilege escalation via setuid syscalls, and can be used for debugging, whitelist creation, and intrusion detection.

       It works by tracing the setuid(2), setfsuid(2), and retresuid(2) syscalls using the syscall tracepoints.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace setuid syscalls:
              # setuids.bt

FIELDS
       PID    The calling process ID.

       COMM   The calling process (thread) name.

       UID    The UID of the caller.

       SYSCALL
              The syscall name.

       ARGS   The arguments to the syscall

       (RET)  The return value for the syscall: 0 == success, other numbers indicate an error code.

OVERHEAD
       setuid calls are expected to be low frequency (<< 100/s), so the overhead of this tool is expected to be negligible.

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

USER COMMANDS                                                       2019-07-05                                                          setuids(8)
