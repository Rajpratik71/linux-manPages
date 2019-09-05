MLCAT(1)                                                           User Commands                                                          MLCAT(1)

NAME
       mlcat - cat frontend for multilog files

SYNOPSIS
       mlcat [OPTION]... SERVICE [CAT-OPTION]...

DESCRIPTION
       cat frontend for multilog files

       -h, --help
              Display help and exit

       -V, --version
              Display version and exit

       This utility is a frontend for cat to easily cat logfiles from services running under daemontools. Simply specify the service name (wich is
       the name of the service directory without leading path).  You can specify any cat options after the service name. See the man page for  cat
       for more infos.

REPORTING BUGS
       Report bugs to Klaus Reimer <k@ailis.de>

COPYRIGHT
       Copyright © 2000-2011 by Klaus Reimer
       This  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free
       Software Foundation; either version 2 of the License, or (at your option) any later version.

mlcat 0.6                                                            May 2011                                                             MLCAT(1)
