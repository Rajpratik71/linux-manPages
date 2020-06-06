X11PERFCOMP(1)                                                                           General Commands Manual                                                                           X11PERFCOMP(1)

NAME
       x11perfcomp - X11 server performance comparison program

SYNTAX
       x11perfcomp [ -r | -ro ] [ -l label_file ] files

DESCRIPTION
       The  x11perfcomp program merges the output of several x11perf(1) runs into a nice tabular format.  It takes the results in each file, fills in any missing test results if necessary, and for each
       test shows the objects/second rate of each server.  If invoked with the -r or -ro options, it shows the relative performance of each server to the first server.

       Normally, x11perfcomp uses the first file specified to determine which specific tests it should report on.  Some (non-DEC :) servers may fail to perform all tests.   In  this  case,  x11perfcomp
       automatically  substitutes in a rate of 0.0 objects/second.  Since the first file determines which tests to report on, this file must contain a superset of the tests reported in the other files,
       else x11perfcomp will fail.

       You can provide an explicit list of tests to report on by using the -l switch to specify a file of labels.  You can create a label file by using the -label option in x11perf.

OPTIONS
       x11perfcomp accepts the options listed below:

       -r              Specifies that the output should also include relative server performance.

       -ro             Specifies that the output should include only relative server performance.

       -l label_file   Specifies a label file to use.

X DEFAULTS
       There are no X defaults used by this program.

SEE ALSO
       X(7), x11perf(1)

AUTHORS
       Mark Moraes wrote the original scripts to compare servers.
       Joel McCormack just munged them together a bit.

X Version 11                                                                                  x11perf 1.6.0                                                                                X11PERFCOMP(1)
