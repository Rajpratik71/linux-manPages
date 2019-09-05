MLHEAD(1)                                                          User Commands                                                         MLHEAD(1)

NAME
       mlhead - head frontend for multilog files

SYNOPSIS
       mlhead [OPTION]... SERVICE [CAT-OPTION]...

DESCRIPTION
       head frontend for multilog files

       -h, --help
              Display help and exit

       -V, --version
              Display version and exit

       This  utility is a frontend for head to easily head logfiles from services running under daemontools. Simply specify the service name (wich
       is the name of the service directory without leading path).  You can specify any head options after the service name. See the man page  for
       head for more infos.

REPORTING BUGS
       Report bugs to Klaus Reimer <k@ailis.de>

COPYRIGHT
       Copyright © 2000-2011 by Klaus Reimer
       This  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free
       Software Foundation; either version 2 of the License, or (at your option) any later version.

mlhead 0.6                                                           May 2011                                                            MLHEAD(1)
