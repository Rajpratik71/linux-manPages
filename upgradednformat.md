UPGRADEDNFORMAT(8)                                                                         System Manager's Manual                                                                         UPGRADEDNFORMAT(8)



NAME
       upgradednformat - Directory Server script for upgrading the DN format

SYNOPSIS
       upgradednformat -n backendname -a database_directory [-Z serverID] [-N] [-h]

DESCRIPTION
       Updates  older-style  DN  syntaxes  to  RFC 4514-style DN syntaxes for migrated databases.  This is usually needed after migrating from an older version of Directory Server.  This script must be run
       while the server is stopped.

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
       upgradednformat -n userRoot -a /var/lib/dirsrv/slapd-instance2/db -Z instance2

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       upgradednformat was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                             UPGRADEDNFORMAT(8)
