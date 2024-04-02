DSKTUNE(1)                                                                                 General Commands Manual                                                                                 DSKTUNE(1)



NAME
       dsktune - reports memory, network, and file system tuning settings which can affect the performance of the Directory Server

SYNOPSIS
       dsktune [-q] [-c] [-D] [-v] [-i installdir]

DESCRIPTION
       Reports memory, network, and file system tuning settings which can affect the performance of the Directory Server

OPTIONS
       A summary of options is included below:

       -q     dsktune only reports essential settings

       -c     dsktune only reports tuning information for client machines

       -D     dsktune also reports the commands executed

       -v     dsktune only reports its release version date

       -i installdir
              specify alternate server installation directory

AUTHOR
       dsktune was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2001 Sun Microsystems, Inc. Used by permission.
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by Michele Baldessari <michele@pupazzo.org>, for the Debian project (but may be used by others).
       This  is  free  software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license is essentially the
       GNU General Public License version 2 with an exception for plug-in distribution.



                                                                                                March 31, 2017                                                                                     DSKTUNE(1)
