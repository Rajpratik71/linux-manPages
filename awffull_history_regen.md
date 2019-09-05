USAGE:(1)                                                          User Commands                                                         USAGE:(1)

NAME
       Usage: - awffull_history_regen

DESCRIPTION
   Usage:
              awffull_history_regen.pl [options]

              NB! Must have the GNU Date command!

OPTIONS
       --help Print a brief help message and exit.

       --man  Print the manual page and exit.

       --dir directory

              The directory to use, looking for old webalizer usage_YYYYMM.html files. If not present will use the current directory.

       --date gnu-date-location

              This program requires the GNU date command, use this option, if it's in a non-standard place.

SEE ALSO
       The  full documentation for Usage: is maintained as a Texinfo manual.  If the info and Usage: programs are properly installed at your site,
       the command

              info Usage:

       should give you access to the complete manual.

Usage: dpkg-parsechangelog [<option>...]Options:  -l<changelog-fileOctober 2013per-version info from this file.  -F<changelog-format>    USAGE:(1)angelog format.  -L<libdir>               look for changelog parsers in <libdir>.  -?, --help               show this help message.      --version            show the version.Parser options:    --format <output-format>    see man page for list of available                                output formats, defaults to 'dpkg'                                for compatibility with dpkg-dev    --since <version>,          include all changes later than version      -s<version>, -v<version>    --until <version>,          include all changes earlier than version      -u<version>    --from <version>,           include all changes equal or later      -f<version>               than version    --to <version>, -t<version> include all changes up to or equal                                than version    --count <number>,           include <number> entries from the top      -c<number>, -n<number>    (or the tail if <number> is lower than 0)    --offset <number>,          change the starting point for --count,      -o<number>                counted from the top (or the tail if                                <number> is lower than 0)    --all                       include all changes
