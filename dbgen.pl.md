DBGEN.PL(1)                                                                                General Commands Manual                                                                                DBGEN.PL(1)



NAME
       dbgen.pl - Random LDIF database creator

SYNOPSIS
       dbgen.pl [OPTIONS] -o output_file -n number

DESCRIPTION
       Random LDIF database creator.  Used to generate large LDIF files for use in testing the Directory Server.

OPTIONS
       A summary of options is included below:

       -v     Verbose output

       -q     Quiet output

       -s suffix
              LDAP suffix. Default is 'dc=example,dc=com'

       -c CN naming style
              Naming style for RDN's. Default is UID

       -O organizationalPersons
              Organizationalpersons objectClass. Default is inetOrgPerson.

       -p piranha style ACI
              Piranha style aci. Default is barracua

       -r seed
              Seed number for random number generator

       -g     Print extra entries for orgchart

       -x     Suppress printing of the preamble

       -y     Suppress printing of Organizational Units

       -l     Location of directory containing data files, default is /usr/share/dirsrv/data

       -n number
              Number of entries to be generated

       -b number
              Beginning number for RDN e.g. uid=1 (ending number is -n value + beginning number)

       -j number
              0 pad numbers used in RDN to this many digits e.g. with 4 1 becomes 0001 (ignored unless -b number is specified)

       -u     Add groups containing uniquemembers; generate a group for every 100 user entries created that contains the 100 members

AUTHOR
       dbgen.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2001 Sun Microsystems, Inc. Used by permission.
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by Michele Baldessari <michele@pupazzo.org>, for the Debian project (but may be used by others).
       This  is  free  software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license is essentially the
       GNU General Public License version 2 with an exception for plug‐in distribution.



                                                                                                March 31, 2017                                                                                    DBGEN.PL(1)
