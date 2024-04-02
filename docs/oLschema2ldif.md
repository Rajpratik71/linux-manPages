OLSCHEMA2LDIF(1)                                                                         System Administration tools                                                                         OLSCHEMA2LDIF(1)



NAME
       oLschema2ldif - Converts LDAP schema's to LDB-compatible LDIF

SYNOPSIS
       oLschema2ldif [-I INPUT-FILE] [-O OUTPUT-FILE]

DESCRIPTION
       oLschema2ldif is a simple tool that converts standard OpenLDAP schema files to a LDIF format that is understood by LDB.

OPTIONS
       -I input-file
           OpenLDAP schema to read. If none are specified, the schema file will be read from standard input.

       -O output-file
           File to write ldif version of schema to.

VERSION
       This man page is correct for version 4.0 of the Samba suite.

SEE ALSO
       ldb(7), ldbmodify, ldbdel, ldif(5)

AUTHOR
       ldb was written by Andrew Tridgell[1]. oLschema2ldif was written by Simo Sorce[2].

       If you wish to report a problem or make a suggestion then please see the http://ldb.samba.org/ web site for current contact and maintainer information.

NOTES
        1. Andrew Tridgell
           https://www.samba.org/~tridge/

        2. Simo Sorce
           mailto:idra@samba.org



Samba 4.0                                                                                         07/12/2017                                                                                 OLSCHEMA2LDIF(1)
