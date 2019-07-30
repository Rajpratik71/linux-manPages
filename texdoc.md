TEXDOC(1)                                                                             Texdoc manual                                                                             TEXDOC(1)

NAME
       texdoc - find & view documentation in TeX Live

SYNOPSIS
       texdoc [OPTION...] NAME...
       texdoc ACTION

DESCRIPTION
       Try to find appropriate TeX documentation for the specified NAME(s). Alternatively, perform the given ACTION and exit.

ACTIONS
       -h, --help
              Print this help message.

       -V, --version
              Print the version number.

       -f, --files
              Print the list of configuration files used.

       --just-view FILE
              Display file, given with full path (no searching).

OPTIONS
       -w, --view
              Use view mode: start a viewer. (default)

       -m, --mixed
              Use mixed mode (view or list).

       -l, --list
              Use list mode: show a list of results.

       -s, --showall
              Use showall mode: show also "bad" results.

       -i, --interact
              Use interactive menus. (default)

       -I, --nointeract
              Use plain lists, no interaction required.

       -M, --machine
              Machine-readable output for lists (implies -I).

       -q, --quiet
              Suppress warnings and most error messages.

       -v, --verbose
              Print additional information (eg, viewer command).

       -D, --debug
              Activate all debug output (equal to "--debug=all").

       -dLIST, --debug=LIST
              Activate debug output restricted to LIST.

ENVIRONMENT
       PAGER, BROWSER, PDFVIEWER, PSVIEWER, DVIVIEWER, and *_texdoc of each.

FILES
       <texmf>/texdoc/texdoc.cnf, see output of the --files option.

REPORTING BUGS
       Report bugs to texdoc@tug.org.
       Texdoc home page: http://tug.org/texdoc/
       Source: https://github.com/TeX-Live/texdoc

COPYRIGHT
       Copyright 2018 Manuel Pe´gourie´-Gonnard, Takuto Asakura, Karl Berry, and Norbert Preining.
       License: GNU GPL version 3 or later http://gnu.org/licenses/gpl.html.
       This is free software: you are free to change and redistribute it.

SEE ALSO
       The full documentation is maintained as a PDF manual. The command

           texdoc texdoc

       should give you access to the complete manual.

Texdoc 3.0                                                                              June 2018                                                                               TEXDOC(1)
