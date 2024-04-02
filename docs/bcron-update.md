bcron-update(8)                                               System Manager's Manual                                              bcron-update(8)

NAME
       bcron-update - Update system crontabs.

SYNOPSIS
       bcron-update path [ path ...  ]

DESCRIPTION
       bcron-update  polls  the  named  files or directories periodically to see if there are any new, changed, or removed files.  When it detects
       changes, it mirrors those changes into the crontab spool directory.  bcron-update runs as root in order to be able  to  read  system  files
       that would potentially be unreadable otherwise.

       On Debian, if path is a directory, bcron-update skips files in this directory with names that do not solely consist of lower- and uppercase
       letters ('a'-'z', 'A'-'Z'), digits ('0'-'9'), underscores ('_'), and hyphens ('-').

EXAMPLES
       To mirror modern vixie-cron's behavior, use:
       bcron-update /etc/crontab /etc/cron.d

ENVIRONMENT
       BCRON_SPOOL
            The spool directory for bcron.  Defaults to /var/spool/cron.

       BCRON_USER
            After writing files and before moving them into their final location, bcron-update changes the ownership of the file to this  user  so
            that bcron-sched can read them.

SEE ALSO
       bcron-sched(8)

DIAGNOSTICS
       bcron-update outputs three different kinds of messages about actions it is taking.

       Rescanning /etc/cron.d
            The named directory has been modified, and will be scanned to determine what files have been added or deleted.

       -/etc/cron.d/oldfile
            The named file no longer exists and will be removed from the spool.

       +/etc/cron.d/newfile
            The named file was either created or modified since the last scan, and will be copied into the spool.

AUTHOR
       Bruce Guenter <bruce@untroubled.org>

                                                                                                                                   bcron-update(8)
