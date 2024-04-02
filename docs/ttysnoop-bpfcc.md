ttysnoop(8)                                                   System Manager's Manual                                                  ttysnoop(8)

NAME
       ttysnoop - Watch output from a tty or pts device. Uses Linux eBPF/bcc.

SYNOPSIS
       ttysnoop [-h] [-C] device

DESCRIPTION
       ttysnoop watches a tty or pts device, and prints the same output that is appearing on that device. It can be used to mirror the output from
       a shell session, or the system console.

       This works by use of kernel dynamic tracing of the tty_write() function.  This tool will need updating in case that kernel function changes
       in a future kernel version.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -C     Don't clear the screen.

       device Either a path to a tty device (eg, /dev/tty0) or a pts number (eg, the "3" from /dev/pts/3).

EXAMPLES
       Snoop output from /dev/pts/2
              # ttysnoop /dev/pts/2

       Snoop output from /dev/pts/2 (shortcut)
              # ttysnoop 2

       Snoop output from the system console
              # ttysnoop /dev/console

       Snoop output from /dev/tty0
              # ttysnoop /dev/tty0

OVERHEAD
       As the rate of tty_write() is expected to be very low (<100/s), the overhead of this tool is expected to be negligible.

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
       opensnoop(1)

USER COMMANDS                                                       2016-02-08                                                         ttysnoop(8)
