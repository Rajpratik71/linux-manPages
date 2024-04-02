DAEMONLOGGER(1)                                               General Commands Manual                                              DAEMONLOGGER(1)

NAME
       daemonlogger - simple network logger and soft tap daemon

SYNOPSIS
       daemonlogger [Options]

DESCRIPTION
       daemonlogger is a simple network packet logger and soft tap daemon. It is able to log packets to file or mirror to another interface.

OPTIONS
   --help
       Show summary of options.

   -v
       Show version of program.

   -c <count>
       Log <count> packets and exit.

   -d
       Run as a daemon.

   -f <bpf file>
       Load bpf filter from file.

   -F
       Flush the pcap buffer for each packet.

   -g <group id>
       Set group to <group id>.

   -u <user name>
       Set user to <user name>.

   -i <interface>
       Set interface to grab data from to <interface>.

   -l <path>
       Set log directory to <path>.

   -m <count>
       Generate <count> number of log files and exit.

   -n <name>
       Set ouput file prefix to <name>.

   -o <interface>
       Disable logging, instead mirror traffic from -i <interface> to -o <interface>.

   -p <pidfile>
       Set PID filename to <pidfile>.

   -P <path>
       Set PID path to <path>.

   -r
       Activate ringbuffer mode.

   -R <pcap file>
       Read packets from <pcap file>

   -s <bytes>
       Automatically roll over the log file after <bytes>.

   -S <snaplen>
       Set number of bytes per packet to capture to <snaplen>.

   -t <seconds>
       Rollover  the  log  file  on time intervals.  Append an 'm' to rollover on minute boundaries, 'h' to rollover on hour boundaries and 'd' to
       rollover on day boundaries.  If no interval selector is used then the default rollover interval is in seconds.  For example, "-t 60"  rolls
       the  log  file  over  every  60  seconds  and  "-t  2h"  rolls  the  log  file over every two hours at the top of the hour.  In the case of
       minute/hour/day-based rollovers, the will round to the next highest hour.  For example, if the program is told to rollover  every  2  hours
       and is started 38 minutes into the current hour it will add 2 to the current hour and rollover as scheduled at the top of the hour at <cur‐
       rent hour> + 2.  If the program was started at 13:38 it would roll over the logfile at 15:00.

   -T <chroot dir>
       Chroot daemonlogger to <chroot dir>

   -z
       Select log file pruning behavior.  Omitting this switch results in the default mode being used where the oldest log  file  in  the  logging
       directory is pruned.  Setting the -z switch changes the behavior so that Daemonlogger will prune the oldest file from its current instanti‐
       ation and leave files from older runs in the same logging directory alone

RESOURCES
       The daemonlogger README can be found at /usr/share/doc/daemonlogger/README.gz
       The daemonlogger homepage can be found at <http://www.snort.org/users/roesch/Site/Daemonlogger/Daemonlogger.html>

AUTHOR
       daemonlogger was written by Martin Roesch <roesch@sourcefire.com>.

       This manual page was written by Chris Taylor <ctaylor@debian.org>, for the Debian project (but may be used by others).

                                                                 December 08, 2009                                                 DAEMONLOGGER(1)
