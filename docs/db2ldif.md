DB2LDIF(8)                                                                                 System Manager's Manual                                                                                 DB2LDIF(8)



NAME
       db2ldif - Directory Server script for exporting the database

SYNOPSIS
       db2ldif [-Z serverID] {-n backend_instance}* | {-s includeSuffix}* [{-x excludeSuffix}*] [-a outputFile] [-v] [-m] [-M] [-r] [-u] [-U] [-C] [-N] [-E] [-1] [-q] [-h]

DESCRIPTION
       Exports the contents of the database to a LDIF file. This script can be executed while the server is still running, except when using the -r option.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -n Backend Name
              The name of the LDBM database to reindex.  Example: userRoot

       -s includeSuffix
              Specifies suffixes to be included in the LDIF file.

       -x excludeSuffix
              Specifies suffixes to be excluded from the LDIF file.

       -a Output File
              The name for the LDIF file.

       -m
              Minimize the base64 encodings in the exported LDIF file.

       -M
              Exported ldif is stored in multiple files. These files are named : <instance>_<filename>
              By default, all instances are stored in the filename specified by the -a option.

       -r
              Export replication data(information required to initialize a replica when the LDIF is imported).

       -v     Display version

       -u
              Do not export the unique-id attribute.

       -U
              Requests that the output LDIF is not folded.

       -C
              Uses only the main database file.

       -N
              Suppress printing sequential number

       -E
              Decrypts any encrypted data during export.

       -1
              Deletes, for reasons of backward compatibility, the first line of the LDIF file that gives the version of the LDIF standard.

       -q
              Quiet mode.  Suppresses output of the script.

       -h
              Display the usage.

EXAMPLE
       db2ldif -Z instance3 -n userRoot -a /LDAP/ldif/export.ldif

       db2ldif -s 'dc=example,dc=com' -a /LDAP/ldif/export.ldif -m -E -q

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       db2ldif was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                     DB2LDIF(8)
