DN2RDN(8)                                                                                  System Manager's Manual                                                                                  DN2RDN(8)



NAME
       dn2rdn - Directory Server script to check for outdated index versions

SYNOPSIS
       dn2rdn [-Z serverID] [-h] [-f] [-v] [-d debuglevel]

DESCRIPTION
       Checks the database index version, and if it's in a old format, then it will rebuild the indexes.  The server instance needs to be stopped prior to running this script.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -d Debug Level
              Sets the debugging level.

       -f
              Force the upgrade.

       -v
              Display the version of the Directory Server.

       -h
              Display the usage.

EXAMPLE
       dn2rdn

       dn2rdn -Z instance3 -f

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       dn2rdn was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                      DN2RDN(8)
