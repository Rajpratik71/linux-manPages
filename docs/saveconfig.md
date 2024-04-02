SAVECONFIG(8)                                                                              System Manager's Manual                                                                              SAVECONFIG(8)



NAME
       saveconfig - Directory Server script for saving the Admin Server configuration

SYNOPSIS
       saveconfig [ -Z serverID ] [-h]

DESCRIPTION
       Makes a backup of the Admin Server configuration information and stores it in /var/lib/dirsrv/slapd-instance_name/bak.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -h
              Display the usage.

EXAMPLE
       saveconfig

       saveconfig -Z instance3

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       saveconfig was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2013                                                                                  SAVECONFIG(8)
