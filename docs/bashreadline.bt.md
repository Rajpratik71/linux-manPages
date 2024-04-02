bashreadline(8)                                               System Manager's Manual                                              bashreadline(8)

NAME
       bashreadline.bt - Print bash commands system wide. Uses bpftrace/eBPF.

SYNOPSIS
       bashreadline.bt

DESCRIPTION
       bashreadline traces the return of the readline() function using uretprobes, to show the bash commands that were entered interactively, sys‐
       tem wide. The entered command may fail: this is just showing what was entered.

       This program is also a basic example of bpftrace and uretprobes.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace bash commands system wide:
              # bashreadline.bt

FIELDS
       TIME   A timestamp on the output, in "HH:MM:SS" format.

       PID    The process ID for bash.

       COMMAND
              Entered command.

OVERHEAD
       As the rate of interactive bash commands is expected to be very low (<<100/s), the overhead of this program is expected to be negligible.

SOURCE
       This is from bpftrace.

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

       This is a bpftrace version of the bcc tool of the same name. The bcc tool may provide more options and customizations.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       opensnoop(8)

USER COMMANDS                                                       2018-09-06                                                     bashreadline(8)
