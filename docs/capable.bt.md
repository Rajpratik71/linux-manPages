capable(8)                                                    System Manager's Manual                                                   capable(8)

NAME
       capable.bt - Trace security capability checks (cap_capable()).

SYNOPSIS
       capable.bt

DESCRIPTION
       This  traces security capability checks in the kernel, and prints details for each call. This can be useful for general debugging, and also
       security enforcement: determining a white list of capabilities an application needs.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF, bpftrace.

EXAMPLES
       Trace all capability checks system-wide:
              # capable.bt

FIELDS
       TIME(s)
              Time of capability check: HH:MM:SS.

       UID    User ID.

       PID    Process ID.

       COMM   Process name.  CAP Capability number.  NAME Capability name. See capabilities(7) for descriptions.

       AUDIT  Whether this was an audit event.

OVERHEAD
       This adds low-overhead instrumentation to capability checks, which are expected to be low frequency, however, that depends on the  applica‐
       tion. Test in a lab environment before use.

SOURCE
       This is from bpftrace.

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

       This is a bpftrace version of the bcc tool of the same name. The bcc tool provides options to customize the output.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       capabilities(7)

USER COMMANDS                                                       2018-09-08                                                          capable(8)
