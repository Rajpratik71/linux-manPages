RDATE(8)                                                    BSD System Manager's Manual                                                   RDATE(8)

NAME
     rdate — set the system's date from a remote host

SYNOPSIS
     rdate [-46acnpsuv] [-o port] host

DESCRIPTION
     rdate displays and sets the local date and time from the host name or address given as the argument.  The time source may be an RFC 868 TCP
     protocol server, which is usually implemented as a built-in service of inetd(8), or an RFC 2030 protocol SNTP/NTP server.  By default, rdate
     uses the RFC 868 TCP protocol.

     The options are as follows:

     -4      Forces rdate to use IPv4 addresses only.

     -6      Forces rdate to use IPv6 addresses only.

     -a      Use the adjtime(2) call to gradually skew the local time to the remote time rather than just hopping.

     -c      Correct leap seconds.  Sometimes required when synchronizing to an NTP server.  When synchronizing using the RFC 868 protocol, use
             this option only if the server does not correctly account for leap seconds.  You can determine if you need this parameter if you sync
             against an NTP server (with this parameter) or (recommended) check with a local radio controlled watch or phone service.

     -n      Use SNTP (RFC 2030) instead of the RFC 868 time protocol.

     -o port
             Use port port instead of port 37.

     -p      Do not set, just print the remote time.

     -s      Do not print the time.

     -u      Use UDP instead of TCP as transport.

     -v      Verbose output.  Always show the adjustment.

FILES
     /var/log/wtmp  record of date resets and time changes

EXAMPLES
     To get the legal time in Germany, set the /etc/localtime symlink to /usr/share/zoneinfo/right/Europe/Berlin and issue the following command:

           # rdate -ncv ptbtime1.ptb.de

     The command of course assumes you have a working internet connection and DNS set up to connect to the server at Physikalisch-Technische
     Bundesanstalt in Braunschweig, Germany.

     To gradually adjust time once an hour after the first "step" adjustment, put the following line into root's crontab:

           58  *  *  *  *  rdate -ncav ptbtime1.ptb.de | logger -t NTP

     To to set the time through an ssh tunnel, use something like so:

           ssh -f -L 10037:time.example.com:37 tyr.example.com sleep 10
           rdate -a -o 10037 locahost

SEE ALSO
     date(1), adjtime(2), inetd(8), ntpd(8), timed(8)

AUTHORS
     This manual page was written by Christos Zoulas. It was changed by
     Anibal Monsalve Salazar for the Debian Project.

BSD                                                                May 31, 2007                                                                BSD
