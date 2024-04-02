SUFFIX2INSTANCE(8)                                                                         System Manager's Manual                                                                         SUFFIX2INSTANCE(8)



NAME
       suffix2instance - Directory Server script for finding a backend name

SYNOPSIS
       suffix2instance [-Z serverID] -s suffix [-h]

DESCRIPTION
       Maps a suffix to a backend name.  This script can be run while the server is running, or stopped.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -s Suffix DN
              The suffix DN to be mapped to a backend name.  Example: "dc=example,dc=com"

       -h
              Display the usage.

EXAMPLE
       suffix2instance -s 'dc=example,dc=com'

       suffix2instance -Z instance3 -s 'dc=example,dc=com'

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       suffix2instance was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                             SUFFIX2INSTANCE(8)
