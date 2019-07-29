NEEDRESTART(1)                                                     User Commands                                                    NEEDRESTART(1)

NAME
       needrestart - needrestart

DESCRIPTION
       needrestart checks which daemons need to be restarted after library upgrades.

USAGE
       Usage:

              needrestart [-(v|q)] [-n] [-c <cfg>] [-r <mode>] [-f <fe>] [-(b|p)] [-kl]

       -v     be more verbose

       -q     be quiet

       -n     set default answer to 'no'

       -c <cfg>
              config filename

       -r <mode>
              set restart mode

       l      (l)ist only

       i      (i)nteractive restart

       a      (a)utomatically restart

       -b     enable batch mode

       -p     nagios plugin mode: makes output and exit codes nagios compatible

       -f <fe>
              overwrite debconf(7) frontend, sets the DEBIAN_FRONT environment variable to <fe>

       By using one of the following options only the specified checks are performed:

       -k     check for obsolete kernel

       -l     check for obsolete libraries

AUTHOR
       Thomas Liske <thomas@fiasko-nw.net>

COPYRIGHT
       2013 - 2015 (C) Thomas Liske [http://fiasko-nw.net/~thomas/]

       This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

UPSTREAM
       https://github.com/liske/needrestart

needrestart                                                        January 2015                                                     NEEDRESTART(1)
