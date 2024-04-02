NTPSTAT(1)                                                                                 General Commands Manual                                                                                 NTPSTAT(1)



NAME
       ntpstat - Print NTP synchronisation status


SYNOPSIS
       ntpstat [-m MAXERROR]


DESCRIPTION
       ntpstat  is  a script which prints a brief summary of the system clock's synchronisation status when the ntpd or chronyd daemon is running.  It prints the time source (NTP server or reference clock)
       to which the system clock is currently synchronised, its stratum, how often is the server polled, and the maximum estimated error of the clock. The script uses the ntpq or chronyc program to  obtain
       the information from the daemon.

       Following  the NTPv4 specification (RFC 5905), if the time source becomes unreachable and there are no other sources that could be selected, the status of the clock will still be “synchronised”, but
       the maximum error will be slowly increasing.

       ntpstat exits with a status of 0 if the clock is synchronised, 1 if the clock is not synchronised, 2 if the status could not be determined, e.g.  when the daemon is not running, or 3 if  an  invalid
       command-line option was specified.


OPTIONS
       -m MAXERROR
               Specify  a maximum acceptable error of the clock in milliseconds. If the clock is synchronised, but its maximum estimated error is larger than MAXERROR, or is unknown, ntpstat will exit with
               a status of 1.

       -h      Print a help message.


SEE ALSO
       ntpd(8), ntpq(8), chronyd(8), chronyc(1)



ntpstat                                                                                                                                                                                            NTPSTAT(1)
