INFADD(1)                                                                                  General Commands Manual                                                                                  INFADD(1)



NAME
       infadd - infinite additions to LDAP server

SYNOPSIS
       infadd -s suffix -u bindDN -w password [options]

DESCRIPTION
       infadd is used to measure performance of the add operation. It can span multiple threads in order to test the performance under heavy locking.

OPTIONS
       -h hostname
              hostname (default: localhost)

       -p port
              port (default: 389)

       -t threads
              number of threads to spin (default: 1)

       -d     use TCP no‐delay

       -q     quiet mode (no status updates)

       -v     verbose mode (give per‐thread statistics)

       -I num first uid (default: 0)

       -l count
              limit count; stops when the total count exceeds <count>

       -i msec
              sample interval in milliseconds (default: 10000)

       -R size
              generate <size> random names instead of using data files

       -z size
              add binary blob of average size of <size> bytes

SEE ALSO
       rsearch(1)

AUTHOR
       infadd was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2001 Sun Microsystems, Inc. Used by permission.
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by Michele Baldessari <michele@pupazzo.org>, for the Debian project (but may be used by others).
       This  is  free  software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license is essentially the
       GNU General Public License version 2 with an exception for plug‐in distribution.



                                                                                                March 31, 2017                                                                                      INFADD(1)
