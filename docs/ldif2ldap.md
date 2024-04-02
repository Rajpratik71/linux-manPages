LDIF2LDAP(8)                                                                               System Manager's Manual                                                                               LDIF2LDAP(8)



NAME
       ldif2ldap - Directory Server script for adding entries

SYNOPSIS
       ldif2ldap [-Z serverID] [-D <rootdn>] -w <password> -f <ldifFile> [-P protocol] [-h]

DESCRIPTION
       Performs an import operation over LDAP to the Directory Server. To run this script, the server must be running.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -D Root DN
              The Directory Manager DN, or root DN.  If not specified, the script will search the server instance configuration for the value.

       -w password
              The rootdn password.

       -f LDIF file
              The LDIF file with the entries to add.

       -P Protocol
              The  connection  protocol  to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is available is used.
              For LDAPI, AUTOBIND is also available for the root user.

       -h
              Display the usage.

EXAMPLE
       ldif2ldap -Z instance3 -D 'cn=directory manager' -w password -f /LDAP/ldif/entries.ldif -P STARTTLS

       Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       ldif2ldap was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                   LDIF2LDAP(8)
