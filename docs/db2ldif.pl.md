DB2LDIF.PL(8)                                                                              System Manager's Manual                                                                              DB2LDIF.PL(8)



NAME
       db2ldif.pl - Directory Server perl script for exporting a database to a LDIF file

SYNOPSIS
       db2ldif.pl  [-Z  serverID] [-D rootdn] { -w password | -w - | -j pwfilename } [-P protocol] {-n backendname}* | {-s includeSuffix}* [{-x excludeSuffix}*] [-m] [-M] [-r] [-u] [-C] [-N] [-E] [-1] [-U]
       [-a filename] [-h]

DESCRIPTION
       Exports the contents of the database to LDIF. This script creates an entry in the directory that launches this dynamic task.

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
              The suffix DN to be included in the exported LDIF file.

       -x excludeSuffix
              The suffix DN to be excluded from the exported LDIF file.

       -a filename
              Name for the exported LDIF file.

       -P Protocol
              The connection protocol to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is  available  is  used.
              For LDAPI, AUTOBIND is also available for the root user.

       -m
              Minimize the base64 encodings in the exported LDIF file.

       -M
              Exported ldif is stored in multiple files. These files are named : <instance>_<filename>
              By default, all instances are stored in the filename specified by the -a option.

       -r
              Export replication data(information required to initialize a replica when the LDIF is imported).

       -u
              Do not export the unique-id attribute.

       -U
              Requests that the output LDIF is not folded.

       -C
              Uses only the main database file.

       -N
              Suppress printing sequential number

       -E
              Decrypts any encrypted data during export.

       -1
              Deletes, for reasons of backward compatibility, the first line of the LDIF file that gives the version of the LDIF standard.

       -h
              Display usage

EXAMPLE
       db2ldif.pl -Z instance3 -n userRoot -a /LDAP/ldif/export.ldif -P STARTTLS

              Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

       db2ldif.pl -s 'dc=example,dc=com' -a /LDAP/ldif/export.ldif -m -E -q

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       db2ldif.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                  DB2LDIF.PL(8)
