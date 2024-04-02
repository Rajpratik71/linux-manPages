ppa-purge(1)                                                                            General Commands Manual                                                                           ppa-purge(1)

NAME
       ppa-purge - disables a PPA and reverts to official packages

SYNOPSIS
       ppa-purge [-h | [-d <distribution>] [-s <host>] [-p <ppaname>] <ppa:<ppaowner[/ppaname>]>]

DESCRIPTION
       This script provides a bash shell script capable of automatically downgrading all packages in a given PPA back to the ubuntu versions.

       You have to run it using root privileges because of the package manager.

OPTIONS
       -h     Display usage help.

       -p PPA name
              Name of the PPA to be reset, the default value is ppa.

       -s PPA host
              Address of the repository server, the default value is ppa.launchpad.net.

COPYRIGHT
       This  manual  page  is  Copyright  2010  Lorenzo  De Liso <blackz@ubuntu.com>.  Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public
       License, Version 3 or any later version published by the Free Software Foundation.

ppa-purge                                                                                     2010-08-23                                                                                  ppa-purge(1)
