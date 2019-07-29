USLEEP(1)                                                                                   The SuSE boot concept                                                                                   USLEEP(1)



NAME
       Usleep - sleep for the specified number of microseconds

SYNOPSIS
       usleep [ usec ]

DESCRIPTION
       usleep pauses for the number of usec microseconds. The default is 1 microsecond.  If 0 microseconds are specified sched_yield(2) is called.

BUGS
       The usleep program uses the usleep(3) function and therefore shows the same weaknesses by any system activity.

SEE ALSO
       usleep(3), sleep(1), sleep(3), sched_yield(2).

COPYRIGHT
       2001 Werner Fink, 2001 SuSE GmbH Nuernberg, Germany.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Jan 31, 2001                                                                                       USLEEP(1)
