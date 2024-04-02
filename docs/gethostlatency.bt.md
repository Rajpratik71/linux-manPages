gethostlatency(8)                                             System Manager's Manual                                            gethostlatency(8)

NAME
       gethostlatency.bt - Show latency for getaddrinfo/gethostbyname[2] calls. Uses bpftrace/eBPF.

SYNOPSIS
       gethostlatency.bt

DESCRIPTION
       This traces and prints when getaddrinfo(), gethostbyname(), and gethostbyname2() are called, system wide, and shows the responsible PID and
       command name, latency of the call (duration) in milliseconds, and the host string.

       This tool can be useful for identifying DNS latency, by identifying which remote host name lookups were slow, and by how much.

       This tool currently uses dynamic tracing of user-level functions and registers, and may need modifications to match your software and  pro‐
       cessor architecture.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Trace host lookups (getaddrinfo/gethostbyname[2]) system wide:
              # gethostlatency.bt

FIELDS
       TIME   Time of the command (HH:MM:SS).

       PID    Process ID of the client performing the call.

       COMM   Process (command) name of the client performing the call.

       LATms  Latency of the call, in milliseconds.

       HOST   Host name string: the target of the lookup.

OVERHEAD
       The rate of lookups should be relatively low, so the overhead is not expected to be a problem.

SOURCE
       This is from bpftrace.

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

       This is a bpftrace version of the bcc tool of the same name. The bcc tool provides command line options.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       tcpdump(8)

USER COMMANDS                                                       2018-09-08                                                   gethostlatency(8)
