USN-TOMBSTONE-CLEANUP.PL(8)                                                                System Manager's Manual                                                                USN-TOMBSTONE-CLEANUP.PL(8)



NAME
       usn-tombstone-cleanup.pl - Directory Server perl script for cleaning up tombstone entries.

SYNOPSIS
       usn-tombstone-cleanup.pl [-Z serverID] [-D rootdn] { -w password | -w - | -j filename } -s suffix -n backend [-m maxusn_to_delete] [-P protocol] [-h]

DESCRIPTION
       Deletes the tombstone entries maintained by the instance if the USN Plug-in is enabled.

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

       -s suffix
              Gives the name of the suffix containing the entries to clean/delete.

       -n backend
              Gives the name of the database containing the entries to clean/delete.  Example, userRoot.

       -m maxusn_to_delete
              Sets  the  upper  bound for entries to delete. All tombstone entries with an entryUSN value up to the specified maximum (inclusive) are deleted, but not past that USN value. If no maximum USN
              value is set, then all backend tombstone entries are deleted.

       -P protocol
              The connection protocol to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is  available  is  used.
              For LDAPI, AUTOBIND is also available for the root user.

       -h
              Display usage

EXAMPLE
       usn-tombstone-cleanup.pl -Z instance2 -D 'cn=directory manager' -w password -n userRoot -s 'ou=people,dc=example,dc=com' -P STARTTLS

              Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       usn-tombstone-cleanup.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                    USN-TOMBSTONE-CLEANUP.PL(8)
