cupsaccept(8)                                                                                     Apple Inc.                                                                                    cupsaccept(8)



NAME
       cupsaccept/cupsreject - accept/reject jobs sent to a destination

SYNOPSIS
       cupsaccept [ -E ] [ -U username ] [ -h hostname[:port] ] destination(s)
       cupsreject [ -E ] [ -U username ] [ -h hostname[:port] ] [ -r reason ] destination(s)

DESCRIPTION
       cupsaccept instructs the printing system to accept print jobs to the specified destinations.

       cupsreject  instructs  the printing system to reject print jobs to the specified destinations. The -r option sets the reason for rejecting print jobs. If not specified the reason defaults to "Reason
       Unknown".

OPTIONS
       The following options are supported by both cupsaccept and cupsreject:

       -E
            Forces encryption when connecting to the server.

       -U username
            Sets the username that is sent when connecting to the server.

       -h hostname[:port]
            Chooses an alternate server.

       -r "reason"
            Sets the reason string that is shown for a printer that is rejecting jobs.

COMPATIBILITY
       Unlike the System V printing system, CUPS allows printer names to contain any printable character except SPACE, TAB, "/", or "#".  Also, printer and class names are not case-sensitive.

       The CUPS versions of accept and reject may ask the user for an access password depending on the printing system configuration. This differs from the System V versions which require the root user  to
       execute these commands.

SEE ALSO
       cancel(1), cupsenable(8), lp(1), lpadmin(8), lpstat(1),
       http://localhost:631/help

COPYRIGHT
       Copyright 2007-2013 by Apple Inc.



12 February 2006                                                                                     CUPS                                                                                       cupsaccept(8)
