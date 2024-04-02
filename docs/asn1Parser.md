ASN1PARSER(1)                                                                                   User Commands                                                                                   ASN1PARSER(1)



NAME
       asn1Parser - ASN.1 syntax tree generator for libtasn1

SYNOPSIS
       asn1Parser [OPTION] FILE

DESCRIPTION
       Read FILE with ASN.1 definitions and generate a C array that is used with libtasn1 functions.

       Mandatory arguments to long options are mandatory for short options too.

       -c, --check
              checks the syntax only

       -o, --output=FILE
              output file

       -n, --name=NAME
              array name

       -h, --help
              display this help and exit

       -v, --version
              output version information and exit

AUTHOR
       Written by Fabio Fiorina.

REPORTING BUGS
       Report bugs to: help-libtasn1@gnu.org
       GNU Libtasn1 home page: <http://www.gnu.org/software/libtasn1/>
       General help using GNU software: <http://www.gnu.org/gethelp/>

COPYRIGHT
       Copyright © 2014 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for asn1Parser is maintained as a Texinfo manual.  If the info and asn1Parser programs are properly installed at your site, the command

              info libtasn1

       should give you access to the complete manual.



asn1Parser (libtasn1) 4.9                                                                         June 2017                                                                                     ASN1PARSER(1)
