RUN-PARTS(8)                                                                            System Manager's Manual                                                                           RUN-PARTS(8)

NAME
       run-parts - run scripts or programs in a directory

SYNOPSIS
       run-parts [--test] [--verbose] [--report] [--lsbsysinit] [--regex=RE] [--umask=umask] [--arg=argument] [--exit-on-error] [--help] [--version] [--list] [--reverse] [--] DIRECTORY

       run-parts -V

DESCRIPTION
       run-parts runs all the executable files named within constraints described below, found in directory directory.  Other files and directories are silently ignored.

       If  neither  the  --lsbsysinit  option  nor the --regex option is given then the names must consist entirely of ASCII upper- and lower-case letters, ASCII digits, ASCII underscores, and ASCII
       minus-hyphens.

       If the --lsbsysinit option is given, then the names must not end in .dpkg-old  or .dpkg-dist or .dpkg-new or .dpkg-tmp, and must belong to one or more of the following namespaces: the LANANA-
       assigned namespace (^[a-z0-9]+$); the LSB hierarchical and reserved namespaces (^_?([a-z0-9_.]+-)+[a-z0-9]+$); and the Debian cron script namespace (^[a-zA-Z0-9_-]+$).

       If the --regex option is given, the names must match the custom extended regular expression specified as that option's argument.

       Files  are  run  in  the  lexical sort order (according to the C/POSIX locale character collation rules) of their names unless the --reverse option is given, in which case they are run in the
       opposite order.

OPTIONS
       --test print the names of the scripts which would be run, but don't actually run them.

       --list print the names of the all matching files (not limited to executables), but don't actually run them. This option cannot be used with --test.

       -v, --verbose
              print the name of each script to stderr before running.

       --report
              similar to --verbose, but only prints the name of scripts which produce output.  The script's name is printed to whichever of stdout or stderr the script first produces output on.

       --reverse
              reverse the scripts' execution order.

       --exit-on-error
              exit as soon as a script returns with a non-zero exit code.

       --lsbsysinit
              use LSB namespaces instead of classical behavior.

       --new-session
              run each script in a separate process session.  If you use this option, killing run-parts will not kill the currently running script, it will run until completion.

       --regex=RE
              validate filenames against custom extended regular expression RE.  See the EXAMPLES section for an example.

       -u, --umask=umask
              sets the umask to umask before running the scripts.  umask should be specified in octal.  By default the umask is set to 022.

       -a, --arg=argument
              pass argument to the scripts.  Use --arg once for each argument you want passed.

       --     specifies that this is the end of the options.  Any filename after -- will be not be interpreted as an option even if it starts with a hyphen.

       -h, --help
              display usage information and exit.

       -V, --version
              display version and copyright and exit.

EXAMPLES
       Print the names of all files in /etc that start with `p' and end with `d':

       run-parts --list --regex '^p.*d$' /etc

COPYRIGHT
       Copyright (C) 1994 Ian Jackson.

       Copyright (C) 1996 Jeff Noxon.

       Copyright (C) 1996, 1997, 1998 Guy Maor

       Copyright (C) 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009 Clint Adams

       run-parts is free software; see the GNU General Public License version 2 or later for copying conditions.  There is no warranty.

Debian                                                                                        27 Jun 2012                                                                                 RUN-PARTS(8)
