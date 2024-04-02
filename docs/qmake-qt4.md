QMAKE(1)                                                                                                                                  QMAKE(1)

NAME
       qmake - cross-platform makefile generator for Qt

SYNOPSIS
       qmake [mode] [options] [files]

DESCRIPTION
       QMake  has  two modes, one mode for generating project files based on some heuristics, and the other for generating makefiles. Normally you
       shouldn't need to specify a mode, as makefile generation is the default mode for qmake, but you may use this to test qmake on  an  existing
       project.

MODE
       -project
              Put  qmake  into project file generation mode. In this mode qmake interprets files as files to be built, defaults to *.c; *.ui; *.y;
              *.l; *.ts; *.xlf; *.qrc; *.h; *.hpp; *.hh; *.hxx; *.H; *.cpp; *.cc; *.cxx; *.C.

       -makefile
              Put qmake into makefile generation mode (default). In this mode qmake interprets files as project files to be processed, if  skipped
              qmake will try to find a project file in your current working directory.

WARNINGS OPTIONS
       -Wnone Turn off all warnings

       -Wall  Turn on all warnings

       -Wparser
              Turn on parser warnings

       -Wlogic
              Turn on logic warnings

OPTIONS
       -ofile Write output to file

       -unix  Run in unix mode

       -win32 Run in win32 mode

       -macx  Run in Mac OS X mode

       -d     Increase debug level

       -ttempl
              Overrides TEMPLATE as templ

       -tpprefix
              Overrides TEMPLATE so that prefix is prefixed into the value

       -help  Displays a help text

       -v     Version information

       -after All variable assignments after this will be parsed after [files]

       -norecursive
              Do not do a recursive search

       -recursive
              Do a recursive search

       -set <prop> <value>
              Set persistent property

       -query <prop>
              Query persistent property. Show all if <prop> is empty.

       -cache file
              Use file as cache [makefile mode only]

       -spec spec
              Use spec as QMAKESPEC [makefile mode only]

       -nocache
              Do not use a cache file [makefile mode only]

       -nodepend
              Do not generate dependencies [makefile mode only]

       -nomoc Do not generate moc targets [makefile mode only]

       -nopwd Do not look for files in pwd [project mode only]

SEE ALSO
       /usr/share/qt4/doc/html/qmake-manual.html, assistant(1)

AUTHOR
       This  manual  page  was  written  by  Brian  Nelson  <pyro@debian.org>  based  on the output of qmake -help .  Frederik Schwarzer <schwarz‐
       erf@gmail.com> updated it for Qt 4.5.2.

Nokia Corporation and/or its subsidiary(-ies)                       2005-07-23                                                            QMAKE(1)
