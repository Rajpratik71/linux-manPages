RTMON(8)                                                                                System Manager's Manual                                                                               RTMON(8)

NAME
       rtmon - listens to and monitors RTnetlink

SYNOPSIS
       rtmon [ options ] file FILE [ all | LISTofOBJECTS ]

DESCRIPTION
       This manual page documents briefly the rtmon command.

       rtmon listens on netlink socket and monitors routing table changes.

       rtmon can be started before the first network configuration command is issued.  For example if you insert:

       rtmon file /var/log/rtmon.log

       in  a  startup  script,  you  will be able to view the full history later.  Certainly, it is possible to start rtmon at any time. It prepends the history with the state snapshot dumped at the
       moment of starting.

OPTIONS
       rtmon supports the following options:

       -Version
              Print version and exit.

       help   Show summary of options.

       file FILE [ all | LISTofOBJECTS ]
              Log output to FILE. LISTofOBJECTS is the list of object types that we want to monitor. It may contain 'link', 'address',  'route'  and  'all'.  'link'  specifies  the  network  device,
              'address' the protocol (IP or IPv6) address on a device, 'route' the routing table entry and 'all' does what the name says.

       -family [ inet | inet6 | link | help ]
              Specify protocol family. 'inet' is IPv4, 'inet6' is IPv6, 'link' means that no networking protocol is involved and 'help' prints usage information.

       -4     Use IPv4. Shortcut for -family inet.

       -6     Use IPv6. Shortcut for -family inet6.

       -0     Use a special family identifier meaning that no networking protocol is involved. Shortcut for -family link.

USAGE EXAMPLES
       # rtmon file /var/log/rtmon.log
              Log to file /var/log/rtmon.log, then run:

       # ip monitor file /var/log/rtmon.log
              to display logged output from file.

SEE ALSO
       ip(8)

AUTHOR
       rtmon was written by Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>.

       This manual page was written by Michael Prokop <mika@grml.org>, for the Debian project (but may be used by others).

                                                                                                                                                                                              RTMON(8)
