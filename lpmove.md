lpmove(8)                                                                                         Apple Inc.                                                                                        lpmove(8)



NAME
       lpmove - move a job or all jobs to a new destination

SYNOPSIS
       lpmove [ -E ] [ -h server[:port] ] [ -U username ] job destination
       lpmove [ -E ] [ -h server[:port] ] [ -U username ] source destination

DESCRIPTION
       lpmove moves the specified job or all jobs from source to destination. job can be the job ID number or the old destination and job ID:

            lpmove 123 newprinter
            lpmove oldprinter-123 newprinter

OPTIONS
       The lpmove command supports the following options:

       -E
            Forces encryption when connecting to the server.

       -U username
            Specifies an alternate username.

       -h server[:port]
            Specifies an alternate server.

SEE ALSO
       cancel(1), lp(1),
       http://localhost:631/help

COPYRIGHT
       Copyright 2007-2013 by Apple Inc.



12 February 2006                                                                                     CUPS                                                                                           lpmove(8)
