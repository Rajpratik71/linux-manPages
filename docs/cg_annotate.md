CG_ANNOTATE(1)                                                    Release 3.12.0                                                    CG_ANNOTATE(1)

NAME
       cg_annotate - post-processing tool for Cachegrind

SYNOPSIS
       cg_annotate [options] cachegrind-out-file [source-files...]

DESCRIPTION
       cg_annotate takes an output file produced by the Valgrind tool Cachegrind and prints the information in an easy-to-read form.

OPTIONS
       -h --help
           Show the help message.

       --version
           Show the version number.

       --show=A,B,C [default: all, using order in cachegrind.out.<pid>]
           Specifies which events to show (and the column order). Default is to use all present in the cachegrind.out.<pid> file (and use the
           order in the file). Useful if you want to concentrate on, for example, I cache misses (--show=I1mr,ILmr), or data read misses
           (--show=D1mr,DLmr), or LL data misses (--show=DLmr,DLmw). Best used in conjunction with --sort.

       --sort=A,B,C [default: order in cachegrind.out.<pid>]
           Specifies the events upon which the sorting of the function-by-function entries will be based.

       --threshold=X [default: 0.1%]
           Sets the threshold for the function-by-function summary. A function is shown if it accounts for more than X% of the counts for the
           primary sort event. If auto-annotating, also affects which files are annotated.

           Note: thresholds can be set for more than one of the events by appending any events for the --sort option with a colon and a number (no
           spaces, though). E.g. if you want to see each function that covers more than 1% of LL read misses or 1% of LL write misses, use this
           option:

           --sort=DLmr:1,DLmw:1

       --auto=<no|yes> [default: no]
           When enabled, automatically annotates every file that is mentioned in the function-by-function summary that can be found. Also gives a
           list of those that couldn't be found.

       --context=N [default: 8]
           Print N lines of context before and after each annotated line. Avoids printing large sections of source files that were not executed.
           Use a large number (e.g. 100000) to show all source lines.

       -I<dir> --include=<dir> [default: none]
           Adds a directory to the list in which to search for files. Multiple -I/--include options can be given to add multiple directories.

SEE ALSO
       valgrind(1), $INSTALL/share/doc/valgrind/html/index.html or http://www.valgrind.org/docs/manual/index.html.

AUTHOR
       Nicholas Nethercote.

Release 3.12.0                                                      12/06/2016                                                      CG_ANNOTATE(1)
