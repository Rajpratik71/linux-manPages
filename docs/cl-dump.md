CL-DUMP(1)                                                                                 General Commands Manual                                                                                 CL-DUMP(1)



NAME
       cl-dump - Dump and decode Directory Server replication change log

SYNOPSIS
       cl-dump [-h host] [-p port] [-D bind‐dn] -w bind‐password | -P bind‐cert
              [-r replica‐roots] [-o output‐file] [-c] [-v]


       cl-dump -i changelog‐ldif‐file‐with‐base64encoding [-o output‐file] [-c]

DESCRIPTION
       Dump and decode Directory Server replication change log

OPTIONS
       A summary of options is included below.

       -c     Dump and interpret CSN only. This option can be used with or without -i option.

       -D bind-dn
              Directory server's bind DN. Default to "cn=Directory Manager" if the option is omitted.

       -h host
              Directory server's host. Default to the server where the script is running.

       -i changelog‐ldif‐file‐with‐base64encoding
              If you already have a ldif-like changelog, but the changes in that file are encoded, you may use this option to decode that ldif-like changelog.

       -o output‐file
              Path name for the final result. Default to STDOUT if omitted.

       -p port
              Directory server's port. Default to 389.

       -P bind‐cert
              Pathname of binding certificate DB

       -r replica‐roots
              Specify replica roots whose changelog you want to dump. The replica roots may be separated by comma. All the replica roots would be dumped if the option is omitted.

       -v     Print the version of this script.

       -w bind‐password
              Password for the bind DN

RESTRICTIONS
       If you are not using -i option, the script should be run when the server is running, and from where the server's changelog directory is accessible.

SEE ALSO
       repl-monitor(1)

AUTHOR
       cl-dump was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2001 Sun Microsystems, Inc. Used by permission.
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by Michele Baldessari <michele@pupazzo.org>, for the Debian project (but may be used by others).
       This  is  free  software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license is essentially the
       GNU General Public License version 2 with an exception for plug-in distribution.



                                                                                                March 31, 2017                                                                                     CL-DUMP(1)
