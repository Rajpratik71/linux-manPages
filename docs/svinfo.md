SVINFO(1)                                                          User Commands                                                         SVINFO(1)

NAME
       svinfo - Get infos about a supervised process

SYNOPSIS
       svinfo [OPTION]... SERVICE

DESCRIPTION
       Get infos about a supervised process

       -l, --log
              Get infos about the attached log process instead of the process itself

       -w, --when
              Output the time when the service was started

       -p, --pid
              Output the process id of the service (0 if not running)

       -s, --state
              Return the process state

              0=down and stopped, 1=up and stopped, 2=down and started, 3=up and started

       -h, --help
              Display help and exit

       -V, --version
              Display version and exit

       With this utility you can gather some information about a supervised process. If no parameters are specified this utility prints the status
       output from svstat.

REPORTING BUGS
       Report bugs to Klaus Reimer <k@ailis.de>

COPYRIGHT
       Copyright © 2000-2011 by Klaus Reimer
       This is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the  Free
       Software Foundation; either version 2 of the License, or (at your option) any later version.

svinfo 0.6                                                           May 2011                                                            SVINFO(1)
