STATUS-DIRSRV(8)                                                                           System Manager's Manual                                                                           STATUS-DIRSRV(8)



NAME
       status-dirsrv - script for showing the status of Directory Server

SYNOPSIS
       status-dirsrv [<instance>]

DESCRIPTION
       status-dirsrv shows all the status of Directory Server instances on a system, or of a single instance if specified

OPTIONS
       <instance>
              Specifies a single Directory Server instance to show the status

USAGE
       Sample usage:

       status-dirsrv example

EXIT STATUS
       status-dirsrv returns 0 if all Directory Server instances are running.  Otherwise, it returns a positive value which represents the number of server instances which are not running.

       If a single Directory Server instance is specified, 0 is returned if the instance is running; 1 is returned if the instance is not running; 255 is returned if the instance does not exist.

AUTHOR
       status-dirsrv was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.
       This  is  free  software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license is essentially the
       GNU General Public License version 2 with an exception for plug-in distribution.



                                                                                                March 31, 2017                                                                               STATUS-DIRSRV(8)
