WDIFF(1)                                                           User Commands                                                          WDIFF(1)

NAME
       wdiff - display word differences between text files

SYNOPSIS
       wdiff [OPTION]... FILE1 FILE2
       wdiff -d [OPTION]... [FILE]

DESCRIPTION
       wdiff - Compares words in two files and report differences.

       Mandatory arguments to long options are mandatory for short options too.

       -C, --copyright
              display copyright then exit

       -1, --no-deleted
              inhibit output of deleted words

       -2, --no-inserted
              inhibit output of inserted words

       -3, --no-common
              inhibit output of common words

       -a, --auto-pager
              automatically calls a pager

       -d, --diff-input
              use single unified diff as input

       -h, --help
              display this help then exit

       -i, --ignore-case
              fold character case while comparing

       -l, --less-mode
              variation of printer mode for "less"

       -n, --avoid-wraps
              do not extend fields through newlines

       -p, --printer
              overstrike as for printers

       -s, --statistics
              say how many words deleted, inserted etc.

       -t, --terminal
              use termcap as for terminal displays

       -v, --version
              display program version then exit

       -w, --start-delete=STRING
              string to mark beginning of delete region

       -x, --end-delete=STRING
              string to mark end of delete region

       -y, --start-insert=STRING
              string to mark beginning of insert region

       -z, --end-insert=STRING
              string to mark end of insert region

COMPATIBILITY
       Some  options that used to provide some unique functionality are no longer recommended, but still recognized for the sake of backwards com‐
       patibility.

       -K, --no-init-term
              Now synonymous to --terminal, which never initializes the terminal.

AUTHOR
       Written by Franc,ois Pinard <pinard@iro.umontreal.ca>.

REPORTING BUGS
       Report bugs to <wdiff-bugs@gnu.org>.

COPYRIGHT
       Copyright © 1992, 1997, 1998, 1999, 2009, 2010, 2011, 2012 Free Software Foundation, Inc.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

SEE ALSO
       The  full  documentation  for wdiff is maintained as a Texinfo manual.  If the info and wdiff programs are properly installed at your site,
       the command

              info wdiff

       should give you access to the complete manual.

wdiff 1.2.2                                                         April 2014                                                            WDIFF(1)
