UPTIME(1)                                                                                       User Commands                                                                                       UPTIME(1)



NAME
       uptime - tell how long the system has been running

SYNOPSIS
       uptime [OPTION]... [FILE]

DESCRIPTION
       Print the current time, the length of time the system has been up, the number of users on the system, and the average number of jobs in the run queue over the last 1, 5 and 15 minutes.  Processes in
       an uninterruptible sleep state also contribute to the load average.  If FILE is not specified, use /var/run/utmp.  /var/log/wtmp as FILE is common.

       --help display this help and exit

       --version
              output version information and exit

AUTHOR
       Written by Joseph Arceneaux, David MacKenzie, and Kaveh Ghazi.

REPORTING BUGS
       GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
       Report uptime translation bugs to <http://translationproject.org/team/>

COPYRIGHT
       Copyright © 2016 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       Full documentation at: <http://www.gnu.org/software/coreutils/uptime>
       or available locally via: info '(coreutils) uptime invocation'



GNU coreutils 8.25                                                                               January 2016                                                                                       UPTIME(1)
