CHRT(1)                                                                                       User Commands                                                                                       CHRT(1)

NAME
       chrt - manipulate the real-time attributes of a process

SYNOPSIS
       chrt [options] priority command [argument...]
       chrt [options] -p [priority] pid

DESCRIPTION
       chrt sets or retrieves the real-time scheduling attributes of an existing pid, or runs command with the given attributes.  Both the policy (one of SCHED_OTHER, SCHED_FIFO, SCHED_RR, SCHED_BATCH,
       or SCHED_IDLE) and the priority can be set and retrieved.

       The SCHED_BATCH policy is supported since Linux 2.6.16.  The SCHED_IDLE policy is supported since Linux 2.6.23.

       The SCHED_RESET_ON_FORK flag for policies SCHED_RR and SCHED_FIFO is supported since Linux 2.6.31.

OPTIONS
       -a, --all-tasks
              Set or retrieve the scheduling attributes of all the tasks (threads) for a given PID.

       -b, --batch
              Set scheduling policy to SCHED_BATCH (Linux-specific). The priority argument has to be set to zero.

       -f, --fifo
              Set scheduling policy to SCHED_FIFO.

       -i, --idle
              Set scheduling policy to SCHED_IDLE (Linux-specific). The priority argument has to be set to zero.

       -m, --max
              Show minimum and maximum valid priorities, then exit.

       -o, --other
              Set policy scheduling policy to SCHED_OTHER.

       -p, --pid
              Operate on an existing PID and do not launch a new task.

       -R, --reset-on-fork
              Add SCHED_RESET_ON_FORK flag to the SCHED_FIFO or SCHED_RR scheduling policy (Linux-specific).

       -r, --rr
              Set scheduling policy to SCHED_RR.  When policy is not defined the SCHED_RR is used as default.

       -v, --verbose
              Show status information.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

USAGE
       The default behavior is to run a new command:
              chrt priority command [arguments]

       You can also retrieve the real-time attributes of an existing task:
              chrt -p pid

       Or set them:
              chrt -r -p priority pid

PERMISSIONS
       A user must possess CAP_SYS_NICE to change the scheduling attributes of a process.  Any user can retrieve the scheduling information.

NOTES
       Only SCHED_FIFO, SCHED_OTHER and SCHED_RR are part of POSIX 1003.1b Process Scheduling. The other scheduling attributes may be ignored on some systems.

       Linux default scheduling policy is SCHED_OTHER.

SEE ALSO
       taskset(1), nice(1), renice(1)

       See sched_setscheduler(2) for a description of the Linux scheduling scheme.

AUTHOR
       Written by Robert M. Love.

COPYRIGHT
       Copyright © 2004 Robert M. Love.  This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

AVAILABILITY
       The chrt command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.

util-linux                                                                                     August 2014                                                                                        CHRT(1)
