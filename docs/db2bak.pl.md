DB2BAK.PL(8)                                                                               System Manager's Manual                                                                               DB2BAK.PL(8)



NAME
       db2bak.pl - Directory Server perl script for creating a backup

SYNOPSIS
       db2bak.pl [-Z serverID] [-D rootdn] { -w password | -w - | -j filename }  [-t dbtype] [-a backupdir] [-A backupdir] [-P protocol] [-h]

DESCRIPTION
       Creates a backup of the Directory Server database.  The Directory Server must be started prior to running this script.

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

       -t database type
              The backend database type (default: ldbm database).

       -a backupdir
              The directory where the backup should be stored.  This directory is a symbolic link to the actual backup files located under "nsslapd-bakdir" directory that is set in the "cn=config" entry.

       -A backupdir
              This is similar to -a, except that a sub-directory of backupdir will be created for the backup, and the name of the sub-directory will be a timestamp of the form server-instance-date_time.

       -P Protocol
              The  connection  protocol  to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is available is used.
              For LDAPI, AUTOBIND is also available for the root user.

       -h
              Display usage

EXAMPLE
       db2bak.pl -Z instance1 -D 'cn=directory manager' -w password -a /LDAP/backups/20130305 -P LDAPI

              Note: LDAPI must be enabled to use this protocol.  If LDAPI is not available it will default to next strongest/available protocol automatically.

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       db2bak.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                   DB2BAK.PL(8)
