SPLITINDEX(1)                                                                         User Commands                                                                         SPLITINDEX(1)

NAME
       splitindex - manual page for splitindex 0.2a

SYNOPSIS
       splitindex.pl [OPTION] ... INTERMEDIATE-INDEX-FILE [MAKEINDEX-OPTION] ...

       splitindex [OPTION] ... INTERMEDIATE-INDEX-FILE [MAKEINDEX-OPTION] ...

       java splitindex [OPTION] ... INTERMEDIATE-INDEX-FILE [MAKEINDEX-OPTION] ...

       tex splitindex

DESCRIPTION
       splitindex 0.2a Copyright (c) 2002 Markus Kohm <kohm@gmx.de>

       Split a single intermediate index file into multiple raw index files.

       Example: splitindex.pl foo.idx.

OPTIONS
       -h, --help
              show this help and terminate

       -m, --makeindex PROGNAME
              call PROGNAME instead of default `makeindex'.

       -i, --identify EXPRESSION
              use regular EXPRESSION to match entries (see also option --resultis and --suffixis).  Default is `^(\\indexentry)\[([^]]*)\](.*)$'.

       -r, --resultis PATTERN
              create line to be written from PATTERN after matching lines (see also option --identify).  Default is `$1$3'.

       -s, --suffixis PATTERN
              create suffix to be used from PATTERN after matching lines (see also option --identify).  Default is `-$2'.

       -v, --verbose
              be more verbose (can be used multiple to increase verbosity)

       --version
              show version and terminate

COPYRIGHT
       Copyright © 2002 Markus Kohm <kohm@gmx.de>

SEE ALSO
       The full documentation for splitindex is maintained as a LaTeX manual.  If the texdoc and splitindex programs are properly installed at your site, the command

              texdoc splitidx

       should give you access to the complete manual.

splitindex 0.2a                                                                         April 2013                                                                          SPLITINDEX(1)
