needs-restarting(1)                                                                                                                                                                       needs-restarting(1)



NAME
       needs-restarting - report running processes that have been updated

SYNOPSIS
       needs-restarting [options]

DESCRIPTION
       needs-restarting is a program that reports a list of process ids that started running before they or some component that they use were updated.

OPTIONS
       -h, --help
              Display a help message, and then quit.

       -u, --useronly
              Show processes for my userid only.

       -r, --reboothint
              Only report whether a full reboot is required (returns 1) or not (returns 0).

       -s, --services
              List the affected systemd services only.


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.



                                                                                               13 January 2013                                                                            needs-restarting(1)
