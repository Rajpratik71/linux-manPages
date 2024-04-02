IFSTAT(8)                                                                                           Linux                                                                                           IFSTAT(8)



NAME
       ifstat - handy utility to read network interface statistics

SYNOPSIS
       ifstat [ OPTIONS ] [ INTERFACE_LIST ]

       INTERFACE_LIST := INTERFACE_LIST | interface

DESCRIPTION
       ifstat  neatly  prints out network interface statistics.  The utility keeps records of the previous data displayed in history files and by default only shows difference between the last and the cur‐
       rent call.  Location of the history files defaults to /tmp/.ifstat.u$UID but may be overridden with the IFSTAT_HISTORY environment variable. Similarly,  the  default  location  for  xstat  (extended
       stats) is /tmp/.<xstat name>_ifstat.u$UID.

OPTIONS
       -h, --help
              Show summary of options.

       -V, --version
              Show version of program.

       -a, --ignore
              Ignore the history file.

       -d, --scan=SECS
              Sample statistics every SECS second.

       -e, --errors
              Show errors.

       -n, --nooutput
              Don't display any output.  Update the history file only.

       -r, --reset
              Reset history.

       -s, --noupdate
              Don't update the history file.

       -t, --interval=SECS
              Report average over the last SECS seconds.

       -z, --zeros
              Show entries with zero activity.

       -x, --extended=TYPE
              Show extended stats of TYPE. Supported types are:

                      cpu_hits - Counts only packets that went via the CPU.


ENVIRONMENT
       IFSTAT_HISTORY
              If set, it's value is interpreted as alternate history file path.

SEE ALSO
       ip(8)

AUTHOR
       ifstat was written by Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>.

       This manual page was written by Petr Sabata <contyk@redhat.com>.



iproute2                                                                                         28 Oct 2015                                                                                        IFSTAT(8)
