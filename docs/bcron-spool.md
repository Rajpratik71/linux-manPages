bcron-spool(8)                                                System Manager's Manual                                               bcron-spool(8)

NAME
       bcron-spool - Manage user crontab submissions

SYNOPSIS
       envuidgid $BCRON_USER unixserver -U /var/run/bcron-spool bcron-spool

DESCRIPTION
       bcron-spool  manipulates  the  bcron spool on behalf of users.  It accepts one of three commands: List an existing file, remove an existing
       file, copy given data into a new file.  The name of the file in the spool directory  is  restricted  to  the  username  of  the  connecting
       process.

ENVIRONMENT
       BCRON_SPOOL
            The spool directory for bcron.  Defaults to /var/spool/cron.

SEE ALSO
       bcron-sched(8), bcrontab(1)

AUTHOR
       Bruce Guenter <bruce@untroubled.org>

                                                                                                                                    bcron-spool(8)
