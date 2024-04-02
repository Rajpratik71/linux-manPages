DB2INDEX(8)                                                                                System Manager's Manual                                                                                DB2INDEX(8)



NAME
       db2index - Directory Server script for indexing attributes

SYNOPSIS
       db2index [-Z serverID] [-n backend | {-s includeSuffix}* -t attribute[:indextypes[:matchingrules]] -T vlvTag] [-v] [-h]

DESCRIPTION
       Reindexes the database index files.  The Directory Server must be stopped prior to running this script.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -n Backend Name
              The name of the LDBM database to reindex.  Example: userRoot

       -s includeSuffix
              Specifies suffixes to be included or the subtrees to be included

       -t attributeName[:indextypes[:matchingrules]]
              The attribute to index.  Optionally you can specify a comma separated list of index types: eq, sub, pres, and approx.  An optional matching rule OID can also be set.

       -T vlvTag
              This is the name of the vlv index entry under cn=config.

       -v     Display version

       -h
              Display the usage.

EXAMPLE
       db2index -n userRoot -t uid:eq,sub:1.3.6.1.4.1.42.2.27.9.4.76.1 -t cn:eq,pres

       db2index -Z instance2 -s 'dc=example,dc=com' -t uid:eq:pres:sub -t sn

       db2index -Z instance3

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       db2index was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                    DB2INDEX(8)
