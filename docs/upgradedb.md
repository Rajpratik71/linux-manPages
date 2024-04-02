UPGRADEDB(8)                                                                               System Manager's Manual                                                                               UPGRADEDB(8)



NAME
       upgradedb - Directory Server script for upgrading the database

SYNOPSIS
       upgradedb [-a archivedir] [-Z serverID] [-f] [-v] [-d debuglevel] [-h]

DESCRIPTION
       Checks  the  DB version and if it has the old index formatting then it will rebuild the indexes.  This is usually needed after migrating from older versions of Directory Server.  This script must be
       run while the server is stopped.

OPTIONS
       A summary of options is included below:

       -n Backend Name
              The name of the LDBM database to reindex.  Example: userRoot

       -a Database directory
              The full path to the database directory.

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -N     Only checks whether any DNs in the database need to be updated.

       -h
              Display the usage.

EXAMPLE
       upgradedb -Z instance2

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       upgradedb was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.




                                                                                                March 31, 2017                                                                                   UPGRADEDB(8)
