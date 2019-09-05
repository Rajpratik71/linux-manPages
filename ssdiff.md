SSDIFF(1)                                                              GNOME                                                             SSDIFF(1)

NAME
       ssdiff - compare two spreadsheets

SYNOPSIS
       ssdiff  [OPTIONS] OLDFILE NEWFILE

DESCRIPTION
       This manual page briefly documents the ssdiff command.

       ssdiff is a command line utility to compare two spreadsheets and list their differences

OPTIONS
       This  program  follows  the  usual GNU command line syntax, with single letter options starting with a single dash (`-') and longer options
       starting with two dashes (`--').

   Output options
       -x, --xml
              Display differences in xml format

   Help options
       -V, --version
              Display ssdiff's version

       -?, --help
              Display the supported options

EXAMPLE
       To compare an old version of a file with a newer file, run:

       ssdiff old.gnumeric new.gnumeric

LICENSE
       ssdiff is licensed under the terms of the General Public License (GPL), version 2 or 3. For information on this license look at the  source
       code that came with the software or see the GNU project page ⟨http://www.gnu.org⟩.

COPYRIGHT
       The copyright on ssdiff and the gnumeric software and source code is held by the individual authors as is documented in the source code.

AUTHOR
       ssdiff's primary author is Morten Welinder <terra@gnome.org>; ssdiff builds on the gnumeric codebase.

SEE ALSO
       gnumeric(1), ssconvert(1), ssindex(1) ssgrep(1)

       The Gnumeric Homepage ⟨http://www.gnome.org/projects/gnumeric/⟩.

       The GNOME project page ⟨http://www.gnome.org/⟩.

gnumeric                                                            2012-12-24                                                           SSDIFF(1)
