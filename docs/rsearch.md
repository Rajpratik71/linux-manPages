RSEARCH(1)                                                                                 General Commands Manual                                                                                 RSEARCH(1)



NAME
       rsearch - Stress test an LDAP server with search operations

SYNOPSIS
       rsearch -D binddn -w bindpw -s suffix -f filter [options]

DESCRIPTION
       Stress tests an LDAP server with search operations.

OPTIONS
       A summary of options is included below:

       -H     print Usage (this message)

       -h host
              ldap server host (default: localhost)

       -p port
              ldap server port (default: 389)

       -S scope
              search SCOPE [0,1,or 2]  (default: 2)

       -b     bind before every operation

       -u     don't unbind -- just close the connection

       -L     set linger -- connection discarded when closed

       -N     No operation -- just bind (ignore mdc)

       -v     verbose

       -y     nodelay

       -q     quiet

       -l     logging

       -m     operaton: modify non-indexed attr (description). -B required

       -M     operaton: modify indexed attr (telephonenumber). -B required

       -d     operaton: delete. -B required

       -c     operaton: compare. -B required

       -i file
              name file; used for the search filter

       -B file
              [DN and] UID file (use '-B \?' to see the format)

       -A attrs
              list of attributes for search request

       -a file
              list of attributes for search request in a file

       -- (use '-a \?' to see the format ; -a & -A are mutually exclusive)

       -n number
              (reserved for future use)

       -o number
              Search time limit, in seconds; (default: 30; no time limit: 0)

       -j number
              sample interval, in seconds  (default: 10)

       -t number
              threads  (default: 1)

       -T number
              Time limit, in seconds; cmd stops when exceeds <number>

       -V     show running average

       -C num take num samples, then stop

       -R num drop connection & reconnect every num searches

       -x     Use -B file for binding; ignored if -B is not given

AUTHOR
       rsearch was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2001 Sun Microsystems, Inc. Used by permission.
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by Michele Baldessari <michele@pupazzo.org>, for the Debian project (but may be used by others).
       This  is  free  software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license is essentially the
       GNU General Public License version 2 with an exception for plug-in distribution.



                                                                                                March 31, 2017                                                                                     RSEARCH(1)
