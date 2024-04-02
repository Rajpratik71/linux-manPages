NS-NEWPWPOLICY.PL(8)                                                                       System Manager's Manual                                                                       NS-NEWPWPOLICY.PL(8)



NAME
       ns-newpwpolicy.pl - Directory Server perl script for preparing new password policies.

SYNOPSIS
       ns-newpwpolicy.pl [-Z serverID] [-v] [-D rootdn] { -w password | -j filename } [-P protocol] [-p port] [-h host] -U UserDN -S SuffixDN

DESCRIPTION
       Adds entries required for implementing the user- and subtree-level password policy.

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

       -P Protocol
              The  connection  protocol  to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is available is used.
              For LDAPI, AUTOBIND is also available for the root user.

       -h host
              Host name of the Directory Server.

       -p port
              Port number of the Directory Server.

       -U userDN
              Specifies the DN of the user entry that needs to be updated with user-level password policy attributes.

       -S suffixDN
              Specifies the DN of the suffix entry that needs to be updated with subtree-level password policy attributes.

       -v
              Display verbose output

EXAMPLE
       ns-newpwpolicy.pl -Z instance3 -D 'cn=directory manager' -w password -P STARTTLS -U 'uid=user,ou=people,dc=example,dc=com'

              Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       ns-newpwpolicy.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                           NS-NEWPWPOLICY.PL(8)
