PMKPC(1)                                                    BSD General Commands Manual                                                   PMKPC(1)

NAME
     pmkpc — Packages metainformation management tool.

SYNOPSIS
     pmkpc [options] [modules]

DESCRIPTION
     pmkpc is a tool that gathers metainformation about installed libraries that provide pkg-config data files.  It aims to be an alternative to
     the pkg-config tool.

OPTIONS
     The options are as follows:

     --version
             Display compatibility version relative to pkgconfig.

     --atleast-pkgconfig-version
             Check if compatibility version is at least equal or greater than the version provided as an argument.

     --modversion
             Display the version of the given library modules using one line for each version.

     --atleast-version
             Check if each module version is at least equal or greater than the version provided as an argument.

     --exact-version
             Check if each module version is equal to the version provided as an argument.

     --max-version
             Check if each module version is at least equal or smaller than the version provided as an argument.

     --exists
             Check if given library modules exists.

     --cflags
             Display pre-processor and compiler flags for given library modules.  Duplicates values are automatically removed.

     --cflags-only-I
             Enable output filtering of compiler flags and keep include path. See output filtering section.

     --cflags-only-other
             Enable output filtering of compiler flags and keep other flags than include path.  See output filtering section.

     --libs  Display linker flags for given library modules.  Duplicate values are automatically removed.

     --libs_only_l
             Enable output filtering of linker flags and keep library linking flags.  See output filtering section.

     --libs_only_L
             Enable output filtering of linker flags and keep library path flags.  See output filtering section.

     --libs_only_other
             Enable output filtering of linker flags and keep other flags than library linking and path flags. See output filtering section.

     --help  Only for compatibility with pkg-config. Refers to this man page.

     --usage
             Display usage.

     --list-all
             Display all module names and descriptions.

     The following options have not been implemented yet:

           --uninstalled
           --debug
           --variable
           --define-variable
           --print-errors
           --silence-errors
           --errors-to-stdout

OUTPUT FILTERING
     As pkg-config has no standard specifications we determinated its behavior from pkg-config man page.  The result is that filtering options can
     be accumulated.  The default behavior is like if all filtering options were enabled.

FILES
     pmkcfgtool.dat  config tool specific data.

SEE ALSO
     pkg-config(1)

HISTORY
     Initialy pmk was using pkg-config in a sub shell.  Further, internal support was developed to improve the speed of data gathering.  While
     studying the code of pkg-config we discovered some chunks of code that were unsafe (malloc return unchecked, use of strcpy without any check,
     ...).  Knowing that, we decided to try to do a safer implementation and pmkpc was born.

AUTHORS
     Damien Couderc and Xavier Santolaria.

BSD                                                              January 20, 2004                                                              BSD
