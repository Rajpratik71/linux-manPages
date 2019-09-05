MLTAIL(1)                                                          User Commands                                                         MLTAIL(1)

NAME
       mltail - tail frontend for multilog files

SYNOPSIS
       mltail [OPTION]... SERVICE [TAIL-OPTION]...

DESCRIPTION
       tail frontend for multilog files

       -f, --follow
              Output appended data as the file grows

       -h, --help
              Display help and exit

       -V, --version
              Display version and exit

       This  utility is a frontend for tail to easily tail logfiles from services running under daemontools. Simply specify the service name (wich
       is the name of the service directory without leading path).  You can specify any tail options after the service name. See the man page  for
       tail for more infos.

REPORTING BUGS
       Report bugs to Klaus Reimer <k@ailis.de>

COPYRIGHT
       Copyright © 2000-2011 by Klaus Reimer
       This  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free
       Software Foundation; either version 2 of the License, or (at your option) any later version.

mltail 0.6                                                           May 2011                                                            MLTAIL(1)
