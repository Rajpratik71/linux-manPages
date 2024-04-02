pidpersec(8)                                                  System Manager's Manual                                                 pidpersec(8)

NAME
       mdflush - Trace md flush events. Uses Linux eBPF/bcc.

SYNOPSIS
       mdflush

DESCRIPTION
       This  tool  traces  flush  events  by  md,  the Linux multiple device driver (software RAID). The timestamp and md device for the flush are
       printed.  Knowing when these flushes happen can be useful for correlation with unexplained spikes in disk latency.

       This works by tracing the kernel md_flush_request() function using dynamic tracing, and will need updating to match  any  changes  to  this
       function.

       Note that the flushes themselves are likely to originate from higher in the I/O stack, such as from the file systems.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Trace md flush events:
              # mdflush

FIELDS
       TIME   Time of the flush event (HH:MM:SS).

       PID    The  process  ID  that  was on-CPU when the event was issued. This may identify the cause of the flush (eg, the "sync" command), but
              will often identify a kernel worker thread that was managing I/O.

       COMM   The command name for the PID.

       DEVICE The md device name.

OVERHEAD
       Expected to be negligible.

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
       biosnoop(8)

USER COMMANDS                                                       2016-02-13                                                        pidpersec(8)
