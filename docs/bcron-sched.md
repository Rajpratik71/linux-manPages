bcron-sched(8)                                                System Manager's Manual                                               bcron-sched(8)

NAME
       bcron-sched - bcron system scheduler

SYNOPSIS
       bcron-sched

DESCRIPTION
       bcron-sched  reads  job  descriptions  from stored crontabs, determines when they need to be run, and writes execution commands to standard
       output for bcron-exec to execute.

       bcron-sched should normally be run by bcron-start in conjunction with bcron-exec.

SIGNALS
       SIGUSR1
            On receipt of the SIGUSR1 signal, bcron-sched will dump a set of log messages describing all the jobs it is scheduling.

ENVIRONMENT
       BCRON_SPOOL
            The spool directory for bcron.  Defaults to /var/spool/cron.

FILES
       /var/spool/cron/crontabs/crontabs

       /var/spool/cron/crontabs/trigger

SEE ALSO
       bcron-exec(8), bcron-start(8), bcrontab(1)

AUTHOR
       Bruce Guenter <bruce@untroubled.org>

                                                                                                                                    bcron-sched(8)
