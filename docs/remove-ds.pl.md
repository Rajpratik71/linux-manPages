REMOVE-DS.PL(8)                                                                            System Manager's Manual                                                                            REMOVE-DS.PL(8)



NAME
       remove-ds.pl - Remove an instance of Directory Server

SYNOPSIS
       remove-ds.pl [-a] [-f] [-d -d ... -d] -i instance

DESCRIPTION
       Removes  a  Directory  Server instance from the system.  The instance will be shutdown and the files will be removed.  The certificate database files will not be removed.  The instance configuration
       directory will have a .removed extension appended to it, which will contain the retained certificate database files.

OPTIONS
       A summary of options is included below:

       -a     Removes all files and directories belonging to the instance

       -f     Force removal

       -d     Enable debugging: adding more -d will make output more verbose

       -i instance
              The full name of the instance to remove (e.g. slapd‐example)

AUTHOR
       remove-ds.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.
       This is free software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license  is  essentially  the
       GNU General Public License version 2 with an exception for plug‐in distribution.



                                                                                                March 31, 2017                                                                                REMOVE-DS.PL(8)
