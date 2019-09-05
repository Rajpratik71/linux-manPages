onesixtyone(1)                                                General Commands Manual                                               onesixtyone(1)

NAME
       onesixtyone — easy SNMP scanner

SYNOPSIS
       onesixtyone [options]  [host]  [community]

DESCRIPTION
       This manual page documents briefly the onesixtyone command.

       This manual page was written for the Debian distribution because the original program does not have a manual page.

       onesixtyone is a simple SNMP scanner which sends requests for the sysDescr value asynchronously with user-adjustable sending times.

OPTIONS
       -c communityfile
                 Specifies a file with community names to try

       -i inputfile
                 Specifies an input file with target hosts

       -o outputfile
                 Specifies a logfile

       -d-d -d   Debug mode, use twice for more information

       -w n ms   Waits n milliseconds between packets (default 10)

       -q        Quiet mode, do not print to stdout

AUTHOR
       This  manual page was written by Jose Parrella bureado@debian.org for the Debian system (but may be used by others).  Permission is granted
       to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 any later version published by
       the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

                                                                                                                                    onesixtyone(1)
