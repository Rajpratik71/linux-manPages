PWDHASH(1)                                                                                 General Commands Manual                                                                                 PWDHASH(1)



NAME
       pwdhash - Generator of password hashes

SYNOPSIS
       pwdhash [-D config‐dir] [-H] [-s scheme | -c comparepwd] password

DESCRIPTION
       Generates password hashes which can also be used in LDIF password fields.  This uses the Directory Server password generator.

OPTIONS
       A summary of options is included below:

       -H     Show summary of options.

       -s scheme
              Password scheme to be used (e.g. MD5, SHA1, SHA256, SHA512, SSHA, SSHA256, SSHA512)

       -c comparepassword
              Password to be compared against

       -D configdir
              Takes the password schema directly from the ns-slapd configuration

AUTHOR
       dbscan was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2001 Sun Microsystems, Inc. Used by permission.
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by Michele Baldessari <michele@pupazzo.org>, for the Debian project (but may be used by others).
       This  is  free  software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license is essentially the
       GNU General Public License version 2 with an exception for plug‐in distribution.



                                                                                                March 31, 2017                                                                                     PWDHASH(1)
