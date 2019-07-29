SSINDEX(1)                                                             GNOME                                                            SSINDEX(1)

NAME
       ssindex - generate index data for spreadsheet files

SYNOPSIS
       ssindex  [OPTIONS] [FILES]

DESCRIPTION
       This manual page briefly documents the ssindex command.

       ssindex  is a command line utility to generate index data for various spreadsheet file formats. It is primarily used by the Beagle indexing
       sub-system and search aggregator.

OPTIONS
       This program follows the usual GNU command line syntax, with single letter options starting with a single dash  (`-')  and  longer  options
       starting with two dashes (`--').

   Main options
       -E, --import-encoding=ENCODING
              Specify an encoding for imported content

       -i, --index
              Index the given files

       -m, --list-mime-types
              List the MIME types which ssindex is able to read

   Help options
       -v, --version
              Display ssindex's version

       -?, --help
              Display the supported options

       --usage
              Display a brief usage message

   Path options
       -L, --lib-dir=STRING
              Set the root library directory

       -D, --data-dir=STRING
              Adjust the root data directory

LICENSE
       ssindex is licensed under the terms of the General Public License (GPL), version 2 or 3. For information on this license look at the source
       code that came with the software or see the GNU project page ⟨http://www.gnu.org⟩.

COPYRIGHT
       The copyright on ssindex and the gnumeric software and source code is held by the individual authors as is documented in the source code.

AUTHOR
       ssindex's primary author is Jody Goldberg <jody@gnome.org>; ssindex builds on the gnumeric codebase.

       The initial version of this manpage was written by J.H.M. Dassen (Ray) <jdassen@debian.org>.

SEE ALSO
       beagled(1), gnumeric(1), ssconvert(1), ssdiff(1) ssgrep(1)

       The Gnumeric Homepage ⟨http://www.gnome.org/projects/gnumeric/⟩.

       The GNOME project page ⟨http://www.gnome.org/⟩.

gnumeric                                                            2009-02-08                                                          SSINDEX(1)
