SVINITD-CREATE(1)                                                  User Commands                                                 SVINITD-CREATE(1)

NAME
       svinitd-create - Create an init.d-script for a supervised process

SYNOPSIS
       svinitd-create [OPTION]... SERVICE [SERVICE...]

DESCRIPTION
       Create an init.d-script for a supervised process

       -h, --help
              Display help and exit

       -V, --version
              Display version and exit

       This  utility  prints  an init.d-wrapper script for a supervised process. You can specify more than one service name to control more super‐
       vised processes with one init.d script.

REPORTING BUGS
       Report bugs to Klaus Reimer <k@ailis.de>

COPYRIGHT
       Copyright © 2000-2011 by Klaus Reimer
       This is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the  Free
       Software Foundation; either version 2 of the License, or (at your option) any later version.

svinitd-create 0.6                                                   May 2011                                                    SVINITD-CREATE(1)
