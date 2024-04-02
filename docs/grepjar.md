GREPJAR(1)                                                                                           GNU                                                                                           GREPJAR(1)



NAME
       grepjar - search files in a jar file for a pattern

SYNOPSIS
       grepjar [-bcinsw] -e PATTERN | PATTERN files...

DESCRIPTION
       The "grepjar" program can be used to search files in a jar file for a pattern.

OPTIONS
       -b  Print byte offset of match.

       -c  Print number of matches.

       -i  Compare case-insensitively.

       -n  Print line number of each match.

       -s  Suppress error messages.

       -w  Force PATTERN to match only whole words.

       -e PATTERN
           Use PATTERN as regular expression.

       --help
           Print help, then exit.

       -V
       --version
           Print version number, then exit.

SEE ALSO
       fastjar(1), gcj(1), gij(1), gfdl(7) and the Info entry for gcj.

COPYRIGHT
       Copyright (C) 2002, 2007, 2008 Matthias Klose

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2, or (at your
       option) any later version. A copy of the license is included in the man page gfdl(7).



0.97                                                                                              2008-10-16                                                                                       GREPJAR(1)
