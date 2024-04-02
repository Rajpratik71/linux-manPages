NS-SLAPD(8)                                                                                System Manager's Manual                                                                                NS-SLAPD(8)



NAME
       ns‐slapd - The main Directory Server daemon

SYNOPSIS
       ns-slapd -D configdir [-d debuglevel] [-i pidlogfile] [-v] [-V]

DESCRIPTION
       ns‐slapd launches the LDAP Directory Server

OPTIONS
       A summary of options is included below:

       -v     Show version of program.

       -D configdir
              Specifies the configuration directory pointing at the instance to be started (e.g. /etc/dirsrv/slapd‐localhost)

       -d debuglevel
              Specifies the debuglevel to be used

       -i pidlogfile
              Specifies file where the pid of the process will be stored

AUTHOR
       ns-slapd was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2001 Sun Microsystems, Inc. Used by permission.
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by Michele Baldessari <michele@pupazzo.org>, for the Debian project (but may be used by others).
       This  is  free  software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license is essentially the
       GNU General Public License version 2 with an exception for plug‐in distribution.



                                                                                                March 31, 2017                                                                                    NS-SLAPD(8)
