LDIF2DB(8)                                                                                 System Manager's Manual                                                                                 LDIF2DB(8)



NAME
       ldif2db - Directory Server script for importing a LDIF file

SYNOPSIS
       ldif2db [-Z serverID] -n backendname {-s includesuffix}* [{-x excludesuffix}*] [-g [string] [-G namespace_id]] {-i ldiffile}* [-c chunksize] [-v] [-O] [-E] [-q] [-h]

DESCRIPTION
       Imports a LDIF file.  Either the option '-n' or '-s' must be used.  The server instance must be stopped prior to running this command.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -n Backend Name
              The name of the LDBM database to restore.  Example: userRoot

       -s includeSuffix
              Specifies the suffixes to be included or specifies the subtrees to be included.

       -x excludeSuffix
              Specifies the suffixes to be excluded or specifies the subtrees to be excluded.

       -i filename
              Name for the LDIF file to import.

       -c Chunk size
              The number of entries to process before starting a fresh pass during the import.  By default this is handled internally by the server.

       -O
              Requests that only the core database is created without attribute indexes.

       -v     Display version

       -g [string]
              Generates  a unique ID. Type none for no unique ID to be generated and deterministic for the generated unique ID to be name-based. By default, a time-based unique ID is generated.  When using
              the deterministic generation to have a name-based unique ID, it is also possible to specify the namespace for the server to use, as follows:

              -g deterministic namespaceId

              namespaceId is a string of characters in the format 00-xxxxxxxx-xxxxxxxx-xxxxxxxx-xxxxxxxx.

       -G namespace_id
              Generates a namespace ID as a name-based unique ID. This is the same as specifying the -g deterministic option.

       -E
              Encrypts data during import. This option is used only if database encryption is enabled.

       -v
              Display version

       -h
              Display usage

EXAMPLE
       ldif2db -Z instance1 -n userRoot -i /LDAP/ldif/data.ldif

       ldif2db -s "dc=example,dc=com" -i /LDAP/ldif/data.ldif

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       ldif2db was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                                     LDIF2DB(8)
