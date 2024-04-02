pidpersec(8)                                                  System Manager's Manual                                                 pidpersec(8)

NAME
       pidpersec - Count new processes (via fork()). Uses Linux eBPF/bcc.

SYNOPSIS
       pidpersec

DESCRIPTION
       pidpersec  shows  how  many  new  processes were created each second. There can be performance issues caused by many short-lived processes,
       which may not be visible in sampling tools like top(1). pidpersec provides one way to investigate this behavior.

       This works by tracing the kernel sched_fork() function using dynamic tracing, and will need updating to match any changes to this function.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Count new processes created each second:
              # pidpersec

OVERHEAD
       This traces the kernel fork function, and maintains an in-kernel count which is read asynchronously from user-space. As the rate of this is
       generally expected to be low (<< 1000/s), the overhead is also expected to be negligible.

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
       top(1)

USER COMMANDS                                                       2015-08-18                                                        pidpersec(8)
