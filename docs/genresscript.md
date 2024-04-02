GENRESSCRIPT(1)                                               General Commands Manual                                              GENRESSCRIPT(1)

NAME
       genresscript - generate resource script from PE and NE binaries

SYNOPSIS
       genresscript [FILE]...

DESCRIPTION
       This  manual  page  documents  briefly  the genresscript command.  This manual page was written for the Debian GNU distribution because the
       original program does not have a manual page.

       Genresscript takes any number of PE or NE binaries, and outputs a resource script with all resources from the binaries listed.  (Everything
       but  the destination filename will be filled in in the script.)  This is useful when you already have extracted images and want to create a
       resource script of them.

OPTIONS
       -t

       --type=ID
              list resources of this type instead of group_icon

       -b

       --base=PATH
              the default extraction name of all resources

       -s

       --sort sort alphabetically instead of using order in binary

       --help display this help and exit

       --version
              output version information and exit

SEE ALSO
       extresso(1), icotool(1), wrestool(1).

AUTHOR
       This manual page was written by Colin Watson <cjwatson@debian.org> and Oskar Liljeblad <oskar@osk.mine.nu>.

COPYRIGHT
       Copyright © 2001 Colin Watson

       Copyright © 2001 Oskar Liljeblad

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

genresscript (icoutils)                                           April 18, 2005                                                   GENRESSCRIPT(1)
