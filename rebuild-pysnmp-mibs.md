PYSNMP(1)                                                         [FIXME: manual]                                                        PYSNMP(1)

NAME
       rebuild-pysnmp-mibs - Rebuilds the mib modules for pysnmp from the original mib definitions.

SYNOPSIS
       rebuild-pysnmp-mibs [-s mib-text-dir] -d pysnmp-mib-rebuild-dir

DESCRIPTION
       rebuild-pysnmp-mibs is used to compile the original mib definitions into the format used by pysnmp. pysnmp-mib-rebuild-dir must contain the
       old compiled mibs (i.e. IF-MIB.py). rebuild-pysnmp-mibs will then try to find the original mib definitions and recompile them. By default
       rebuild-pysnmp-mibs searches in /usr/local/share/snmp, /usr/local/share/mibs, /usr/share/snmp and /usr/share/mibs.

       It is possible to specify another source directory with the -s mib-text-dir option. This directory will then be searched instead.

AUTHORS
       This program was written by Ilya Etingofilya@glas.net

       This manual page was written by Jan Luebbe jluebbe@lasnet.de for the Debian(TM) system (but may be used by others). Permission is granted
       to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 any later version published by
       the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

COPYRIGHT
       Copyright © 2006 Jan Luebbe

[FIXME: source]                                                  october 31, 2006                                                        PYSNMP(1)
