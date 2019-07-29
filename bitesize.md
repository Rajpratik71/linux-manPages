bitesize(1)                                                   General Commands Manual                                                  bitesize(1)

NAME
       bitesize - Add bitesize tag to bugs and add a comment.

SYNOPSIS
       bitesize <bug number>
       bitesize --help

DESCRIPTION
       bitesize  adds  a bitesize tag to the bug, if it's not there yet. It also adds a comment to the bug indicating that you are willing to help
       with fixing it.  It checks for permission to operate on a given bug first, then perform required tasks on Launchpad.

OPTIONS
       Listed below are the command line options for bitesize:

       -h, --help
              Display a help message and exit.

       -l INSTANCE, --lpinstance=INSTANCE
              Use the specified instance of Launchpad (e.g. "staging"), instead of the default of "production".

       --no-conf
              Do not read any configuration files, or configuration from environment variables.

ENVIRONMENT
       All of the CONFIGURATION VARIABLES below are also supported as environment variables.  Variables in  the  environment  take  precedence  to
       those in configuration files.

CONFIGURATION VARIABLES
       The  following  variables  can  be set in the environment or in ubuntu-dev-tools(5) configuration files.  In each case, the script-specific
       variable takes precedence over the package-wide variable.

       BITESIZE_LPINSTANCE, UBUNTUTOOLS_LPINSTANCE
              The default value for --lpinstance.

SEE ALSO
       ubuntu-dev-tools(5)

AUTHORS
       bitesize and this manual page were written by Daniel Holbach <daniel.holbach@canonical.com>.

       Both are released under the terms of the GNU General Public License, version 3.

ubuntu-dev-tools                                                    May 9 2010                                                         bitesize(1)
