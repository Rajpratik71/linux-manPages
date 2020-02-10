cupsd(8)                                                                                        Apple Inc.                                                                                       cupsd(8)

NAME
       cupsd - cups scheduler

SYNOPSIS
       cupsd [ -c config-file ] [ -f ] [ -F ] [ -h ] [ -l ] [ -t ]

DESCRIPTION
       cupsd is the scheduler for CUPS. It implements a printing system based upon the Internet Printing Protocol, version 2.1. If no options are specified on the command-line then the default configu‐
       ration file /etc/cups/cupsd.conf will be used.

OPTIONS
       -c config-file
            Uses the named configuration file.

       -f   Run cupsd in the foreground; the default is to run in the background as a "daemon".

       -F   Run cupsd in the foreground but detach the process from the controlling terminal and current directory. This is useful for running cupsd from init(8).

       -h   Shows the program usage.

       -l   This option is passed to cupsd when it is run from launchd(8) or systemd(8).

       -t   Test the configuration file for syntax errors.

FILES
       /etc/cups/classes.conf
       /etc/cups/cups-files.conf
       /etc/cups/cupsd.conf
       /usr/share/cups/mime/mime.convs
       /usr/share/cups/mime/mime.types
       /etc/cups/printers.conf
       /etc/cups/subscriptions.conf

CONFORMING TO
       cupsd implements all of the required IPP/2.1 attributes and operations. It also implements several CUPS-specific administrative operations.

EXAMPLES
       Run cupsd in the background with the default configuration file:

           cupsd

       Test a configuration file called test.conf:

           cupsd -t -c test.conf

       Run cupsd in the foreground with a test configuration file called test.conf:

           cupsd -f -c test.conf

SEE ALSO
       backend(7), classes.conf(5), cups(1), cups-lpd(8), cupsd.conf(5), cupsd-helper(8), cupsd-logs(8), filter(7), launchd(8), mime.convs(5), mime.types(5), printers.conf(5), systemd(8),  CUPS  Online
       Help (http://localhost:631/help)

COPYRIGHT
       Copyright © 2007-2015 by Apple Inc.

8 July 2014                                                                                        CUPS                                                                                          cupsd(8)
