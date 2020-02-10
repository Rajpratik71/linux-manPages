RENICE(1)                                                                                     User Commands                                                                                     RENICE(1)

NAME
       renice - alter priority of running processes

SYNOPSIS
       renice [-n] priority [-g|-p|-u] identifier...

DESCRIPTION
       renice  alters  the  scheduling priority of one or more running processes.  The first argument is the priority value to be used.  The other arguments are interpreted as process IDs (by default),
       process group IDs, user IDs, or user names.  renice'ing a process group causes all processes in the process group to have their scheduling priority altered.  renice'ing a user  causes  all  pro‐
       cesses owned by the user to have their scheduling priority altered.

OPTIONS
       -n, --priority priority
              Specify the scheduling priority to be used for the process, process group, or user.  Use of the option -n or --priority is optional, but when used it must be the first argument.

       -g, --pgrp
              Interpret the succeeding arguments as process group IDs.

       -p, --pid
              Interpret the succeeding arguments as process IDs (the default).

       -u, --user
              Interpret the succeeding arguments as usernames or UIDs.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

EXAMPLES
       The following command would change the priority of the processes with PIDs 987 and 32, plus all processes owned by the users daemon and root:

              renice +1 987 -u daemon root -p 32

NOTES
       Users other than the superuser may only alter the priority of processes they own, and can only monotonically increase their ``nice value'' (for security reasons) within the range 0 to 19, unless
       a nice resource limit is set (Linux 2.6.12 and higher).  The superuser may alter the priority of any process and set the priority to any value in the range -20 to 19.  Useful priorities are:  19
       (the affected processes will run only when nothing else in the system wants to), 0 (the ``base'' scheduling priority), anything negative (to make things go very fast).

FILES
       /etc/passwd
              to map user names to user IDs

SEE ALSO
       nice(1), getpriority(2), setpriority(2)

BUGS
       Non-superusers cannot increase scheduling priorities of their own processes, even if they were the ones that decreased the priorities in the first place.

       The  Linux  kernel (at least version 2.0.0) and linux libc (at least version 5.2.18) does not agree entirely on what the specifics of the systemcall interface to set nice values is.  Thus causes
       renice to report bogus previous nice values.

HISTORY
       The renice command appeared in 4.0BSD.

AVAILABILITY
       The renice command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.

util-linux                                                                                      July 2014                                                                                       RENICE(1)
