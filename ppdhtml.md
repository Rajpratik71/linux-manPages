ppdhtml(1)                                                                                        Apple Inc.                                                                                       ppdhtml(1)



NAME
       ppdhtml - cups html summary generator

SYNOPSIS
       ppdhtml [ -D name[=value] ] [ -I include-directory ] source-file

DESCRIPTION
       ppdhtml reads a driver information file and produces a HTML summary page that lists all of the drivers in a file and the supported options.

       The -D option sets the named variable for use in the source file. It is equivalent to using the #define directive in the source file.

       The -I option specifies an alternate include directory; multiple -I options can be supplied to add additional directories.

SEE ALSO
       ppdc(1), ppdcfile(5), ppdi(1), ppdmerge(1), ppdpo(1)
       http://localhost:631/help

COPYRIGHT
       Copyright 2007-2013 by Apple Inc.



10 October 2008                                                                                      CUPS                                                                                          ppdhtml(1)
