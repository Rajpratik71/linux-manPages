DEURLNAME(1)                           General Commands Manual                           DEURLNAME(1)

NAME
       deurlname - Remove URL-encoded characters from file names.

SYNOPSIS
       deurlname [OPTION]... [FILE]...

DESCRIPTION
       This manual page document describes the deurlname command.

       deurlname will rename every file specified on the command line that has URL-encoded characters
       in its name. The URL-encoded characters will be translated into the corresponding byte values.
       That is, %20 will become space, %41 A and so on.

OPTIONS
       These  programs  follow the usual GNU command line syntax, with long options starting with two
       dashes (`-').

       -v, --verbose
              Display every rename done.

       --help Show summary of options.

       --version
              Output version information and exit.

REPORTING BUGS
       Report bugs to <oskar@osk.mine.nu>.

AUTHOR
       The author of renameutils and this manual page is Oskar Liljeblad <oskar@osk.mine.nu>.

COPYRIGHT
       Copyright © 2001, 2002, 2004, 2005, 2007, 2008 Oskar Liljeblad

       This is free software; see the source for copying conditions.  There is NO warranty; not  even
       for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

deurlname (renameutils)                    December 4, 2007                              DEURLNAME(1)
