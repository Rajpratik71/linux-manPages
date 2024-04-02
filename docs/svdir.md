SVDIR(1)                                                           User Commands                                                          SVDIR(1)

NAME
       svdir - Find daemontools service directory

SYNOPSIS
       svdir [OPTION]...

DESCRIPTION
       Find daemontools service directory

       -h, --help
              Display help and exit

       -V, --version
              Display version and exit

       This  utility  tries  to  find the daemontools service directory and print it to stdout. It first checks the current directory of a running
       svscan process and then it checks some default locations like /var/lib/svscan and /service. It returns 0 if it have found the location  and
       1 if not.

REPORTING BUGS
       Report bugs to Klaus Reimer <k@ailis.de>

COPYRIGHT
       Copyright © 2000-2011 by Klaus Reimer
       This  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free
       Software Foundation; either version 2 of the License, or (at your option) any later version.

svdir 0.6                                                            May 2011                                                             SVDIR(1)
