bashreadline(8)                                               System Manager's Manual                                              bashreadline(8)

NAME
       bashreadline - Print entered bash commands system wide. Uses Linux eBPF/bcc.

SYNOPSIS
       bashreadline [-h] [-s SHARED]

DESCRIPTION
       bashreadline  traces the return of the readline() function using uprobes, to show the bash commands that were entered interactively, system
       wide. The entered command may fail: this is just showing what was entered.

       This program is also a basic example of eBPF/bcc and uprobes.

       This makes use of a Linux 4.5 feature (bpf_perf_event_output()); for kernels older than 4.5, see the version under tools/old, which uses an
       older mechanism

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -s     Specify  the  location of libreadline.so shared library when you failed to run the script directly with error: "Exception: could not
              determine address of symbol ´readline´". Default value is /lib/libreadline.so.

EXAMPLES
       Trace bash commands system wide:
              # bashreadline

FIELDS
       TIME   Time of the command (HH:MM:SS).

       PID    Process ID of the bash shell.

       COMMAND
              Entered command.

OVERHEAD
       As the rate of interactive bash commands is expected to be very low (<<100/s), the overhead of this program is expected to be negligible.

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
       opensnoop(8)

USER COMMANDS                                                       2016-01-28                                                     bashreadline(8)
