SCHEMA-RELOAD.PL(8)                                                                        System Manager's Manual                                                                        SCHEMA-RELOAD.PL(8)



NAME
       schema-reload.pl - Directory Server perl script for updating the schema.

SYNOPSIS
       schema-reload.pl [-Z serverID] [-D rootdn] { -w password | -w - | -j filename } [-P protocol] [-d schemadir] [-h]

DESCRIPTION
       Manually reloads the schema files used by the Directory Server instance, either in the default location, or in user-specified locations.

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

       -d schemadir
              Gives the full path to the directory where the schema file is located. If this is not specified, the script uses the default schema directory, /etc/dirsrv/schema.

       -P protocol
              The  connection  protocol  to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is available is used.
              For LDAPI, AUTOBIND is also available for the root user.

       -h
              Display usage

EXAMPLE
       schema-reload.pl -Z instance3 -D 'cn=directory manager' -w password -P STARTTLS -d /LDAP/schema/

              Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       schema-reload.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                            SCHEMA-RELOAD.PL(8)
