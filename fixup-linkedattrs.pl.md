FIXUP-LINKEDATTRS.PL(8)                                                                    System Manager's Manual                                                                    FIXUP-LINKEDATTRS.PL(8)



NAME
       fixup-linkedattrs.pl - Directory Server perl script for creating a "fixup" task for linked attributes.

SYNOPSIS
       fixup-linkedattrs.pl [-Z serverID] [-D rootdn] { -w password | -w - | -j filename }  [-l linkDN] [-P protocol] [-h]

DESCRIPTION
       Creates the managed attributes in the user entries once the linking plug-in instance is created or updates the managed attributes to keep everything in sync after operations like replication or syn‐
       chronization.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -D Root DN
              The Directory Manager DN, or root DN.  If not specified, the script will search the server instance configuration for the value.

       -w password
              The rootdn password.

       -w -
              Prompt for the rootdn password.

       -j password filename
              The name of the file that contains the root DN password.

       -l linkDN
              Gives the target DN for which to update the linked attributes. If this is not set, then the default is to update all linked and managed attributes for the entire subtree or directory tree.

       -P Protocol
              The connection protocol to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is  available  is  used.
              For LDAPI, AUTOBIND is also available for the root user.

       -h
              Display usage

EXAMPLE
       fixup-linkedattrs.pl -Z instance1 -D 'cn=directory manager' -w password -P STARTTLS

              Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

       fixup-linkedattrs.pl -w password -l 'ou=people,dc=example,dc=com'

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       fixup-linkedattrs.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                        FIXUP-LINKEDATTRS.PL(8)
