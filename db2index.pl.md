DB2INDEX.PL(8)                                                                             System Manager's Manual                                                                             DB2INDEX.PL(8)



NAME
       db2index.pl - Directory Server perl script for indexing a database

SYNOPSIS
       db2index.pl [-Z serverID] [-D rootdn] { -w password | -w - | -j filename } [-n backendname] [-P protocol] [-t attributeName[:indextypes[:matchingrules]]] [-T vlvTag] [-h]

DESCRIPTION
       Indexes attributes in the specified database.  If no attributes are specified, then all the attribute indexes will be regenerated.  The Directory Server must be started prior to running this script.

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

       -n Backend Name
              The name of the LDBM database to restore.  Example: userRoot

       -t attributeName[:indextypes[:matchingrules]]
              The attribute to index.  Optionally you can specify a comma separated list of index types: eq, sub, pres, and approx.  An optional matching rule OID can also be set.

       -T vlvTag
              This is the name of the vlv index entry under cn=config.

       -P Protocol
              The  connection  protocol  to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is available is used.
              For LDAPI, AUTOBIND is also available for the root user.

       -h
              Display usage

EXAMPLE
       db2index.pl -n userRoot -D 'cn=directory manager' -w password -t uid:eq,pres,sub:1.3.6.1.4.1.42.2.27.9.4.76.1 -t cn:eq,pres

       db2index.pl -Z instance3

       db2index.pl -Z instance2 -w password -s 'dc=example,dc=com' -t uid:eq:pres:sub -t sn -P STARTTLS

              Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       db2index.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                 DB2INDEX.PL(8)
