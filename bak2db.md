BAK2DB(8)                                                                                  System Manager's Manual                                                                                  BAK2DB(8)



NAME
       bak2db - Directory Server script for restoring a backup

SYNOPSIS
       bak2db archivedir [-Z serverID] [-n backendname] [-q] [-v] [-h]

DESCRIPTION
       Restores the database from a archived backup.  The Directory Server must be stopped prior to running this script.

OPTIONS
       A summary of options is included below:

       archivedir
              The directory of the archived database.

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -n Backend Name
              The name of the LDBM database to restore.  Example: userRoot

       -q
              Quiet mode.  Reduces output of task.

       -v     Display version

       -h
              Display the usage.

EXAMPLE
       bak2db /LDAP/backups/20130305/ -Z instance1 -n userRoot

       bak2db /LDAP/backups/20130305/ -n example


DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       bak2db was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                      BAK2DB(8)
