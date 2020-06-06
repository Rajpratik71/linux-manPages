NS-ACCOUNTSTATUS.PL(8)                                                                     System Manager's Manual                                                                     NS-ACCOUNTSTATUS.PL(8)



NAME
       ns-accountstatus.pl - Directory Server perl script for checking the status of entries.

SYNOPSIS
       ns-accountstatus.pl [-Z serverID] [-D rootdn] { -w password | -w - | -j filename } [-p port] [-h host] [-P protocol] {-I DN |
        -b basedn -f filter [-s scope]} [-i] [-g seconds]

DESCRIPTION
       Provides account status information to establish whether an entry or group of entries is inactivated.

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

       -I DN  Specifies the entry DN or role DN whose status is required.

       -h host
              Host name of the Directory Server.

       -p port
              Port number of the Directory Server.

       -b basedn
              The suffix DN from which to search from.

       -f filter
              The search filter used to find user entries.

       -s scope
              The search scope.  "base", "one, "sub".  Default is "sub"

       -i
              Only list entries that are inactivated.

       -g seconds
              Only display entries that will become inactive within the timeframe.


EXAMPLE
       ns-accountstatus.pl -Z instance3 -D 'cn=directory manager' -w password -I 'uid=user,ou=people,dc=example,dc=com'

       ns-accountstatus.pl -Z instance3 -D 'cn=directory manager' -w password -b 'dc=example,dc=com' -f "(uid=*)"

       ns-accountstatus.pl -Z instance3 -D 'cn=directory manager' -w password -b 'dc=example,dc=com' -f "(uid=*)" -g 86400

       ns-accountstatus.pl -w password -I 'uid=user,ou=people,dc=example,dc=com' -P STARTTLS
              Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       ns-accountstatus.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                         NS-ACCOUNTSTATUS.PL(8)
