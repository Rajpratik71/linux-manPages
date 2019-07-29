DPKG-DEPCHECK(1)                                                      DEBIAN                                                      DPKG-DEPCHECK(1)

NAME
       dpkg-depcheck - determine packages used to execute a command

SYNOPSIS
       dpkg-depcheck [options] command

DESCRIPTION
       This  program  runs  the  specified command under strace and then determines and outputs the packages used in the process.  The list can be
       trimmed in various ways as described in the options below.  A  good  example  of  this  program  would  be  the  command  dpkg-depcheck  -b
       debian/rules  build, which would give a good first approximation to the Build-Depends line needed by a Debian package.  Note, however, that
       this does not give any direct information on versions required or architecture-specific packages.

OPTIONS
       -a, --all
              Report all packages used to run command.  This is the default behaviour.  If used in conjunction with -b, -d or -m, gives additional
              information on those packages skipped by these options.

       -b, --build-depends
              Do not report any build-essential or essential packages used, or any of their (direct or indirect) dependencies.

       -d, --ignore-dev-deps
              Do not show packages used which are direct dependencies of -dev packages used.  This implies -b.

       -m, --min-deps
              Output a minimal set of packages needed, taking into account direct dependencies.  Using -m implies -d and also -b.

       -C, --C-locale
              Run command with the C locale.

       --no-C-locale
              Don't change locale when running command.

       -l, --list-files
              Also report the list of files used in each package.

       --no-list-files
              Do not report the files used in each package.  Cancels a -l option.

       -o, --output=FILE
              Output the package diagnostics to FILE instead of stdout.

       -O, --strace-output=FILE
              Write the strace output to FILE when tracing command instead of using a temporary file.

       -I, --strace-input=FILE
              Get strace output from FILE instead of tracing command; strace must have be run with the -f -q options for this to work.

       -f, --features=LIST
              Enable  or  disabled  features given in the comma-separated LIST as follows.  A feature is enabled with +feature or just feature and
              disabled with -feature.  The currently recognised features are:
              warn-local
                     Warn if files in /usr/local or /var/local are used.  Enabled by default.
              discard-check-version
                     Discards execve when only a --version argument is given to the program; this works around some configure scripts  that  check
                     for binaries they don't actually use.  Enabled by default.
              trace-local
                     Also  try  to  identify  files  which are accessed in /usr/local and /var/local.  Not usually very useful, as Debian does not
                     place files in these directories.  Disabled by default.
              catch-alternatives
                     Warn about access to files controlled by the Debian alternatives mechanism.  Enabled by default.
              discard-sgml-catalogs
                     Discards access to SGML catalogs; some SGML tools read all the registered catalogs at startup.   Files  matching  the  regexp
                     /usr/share/sgml/.*\.cat are recognised  as catalogs.  Enabled by default.

       --no-conf, --noconf
              Do not read any configuration files.  This can only be used as the first option given on the command-line.

       -h, --help
              Display usage information and exit.

       -v, --version
              Display version and copyright information and exit.

CONFIGURATION VARIABLES
       The  two configuration files /etc/devscripts.conf and ~/.devscripts are sourced in that order to set configuration variables.  Command line
       options can be used to override configuration file settings.  Environment variable settings are ignored for this  purpose.   The  currently
       recognised variable is:

       DPKG_DEPCHECK_OPTIONS
              These are options which are parsed before the command-line options.  For example,

              DPKG_DEPCHECK_OPTIONS="-b -f-catch-alternatives"

              which  passes these options to dpkg-depcheck before any command-line options are processed.  You are advised not to try tricky quot‐
              ing, because of the vagaries of shell quoting!

SEE ALSO
       dpkg(1), strace(1), devscripts.conf(5), update-alternatives(8)

COPYING
       Copyright 2001 Bill Allombert <ballombe@debian.org>.  Modifications copyright 2002,2003 Julian Gilbey <jdg@debian.org>.   dpkg-depcheck  is
       free software, covered by the GNU General Public License, version 2 or (at your option) any later version, and you are welcome to change it
       and/or distribute copies of it under certain conditions.  There is absolutely no warranty for dpkg-depcheck.

dpkg-depcheck                                                       March 2002                                                    DPKG-DEPCHECK(1)
