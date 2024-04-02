CLEANALLRUV.PL(8)                                                                          System Manager's Manual                                                                          CLEANALLRUV.PL(8)



NAME
       cleanallruv.pl - Directory Server perl script for issuing a cleanAllRUV task

SYNOPSIS
       cleanallruv.pl [-Z serverID] [-D rootdn] { -w password | -w - | -j filename } -b basedn -r rid  [-A] [-P protocol] [-h]

DESCRIPTION
       Creates and adds a cleanAllRUV task to the Directory Server

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

       -b basedn
              The replicated suffix that needs to be cleaned.

       -r rid
              The replica ID that needs to be removed.

       -P Protocol
              The  connection  protocol  to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is available is used.
              For LDAPI, AUTOBIND is also available for the root user.

       -A
              Abort a cleanAllRUV task that is currently running.

       -h
              Display usage

EXAMPLE
       cleanallruv.pl -Z instance1 -D 'cn=directory manager' -j /tmp/pw.txt -b 'dc=example,dc=com' -r 87 -P STARTTLS

              Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

       cleanallruv.pl -j /export/rootdnpw.txt -b 'dc=example,dc=com' -A -r 87

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       cleanallruv.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                              CLEANALLRUV.PL(8)
