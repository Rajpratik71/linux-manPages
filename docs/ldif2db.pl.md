LDIF2DB.PL(8)                                                                              System Manager's Manual                                                                              LDIF2DB.PL(8)



NAME
       ldif2db.pl - Directory Server perl script for importing a LDIF file

SYNOPSIS
       ldif2db.pl  -n backend [-Z serverID] [-D rootdn] { -w password | -w - | -j filename } [-P protocol] {-s includeSuffix}* [{-x excludeSuffix}*] [-O] [-c chunksize] [-h] [-g [string]] [-G namespace_id]
       {-i filename}*

DESCRIPTION
       Imports LDIF file(s) into the server. Either the option '-n' or '-s' must be used.  This script creates an entry in the directory that launches this dynamic task.

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

       -s includeSuffix
              Specifies the suffixes to be included or specifies the subtrees to be included.

       -x excludeSuffix
              Specifies the suffixes to be excluded or specifies the subtrees to be excluded.

       -i filename
              Name for the LDIF file to import.

       -g [string]
              Generates a unique ID. Type none for no unique ID to be generated and deterministic for the generated unique ID to be name-based. By default, a time-based unique ID is generated.  When  using
              the deterministic generation to have a name-based unique ID, it is also possible to specify the namespace for the server to use, as follows:

              -g deterministic namespaceId

              namespaceId is a string of characters in the format 00-xxxxxxxx-xxxxxxxx-xxxxxxxx-xxxxxxxx.

       -G namespace_id
              Generates a namespace ID as a name-based unique ID. This is the same as specifying the -g deterministic option.

       -P Protocol
              The  connection  protocol  to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is available is used.
              For LDAPI, AUTOBIND is also available for the root user.

       -O
              Requests that only the core database is created without attribute indexes.

       -c Chunk size
              The number of entries to process before starting a fresh pass during the import.  By default this is handled internally by the server.

       -h
              Display usage

EXAMPLE
       ldif2db.pl -Z instance1 -n userRoot -i /LDAP/ldif/data.ldif

       ldif2db.pl -s "dc=example,dc=com" -i /LDAP/ldif/data.ldif -D 'cn=directory manager' -w password  -P STARTTLS

              Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       ldif2db.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                  LDIF2DB.PL(8)
