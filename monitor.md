MONITOR(8)                                                                                 System Manager's Manual                                                                                 MONITOR(8)



NAME
       monitor - Directory Server script for monitoring database performance

SYNOPSIS
       monitor [ -Z serverID ] [ -D rootdn ] [ -w password ] [ -b basedn ] [-P protocol] [-h]

DESCRIPTION
       Retrieves performance monitoring information. To run this script, the server must be running.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -D Root DN
              The Directory Manager DN, or root DN.  If not specified, the script will search the server instance configuration for the value.

       -w password
              The rootdn password.

       -b basedn
              The DN of a backend from cn=config.

       -P Protocol
              The  connection  protocol  to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is available is used.
              For LDAPI, AUTOBIND is also available for the root user.

       -h
              Display the usage.

EXAMPLE
       monitor -P STARTTLS

              Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

       monitor -Z instance2 -D 'cn=directory manager' -w password -b 'cn=monitor,cn=userRoot,cn=ldbm database,cn=plugins,cn=config'

              Note: You only need to bind as the root DN if you want to look at a backend monitor.

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       monitor was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                     MONITOR(8)
