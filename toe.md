toe(1)                                                                                   General Commands Manual                                                                                   toe(1)

NAME
       toe - table of (terminfo) entries

SYNOPSIS
       toe [-v[n]] [-ahsuUV] file...

DESCRIPTION
       With  no  options,  toe  lists all available terminal types by primary name with descriptions.  File arguments specify the directories to be scanned; if no such arguments are given, your default
       terminfo directory is scanned.  If you also specify the -h option, a directory header will be issued as each directory is entered.

       There are other options intended for use by terminfo file maintainers:

       -a     report on all of the terminal databases which ncurses would search, rather than only the first one that it finds.

              If the -s is also given, toe adds a column to the report, showing (like conflict(1)) which entries which belong to a given terminal database.  An "*" marks entries which differ,  and  "+"
              marks equivalent entries.

              Without the -s option, toe does not attempt to merge duplicates in its report

       -s     sort the output by the entry names.

       -u file
              says  to write a report to the standard output, listing dependencies in the given terminfo/termcap source file.  The report condenses the `use' relation: each line consists of the primary
              name of a terminal that has use capabilities, followed by a colon, followed by the whitespace-separated primary names of all terminals which occur in those use capabilities, followed by a
              newline

       -U file
              says  to  write a report to the standard output, listing reverse dependencies in the given terminfo/termcap source file.  The report reverses the `use' relation: each line consists of the
              primary name of a terminal that occurs in use capabilities, followed by a colon, followed by the whitespace-separated primary names of all terminals which depend on it, followed by a new‐
              line.

       -vn    specifies that (verbose) output be written to standard error, showing toe's progress.  The optional parameter n is a number from 1 to 10, interpreted as for tic(1).

       -V     reports the version of ncurses which was used in this program, and exits.

FILES
       /etc/terminfo/?/*
            Compiled terminal description database.

SEE ALSO
       tic(1), infocmp(1), captoinfo(1), infotocap(1), ncurses(3NCURSES), terminfo(5).

       This describes ncurses version 6.0 (patch 20160213).

                                                                                                                                                                                                   toe(1)
