DBVERIFY(8)                                                                                System Manager's Manual                                                                                DBVERIFY(8)



NAME
       dbverify - Directory Server script for indexing attributes

SYNOPSIS
       dbverify [-Z serverID] [-n backend] [-V] [-v] [-d debuglevel] [-h]

DESCRIPTION
       Verifies the backend database files. If the server crashes because of a corrupted database, this command can be used to verify the integrity of the different database files to help isolate any prob‐
       lems.  This script should be run while the server instacne is stopped.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -n Backend Name
              The name of the LDBM database to reindex.  Example: userRoot

       -a Database Directory
              Location of database if it is different than what is in the server configuration(e.g. backup directories)

       -d Debug Level
              Sets the debugging level.

       -V
              Verbose output.

       -v
              Display the version of the Directory Server.

       -h
              Display the usage.

EXAMPLE
       dbverify -Z instance3 -n userRoot -V


DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       dbverify was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                    DBVERIFY(8)
