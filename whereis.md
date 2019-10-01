WHEREIS(1)                                                                                      User Commands                                                                                      WHEREIS(1)



NAME
       whereis - locate the binary, source, and manual page files for a command

SYNOPSIS
       whereis [options] [-BMS directory... -f] name...

DESCRIPTION
       whereis  locates the binary, source and manual files for the specified command names.  The supplied names are first stripped of leading pathname components and any (single) trailing extension of the
       form .ext (for example: .c) Prefixes of s.  resulting from use of source code control are also dealt with.  whereis then attempts to locate the desired program in the standard Linux places,  and  in
       the places specified by $PATH and $MANPATH.

OPTIONS
       -b     Search only for binaries.

       -m     Search only for manuals.

       -s     Search only for sources.

       -u     Only  show  the  command names that have unusual entries.  A command is said to be unusual if it does not have just one entry of each explicitly requested type.  Thus 'whereis -m -u *'
              asks for those files in the current directory which have no documentation file, or more than one.

       -B list
              Limit the places where whereis searches for binaries, by a whitespace-separated list of directories.

       -M list
              Limit the places where whereis searches for manuals, by a whitespace-separated list of directories.

       -S list
              Limit the places where whereis searches for sources, by a whitespace-separated list of directories.

       -f     Terminates the directory list and signals the start of filenames.  It must be used when any of the -B, -M, or -S options is used.

       -l     Output list of effective lookup paths the whereis is using.  When non of -B, -M, or -S is specified the option will out hard coded paths that the command was able to find on system.

EXAMPLE
       To find all files in /usr/bin which are not documented in /usr/man/man1 or have no source in /usr/src:

              $ cd /usr/bin
              $ whereis -u -ms -M /usr/man/man1 -S /usr/src -f *

FILE SEARCH PATHS
       By default whereis tries to find files from hard-coded paths, which are defined with glob patterns. The command attempst to use contents of $PATH and $MANPATH environment variables as default
       search path.  The easiest way to know what paths are in use is to add -l listing option.  Effects of the -B, -M, and -S are display with -l.

AVAILABILITY
       The whereis command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                        March 2013                                                                                       WHEREIS(1)
