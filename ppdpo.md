ppdpo(1)                                                                                          Apple Inc.                                                                                         ppdpo(1)



NAME
       ppdpo - ppd message catalog generator

SYNOPSIS
       ppdpo [ -D name[=value] ] [ -I include-directory ] [ -o output-file ] source-file

DESCRIPTION
       ppdpo extracts UI strings from PPDC source files and updates either a GNU gettext or OS X strings format message catalog source file for translation.

       The -D option sets the named variable for use in the source file. It is equivalent to using the #define directive in the source file.

       The -I option specifies an alternate include directory; multiple -I options can be supplied to add additional directories.

       The -o option specifies the output file. The supported extensions are ".po" or ".po.gz" for GNU gettext format message catalogs and ".strings" for OS X strings files.

SEE ALSO
       ppdc(1), ppdhtml(1), ppdi(1), ppdmerge(1), ppdcfile(5)
       http://localhost:631/help

COPYRIGHT
       Copyright 2007-2013 by Apple Inc.



23 April 2012                                                                                        CUPS                                                                                            ppdpo(1)
