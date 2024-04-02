ICUINFO(1)                                 ICU 60.2 Manual                                 ICUINFO(1)

NAME
       icuinfo - Shows some basic info about the current ICU

SYNOPSIS
       icuinfo  [ -h, -?, --help ] [ -V, --version ] [ -c, --copyright ] [ -i, --icudatadir directory
       ] [ -v, --verbose ] [ -L, --list-plugins ] [ -m, --milisecond-time ] [ -K, --cleanup ]

DESCRIPTION
       icuinfo prints basic information about the current version of ICU.

OPTIONS
       -h, -?, --help
              Print help about usage and exit.

       -V, --version
              Print the version of icuinfo and exit.

       -c, --copyright
              Embeds the standard ICU copyright into the output-file.

       -v, --verbose
              Display extra informative messages during execution.

       -i, --icudatadir directory
              Look for any necessary ICU data files in directory.  For example, the  file  pnames.icu
              must be located when ICU's data is not built as a shared library.  The default ICU data
              directory is specified by the environment variable ICU_DATA.   Most  configurations  of
              ICU do not require this argument.

       -L, --list-plugins
              If specified, list and diagnose issues with ICU plugins.

       -K, --cleanup
              Attempt to unload plugins before exiting.

       -m, --milisecond-time
              Print the current UTC time in milliseconds.

COPYRIGHT
       Copyright (C) 2010 International Business Machines Corporation and others

ICU MANPAGE                                   1 May 2010                                   ICUINFO(1)
