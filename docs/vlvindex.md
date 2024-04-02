VLVINDEX(8)                                                                                System Manager's Manual                                                                                VLVINDEX(8)



NAME
       vlvindex - Directory Server script for VLV indexing

SYNOPSIS
       vlvindex [-Z serverID] -n backendname | {-s includesuffix}* -T vlvTag [-d debuglevel] [-v] [-h]

DESCRIPTION
       Creates  virtual  list view (VLV) indexes, known in the Directory Server Console as browsing indexes. VLV indexes introduce flexibility in the way search results are viewed.  VLV index configuration
       must already exist prior to running this script. The Directory Server must be stopped before running this script.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -n Backend Name
              The name of the LDBM database to reindex.  Example: userRoot

       -s includeSuffix
              Specifies suffixes to be included or the subtrees to be included

       -T vlvTag
              This is the name of the vlv index entry under cn=config.

       -d Debug Level
              Settings the debugging level.

       -v
              Display the version.

       -h
              Display the usage.

EXAMPLE
       vlvindex -n userRoot -T myVLVIndex -Z instance2

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       vlvindex was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                    VLVINDEX(8)
