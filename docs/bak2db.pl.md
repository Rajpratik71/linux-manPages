BAK2DB.PL(8)                                                                               System Manager's Manual                                                                               BAK2DB.PL(8)



NAME
       bak2db.pl - Directory Server perl script for restoring a backup

SYNOPSIS
       bak2db.pl -a archivedir [-Z serverID] [-D rootdn] { -w password | -w - | -j filename }  [-t dbtype] [-n backendname] [-P protocol] [-h]

DESCRIPTION
       Restores a database from a backup. The Directory Server must be started prior to running this script.

OPTIONS
       A summary of options is included below:

       -a archivedir
              The directory of the archived database.

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

       -t database type
              The backend database type (default: ldbm database).

       -n Backend Name
              The name of the LDBM database to restore.  Example: userRoot

       -P Protocol
              The  connection  protocol  to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is available is used.
              For LDAPI, AUTOBIND is also available for the root user.

       -h
              Display usage

EXAMPLE
       bak2db.pl -a /LDAP/backups/20130305/ -D 'cn=directory manager' -w password -n userRoot -P LDAPS

              Note: security must be enabled to use protocol LDAPS.  If LDAPS is not available it will default to next strongest/available protocol automatically.

       bak2db.pl -a /LDAP/backups/20130305/ -Z instance2 -w password -n example -P LDAPI

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       bak2db.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                   BAK2DB.PL(8)
