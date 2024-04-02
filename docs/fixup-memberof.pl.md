FIXUP-MEMBEROF.PL(8)                                                                       System Manager's Manual                                                                       FIXUP-MEMBEROF.PL(8)



NAME
       fixup-memberof.pl - Directory Server perl script for memberOf attributes.

SYNOPSIS
       fixup-memberof.pl [-Z serverID] [-D rootdn] { -w password | -w - | -j filename } -b baseDN [-f filter] [-P protocol] [-h]

DESCRIPTION
       Regenerates and updates memberOf on user entries to coordinate changes in group membership.

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

       -b baseDN
              The DN of the subtree containing the entries to update.

       -f filter
              An  LDAP  query filter to use to select the entries within the subtree to update. If there is no filter set, then the memberOf attribute is regenerated for every entry in the subtree that has
              the objectclass inetuser/inetadmin.

       -P protocol
              The connection protocol to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is  available  is  used.
              For LDAPI, AUTOBIND is also available for the root user.

       -h
              Display usage

EXAMPLE
       fixup-memberof.pl -Z instance1 -D 'cn=directory manager' -w password -b 'dc=example,dc=com' -P STARTTLS

              Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

       fixup-memberof.pl -w password -b 'dc=example,dc=com' -f 'uid=*'

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       fixup-memberof.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                           FIXUP-MEMBEROF.PL(8)
