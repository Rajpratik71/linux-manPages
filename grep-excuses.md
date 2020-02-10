GREP-EXCUSES(1)                                                                          General Commands Manual                                                                          GREP-EXCUSES(1)

NAME
       grep-excuses - search the testing excuses files for a specific maintainer

SYNOPSIS
       grep-excuses [options] [maintainer|package]

DESCRIPTION
       grep-excuses  downloads  the autoremovals and update_excuses.html files and greps them for the specified maintainer or package name.  The wget package is required for this script.  If no name is
       given on the command line, first the environment variable DEBFULLNAME is used if it is defined, and failing that, the configuration variable described below is used.

OPTIONS
       --no-conf, --noconf
              Do not read any configuration files.  This can only be used as the first option given on the command-line.

       --wipnity, -w
              Get information from <https://release.debian.org/migration/>.  A package name must be given when using this option.

       --help Show a brief usage message.

       --version
              Show version and copyright information.

       --no-autoremovals
              Investigate and show only testing propagation excuses, not autoremovals.

       --debug
              Print debugging output to stderr (including url(s) fetched).

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced in that order to set configuration variables.  Command line options can be used to override configuration file set‐
       tings.  Environment variable settings are ignored for this purpose.  The currently recognised variable is:

       GREP_EXCUSES_MAINTAINER
              The default maintainer, email or package to grep for if none is specified on the command line.

SEE ALSO
       devscripts.conf(5)

AUTHOR
       Joey Hess <joeyh@debian.org>; modifications by Julian Gilbey <jdg@debian.org>.

DEBIAN                                                                                       Debian Utilities                                                                             GREP-EXCUSES(1)
