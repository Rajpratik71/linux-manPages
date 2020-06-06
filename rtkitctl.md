RTKITCTL(8)                                                                              System Manager's Manual                                                                              RTKITCTL(8)

NAME
       rtkitctl - Realtime Policy and Watchdog daemon control

SYNOPSIS
       rtkitctl [options]

DESCRIPTION
       RealtimeKit  is  a D-Bus system service that changes the scheduling policy of user processes/threads to SCHED_RR (i.e. realtime scheduling mode) on request. It is intended to be used as a secure
       mechanism to allow real-time scheduling to be used by normal user processes.

OPTIONS
       -h, --help
              Show a summary of options.

       --version
              Show version.

       --reset-known
              Reset real-time status of known threads.

       --reset-all
              Reset real-time status of all threads.

       --start
              Start RealtimeKit if it is not running already.

       -k, --exit
              Terminate running RealtimeKit daemon.

AUTHOR
       RealtimeKit was written by Lennart Poettering <lennart@poettering.net>.

                                                                                               July 1, 2009                                                                                   RTKITCTL(8)
