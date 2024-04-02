SSGREP(1)                                                              GNOME                                                             SSGREP(1)

NAME
       ssgrep - search spreadsheets for strings

SYNOPSIS
       ssgrep  [OPTIONS] [FILES]

DESCRIPTION
       This manual page briefly documents the ssgrep command.

       ssgrep  is  a  command line utility to search for strings in spreadsheets of any format supported by gnumeric. Without any output modifying
       options, ssgrep prints one line for each match. A match consists of the matching content of a cell or, if  the  -R  option  is  given,  the
       matching expression result of a cell.

OPTIONS
       This  program  follows  the  usual GNU command line syntax, with single letter options starting with a single dash (`-') and longer options
       starting with two dashes (`--').

   Options controlling input file handling
       --recalc
              Recalculate all cells

   Options controlling patterns and pattern matching
       -f, --keyword-file=FILE
              The path to a text file containing one key per line

       -i, --ignore-case
              Ignore differences in letter case

       -w, --word-regexp
              Match only whole words

       -F, --fixed-strings
              Pattern is a set of fixed strings

       -R, --search-results
              Search results of expressions too

       -v, --invert-match
              Search for cells that do not match

   Options controlling output in general
       -c, --count
              Only print a count of matches per file

       -L, --files-without-matches
              Print filenames without matches

       -l, --files-with-matches
              Print filenames with matches

       -q, --quiet
              Suppress all normal output

       -H, --with-filename
              Print the filename for each match

       -h, --without-filename
              Do not print the filename for each match

       -n, --print-locus
              Print the location of each match

       -T, --print-type
              Print the location type of each match

   Help options
       -V, --version
              Display ssgrep's version

       -?, --help
              Display the supported options

       --usage
              Display a brief usage message

EXAMPLE
       To search for the string "SUM" in the file foo.gnumeric :

       ssgrep SUM foo.gnumeric

       To search for the strings from the file keywords in the spreadsheet foo.xls :

       ssgrep --keyword-file=keywords foo.xls

LICENSE
       ssgrep is licensed under the terms of the General Public License (GPL), version 2 or 3. For information on this license look at the  source
       code that came with the software or see the GNU project page ⟨http://www.gnu.org⟩.

COPYRIGHT
       The copyright on ssgrep and the gnumeric software and source code is held by the individual authors as is documented in the source code.

AUTHOR
       ssgrep's primary author is Jody Goldberg <jody@gnome.org>; ssgrep builds on the gnumeric codebase.

       The initial version of this manpage was based on ssindex.1 by J.H.M. Dassen (Ray) <jdassen@debian.org>.

SEE ALSO
       beagled(1), gnumeric(1), ssconvert(1), ssdiff(1) ssindex(1)

       The Gnumeric Homepage ⟨http://www.gnome.org/projects/gnumeric/⟩.

       The GNOME project page ⟨http://www.gnome.org/⟩.

gnumeric                                                            2009-02-08                                                           SSGREP(1)
