MAILMAIL(1)                                                                                MAILMAIL(1)

NAME
       mailmail - Twisted sendmail compatibility script

SYNOPSIS
       mailmail [recipient addresses]

DESCRIPTION
       mailmail reads RFC822 message text from standard input and delivers them, using SMTP, to a Mail
       Transfer Agent listening at 127.0.0.1:25.  It accepts (but does not necessarily implement) many
       of  the standard sendmail(1) options, but it is preferable to list only the recipient addresses
       on the command line, and include a From header within the message text indicating the sender.

AUTHOR
       Written by Jp Calderone

REPORTING BUGS
       To report a bug, visit http://twistedmatrix.com/trac/

COPYRIGHT
       Copyright © 2003-2008 Twisted Matrix Laboratories.
       This is free software; see the source for copying conditions.  There is NO warranty;  not  even
       for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

                                               July 2003                                   MAILMAIL(1)
