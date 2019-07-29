bcron-exec(8)                                                 System Manager's Manual                                                bcron-exec(8)

NAME
       bcron-exec - Execute jobs on behalf of bcron-sched

SYNOPSIS
       bcron-exec [ wrapper ]

DESCRIPTION
       bcron-exec  reads  formatted  program execution instructions from standard input and executes the appropriate program.  If the execution of
       the program produces any output, an email is produced and sent to the recipient given in the instructions.

       bcron-exec should normally be run by bcron-start in conjunction with bcron-sched.

ENVIRONMENT
       TESTMODE
            If set, skip doing setuid, dump email to stdout instead of invoking sendmail.

SEE ALSO
       bcron-sched(8), bcron-start(8)

AUTHOR
       Bruce Guenter <bruce@untroubled.org>

                                                                                                                                     bcron-exec(8)
