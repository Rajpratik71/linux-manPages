AULAST:(8)                                                System Administration Utilities                                               AULAST:(8)

NAME
       aulast - a program similar to last

SYNOPSIS
       aulast [ options ] [ user ] [ tty ]

DESCRIPTION
       aulast  is  a  program  that prints out a listing of the last logged in users similarly to the program last and lastb. Aulast searches back
       through the audit logs or the given audit log file and displays a list of all users logged in (and out) based on the range of time  in  the
       audit  logs. Names of users and tty’s can be given, in which case aulast will show only those entries matching the arguments. Names of ttys
       can be abbreviated, thus aulast 0 is the same as last tty0.

       The pseudo user reboot logs in each time the system is rebooted. Thus last reboot will show a log of all reboots since  the  log  file  was
       created.

       The  main  difference  that  a user will notice is that aulast print events from oldest to newest, while last prints records from newest to
       oldest. Also, the audit system is not notified each time a tty or pty is allocated, so you may not see quite  as  many  records  indicating
       users and their tty's.

OPTIONS
       --bad  Report on the bad logins.

       --extract
              Write raw audit records used to create the displayed report into a file aulast.log in the current working directory.

       -ffile Use the file instead of the audit logs for input.

       --proof
              Print  out the audit event serial numbers used to determine the preceding line of the report. A Serial number of 0 is a place holder
              and not an actual event serial number. The serial numbers can be used to examine the actual audit records in more  detail.  Also  an
              ausearch query is printed that will let you find the audit records associated with that session.

       --stdin
              Take audit records from stdin.

EXAMPLES
       To see this month's logins
       ausearch --start this-month --raw | aulast --stdin

SEE ALSO
       last(1), lastb(1), ausearch(8), aureport(8).

AUTHOR
       Steve Grubb

Red Hat                                                              Nov 2008                                                           AULAST:(8)
