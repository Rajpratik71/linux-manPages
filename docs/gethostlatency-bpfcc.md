gethostlatency(8)                                             System Manager's Manual                                            gethostlatency(8)

NAME
       gethostlatency - Show latency for getaddrinfo/gethostbyname[2] calls. Uses Linux eBPF/bcc.

SYNOPSIS
       gethostlatency

DESCRIPTION
       This traces and prints when getaddrinfo(), gethostbyname(), and gethostbyname2() are called, system wide, and shows the responsible PID and
       command name, latency of the call (duration) in milliseconds, and the host string.

       This tool can be useful for identifying DNS latency, by identifying which remote host name lookups were slow, and by how much.

       This makes use of a Linux 4.5 feature (bpf_perf_event_output()); for kernels older than 4.5, see the version under tools/old, which uses an
       older mechanism

       This  tool currently uses dynamic tracing of user-level functions and registers, and may need modifications to match your software and pro‐
       cessor architecture.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -p PID Trace this process ID only.

EXAMPLES
       Trace host lookups (getaddrinfo/gethostbyname[2]) system wide:
              # gethostlatency

FIELDS
       TIME   Time of the command (HH:MM:SS).

       PID    Process ID of the client performing the call.

       COMM   Process (command) name of the client performing the call.

       HOST   Host name string: the target of the lookup.

OVERHEAD
       The rate of lookups should be relatively low, so the overhead is not expected to be a problem.

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
       tcpdump(8)

USER COMMANDS                                                       2016-01-28                                                   gethostlatency(8)
