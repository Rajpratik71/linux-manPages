UPDATE-PATTERNDB(1)                                              syslog-ng manual                                              UPDATE-PATTERNDB(1)

NAME
       update-patterndb - Merge patterndb files into a single database.

SYNOPSIS
       update-patterndb

DESCRIPTION
       This  program  can  be  used  to  merge  the  various  patterndb  files under /etc/syslog-ng/patterndb.d into a system-wide patterndb file,
       /var/lib/syslog-ng/patterndb.xml.

       It is a thin wrapper around pdbtool(1)'s merge command.

SEE ALSO
       pdbtool(1)

       For the full documentation of syslog-ng, see The syslog-ng Administrator Guide, available from

              http://www.balabit.com/support/documentation/

AUTHOR
       This manual page was written by Gergely Nagy <algernon@madhouse-project.org>.

COPYRIGHT
       Copyright © 2011 Gergely Nagy <algernon@madhouse-project.org>. Published under the GNU General Public License version 3, or at  your  opin‐
       ion, any later version as published by the FSF.

syslog-ng                                                         September 2011                                               UPDATE-PATTERNDB(1)
