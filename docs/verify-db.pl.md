VERIFY-DB.PL(8)                                                                            System Manager's Manual                                                                            VERIFY-DB.PL(8)



NAME
       verify-db.pl - Directory Server perl script for verifying the database.

SYNOPSIS
       verify-db.pl [-Z serverID] [ -a path ] [-h]

DESCRIPTION
       Verifies  the backend database files. If the server crashes because of a corrupted database, this script can be used to verify the integrity of the different database files to help isolate any prob‐
       lems.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -a path
              Gives the path to the database directory. If this option is not passed with the verify-db.pl command, then it uses the default database directory, /var/lib/dirsrv/slapd-instance_name/db.

       -h
              Display usage

EXAMPLE
       verify-db.pl -Z instance2 -a /var/lib/dirsrv/slapd-instance2/db

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       verify-db.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                VERIFY-DB.PL(8)
