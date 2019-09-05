RUPTIME(1)                                                  BSD General Commands Manual                                                 RUPTIME(1)

NAME
     ruptime — show host status of local machines

SYNOPSIS
     ruptime [-alrtu]

DESCRIPTION
     Ruptime gives a status line like uptime for each machine on the local network; these are formed from packets broadcast by each host on the
     network once a minute.

     Machines for which no status report has been received for 11 minutes are shown as being down.

     Options:

     -a      Users idle an hour or more are not counted unless the -a flag is given.

     -l      Sort by load average.

     -r      Reverses the sort order.

     -t      Sort by uptime.

     -u      Sort by number of users.

     The default listing is sorted by host name.

FILES
     /var/spool/rwho/whod.*  data files

SEE ALSO
     rup(1), rwho(1), uptime(1), rwhod(8)

HISTORY
     Ruptime appeared in 4.2BSD.

Linux NetKit (0.17)                                               August 15, 1999                                              Linux NetKit (0.17)
