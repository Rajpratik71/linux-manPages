capable(8)                                                    System Manager's Manual                                                   capable(8)

NAME
       capable - Trace security capability checks (cap_capable()).

SYNOPSIS
       capable [-h] [-v] [-p PID] [-K] [-U]

DESCRIPTION
       This  traces security capability checks in the kernel, and prints details for each call. This can be useful for general debugging, and also
       security enforcement: determining a white list of capabilities an application needs.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF, bcc.

OPTIONS
       -h USAGE message.

       -v     Include non-audit capability checks. These are those deemed not interesting and not necessary to audit, such as CAP_SYS_ADMIN checks
              on memory allocation to affect the behavior of overcommit.

       -K     Include kernel stack traces to the output.

       -U     Include user-space stack traces to the output.

       -x     Show extra fields in TID and INSETID columns.

EXAMPLES
       Trace all capability checks system-wide:
              # capable

       Trace capability checks for PID 181:
              # capable -p 181

FIELDS
       TIME(s)
              Time of capability check: HH:MM:SS.

       UID    User ID.

       PID    Process ID.

       COMM   Process name.  CAP Capability number.  NAME Capability name. See capabilities(7) for descriptions.

       AUDIT  Whether this was an audit event. Use -v to include non-audit events.  INSETID Whether the INSETID bit was set (Linux >= 5.1).

OVERHEAD
       This  adds low-overhead instrumentation to capability checks, which are expected to be low frequency, however, that depends on the applica‐
       tion. Test in a lab environment before use.

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
       capabilities(7)

USER COMMANDS                                                       2016-09-13                                                          capable(8)
