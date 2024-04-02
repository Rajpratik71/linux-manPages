MS_PRINT(1)                                                       Release 3.12.0                                                       MS_PRINT(1)

NAME
       ms_print - post-processing tool for Massif

SYNOPSIS
       ms_print [options] massif-out-file

DESCRIPTION
       ms_print takes an output file produced by the Valgrind tool Massif and prints the information in an easy-to-read form.

OPTIONS
       -h --help
           Show the help message.

       --version
           Show the version number.

       --threshold=<m.n> [default: 1.0]
           Same as Massif's --threshold option, but applied after profiling rather than during.

       --x=<4..1000> [default: 72]
           Width of the graph, in columns.

       --y=<4..1000> [default: 20]
           Height of the graph, in rows.

SEE ALSO
       valgrind(1), $INSTALL/share/doc/valgrind/html/index.html or http://www.valgrind.org/docs/manual/index.html.

AUTHOR
       Nicholas Nethercote.

Release 3.12.0                                                      12/06/2016                                                         MS_PRINT(1)
