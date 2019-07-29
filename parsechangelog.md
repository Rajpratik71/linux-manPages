PARSECHANGELOG(1p)                                      User Contributed Perl Documentation                                     PARSECHANGELOG(1p)

NAME
       parsechangelog - parse Debian changelogs and output them in other formats

SYNOPSIS
       parsechangelog [options] [changelogfile]

        Options:
           --help, -h                  print usage information
           --version, -V               print version information
           --file, -l <file>           changelog file to parse, defaults
                                       to 'debian/changelog'
           -F<changelogformat>         ignored if changelogformat = 'debian'
                                       for compatibility with dpkg-dev
           -L<libdir>                  ignored for compatibility with dpkg-dev
           --format <outputformat>     see man page for list of available
                                       output formats, defaults to 'dpkg'
                                       for compatibility with dpkg-dev
           --since, -s, -v <version>   include all changes later than version
           --until, -u <version>       include all changes earlier than version
           --from, -f <version>        include all changes equal or later
                                       than version
           --to, -t <version>          include all changes up to or equal
                                       than version
           --count, -c, -n <number>    include <number> entries from the top
                                       (or the tail if <number> is lower than 0)
           --offset, -o <number>       change the starting point for --count,
                                       counted from the top (or the tail if
                                       <number> is lower than 0)
           --all                       include all changes

       If neither "changelogfile" nor "-l <file>" are specified, debian/changelog will be used. If two different files are specified the program
       will abort.

       If the filename is "-" the program reads the changelog from standard input.

       "--all" overrides all other range selecting options. "--count" overrides all other range selection options except for "--all".  The range
       selecting options can be mixed together, but only one of "--since" and "--from" and one of "--until" and "--to" can be specified at the
       same time.

       The dpkg and rfc822 formats default to showing only the first entry when no other options are given with while the HTML and XML formats
       default to showing all entries.

       For a more extensive documentation of the range selecting options and some (hopefully enlightening) examples see "COMMON OUTPUT OPTIONS" in
       Parse::DebianChangelog.

DESCRIPTION
       parsechangelog parses Debian changelogs as described in the Debian policy (version 3.6.2.1 at the time of this writing) and converts them
       to other output formats. See section "SEE ALSO" for locations where to find the full format definition.

       The output formats supported are currently:

       dpkg
           Format as known from dpkg-parsechangelog(1). All requested entries (see "SYNOPSIS" on how to select specific entries) are returned in
           the usual Debian control format, merged in one stanza, ready to be used in a .changes file.

       rfc822
           Similar to the "dpkg" format, but the requested entries are returned as one stanza each, i.e. they are not merged. This is probably the
           format to use if you want a machine-usable representation of the changelog.

       xml Just a simple XML dump of the changelog data. Without any schema or DTD currently, just some made up XML. The actual format might still
           change. Comments and Improvements welcome.

       html
           The changelog is converted to a somewhat nice looking HTML file with some nice features as a quick-link bar with direct links to every
           entry.  NOTE: This is not configurable yet and was specifically designed to be used on <http://packages.debian.org/>. This is planned
           to be changed until version 1.0. The used Parse::DebianChangelog module already supports configuration, however, this isn't exposed by
           this program yet.

SEE ALSO
       Parse::DebianChangelog, the underlying Perl module

       Description of the Debian changelog format in the Debian policy: <http://www.debian.org/doc/debian-policy/ch-source.html#s-dpkgchangelog>.

AUTHOR
       Frank Lichtenheld, <frank@lichtenheld.de>

COPYRIGHT AND LICENSE
       Copyright (C) 2005 by Frank Lichtenheld

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation,
       Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA

perl v5.20.2                                                        2015-10-23                                                  PARSECHANGELOG(1p)
