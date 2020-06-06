DB2BAK(8)                                                                                  System Manager's Manual                                                                                  DB2BAK(8)



NAME
       db2bak - Directory Server script for making a backup of the database

SYNOPSIS
       db2bak [archivedir] [-Z serverID] [-q] [-v] [-h]

DESCRIPTION
       Creates a backup of the database.  This script can be executed while the server is running or stopped.

OPTIONS
       A summary of options is included below:

       archivedir
              The full path to the directory to store the backup.

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -v     Display version

       -q
              Quiet mode.  Reduces output of task.

       -h
              Display the usage.

EXAMPLE
       db2bak -Z instance2

              Makes a backup of the entire database for 'instance2', and stores it in the default server instance backup directory.

       db2bak /LDAP/backups/20130305

              Creates a backup of the database and stores it in specified location.

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       db2bak was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                      DB2BAK(8)
