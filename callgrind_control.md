CALLGRIND CONTROL(1)                                              Release 3.12.0                                              CALLGRIND CONTROL(1)

NAME
       callgrind_control - observe and control programs being run by Callgrind

SYNOPSIS
       callgrind_control [options] [pid|program-name...]

DESCRIPTION
       callgrind_control controls programs being run by the Valgrind tool Callgrind. When a pid/program name argument is not specified, all
       applications currently being run by Callgrind on this system will be used for actions given by the specified option(s). The default action
       is to give some brief information about the applications being run by Callgrind.

OPTIONS
       -h --help
           Show a short description, usage, and summary of options.

       --version
           Show version of callgrind_control.

       -l --long
           Show also the working directory, in addition to the brief information given by default.

       -s --stat
           Show statistics information about active Callgrind runs.

       -b --back
           Show stack/back traces of each thread in active Callgrind runs. For each active function in the stack trace, also the number of
           invocations since program start (or last dump) is shown. This option can be combined with -e to show inclusive cost of active
           functions.

       -e [A,B,...]  (default: all)
           Show the current per-thread, exclusive cost values of event counters. If no explicit event names are given, figures for all event types
           which are collected in the given Callgrind run are shown. Otherwise, only figures for event types A, B, ... are shown. If this option
           is combined with -b, inclusive cost for the functions of each active stack frame is provided, too.

       --dump[=<desc>]  (default: no description)
           Request the dumping of profile information. Optionally, a description can be specified which is written into the dump as part of the
           information giving the reason which triggered the dump action. This can be used to distinguish multiple dumps.

       -z --zero
           Zero all event counters.

       -k --kill
           Force a Callgrind run to be terminated.

       --instr=<on|off>
           Switch instrumentation mode on or off. If a Callgrind run has instrumentation disabled, no simulation is done and no events are
           counted. This is useful to skip uninteresting program parts, as there is much less slowdown (same as with the Valgrind tool "none").
           See also the Callgrind option --instr-atstart.

       --vgdb-prefix=<prefix>
           Specify the vgdb prefix to use by callgrind_control. callgrind_control internally uses vgdb to find and control the active Callgrind
           runs. If the --vgdb-prefix option was used for launching valgrind, then the same option must be given to callgrind_control.

SEE ALSO
       valgrind(1), $INSTALL/share/doc/valgrind/html/index.html or http://www.valgrind.org/docs/manual/index.html.

AUTHOR
       Josef Weidendorfer <Josef.Weidendorfer@gmx.de>.

Release 3.12.0                                                      12/06/2016                                                CALLGRIND CONTROL(1)
