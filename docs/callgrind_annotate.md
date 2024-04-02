CALLGRIND ANNOTATE(1)                                             Release 3.12.0                                             CALLGRIND ANNOTATE(1)

NAME
       callgrind_annotate - post-processing tool for the Callgrind

SYNOPSIS
       callgrind_annotate [options] [callgrind-out-file [source-files...]]

DESCRIPTION
       callgrind_annotate takes an output file produced by the Valgrind tool Callgrind and prints the information in an easy-to-read form.

OPTIONS
       -h --help
           Show summary of options.

       --version
           Show version of callgrind_annotate.

       --show=A,B,C [default: all]
           Only show figures for events A,B,C.

       --sort=A,B,C
           Sort columns by events A,B,C [event column order].

       --threshold=<0--100> [default: 99%]
           Percentage of counts (of primary sort event) we are interested in.

       --auto=<yes|no> [default: no]
           Annotate all source files containing functions that helped reach the event count threshold.

       --context=N [default: 8]
           Print N lines of context before and after annotated lines.

       --inclusive=<yes|no> [default: no]
           Add subroutine costs to functions calls.

       --tree=<none|caller|calling|both> [default: none]
           Print for each function their callers, the called functions or both.

       -I, --include=<dir>
           Add dir to the list of directories to search for source files.

SEE ALSO
       valgrind(1), $INSTALL/share/doc/valgrind/html/index.html or http://www.valgrind.org/docs/manual/index.html.

AUTHOR
       Josef Weidendorfer <Josef.Weidendorfer@gmx.de>.

       This manual page was written by Philipp Frauenfelder <pfrauenf@debian.org>.

Release 3.12.0                                                      12/06/2016                                               CALLGRIND ANNOTATE(1)
