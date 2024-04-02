bcron-start(8)                                                System Manager's Manual                                               bcron-start(8)

NAME
       bcron-start - Start the bcron scheduling system

SYNOPSIS
       bcron-start [ exec-wrapper ]

DESCRIPTION
       bcron-start

       bcron-exec should normally be run by bcron-start in conjunction with bcron-sched.

ENVIRONMENT
       BCRON_USER
            bcron-start drops root privileges and switches to this user before starting bcron-sched.

SEE ALSO
       bcron-sched(8), bcron-exec(8)

AUTHOR
       Bruce Guenter <bruce@untroubled.org>

                                                                                                                                    bcron-start(8)
