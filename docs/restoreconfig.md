RESTORECONFIG(8)                                                                           System Manager's Manual                                                                           RESTORECONFIG(8)



NAME
       restoreconfig - Directory Server script for restoring the Admin Server configuration

SYNOPSIS
       restoreconfig [ -Z serverID ] [-h]

DESCRIPTION
       Restores the most recently saved Admin Server configuration information to the NetscapeRoot partition under the /etc/dirsrv/slapd-instance_name/ directory.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -h
              Display the usage.

EXAMPLE
       restoreconfig

       restoreconfig -Z instance2

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       restoreconfig was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                               RESTORECONFIG(8)
