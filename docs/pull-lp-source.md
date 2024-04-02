PULL-LP-SOURCE(1)                                             General Commands Manual                                            PULL-LP-SOURCE(1)

NAME
       pull-lp-source - download a source package from Launchpad

SYNOPSIS
       pull-lp-source [options] source package [release|version]

DESCRIPTION
       pull-lp-source  downloads  and  extracts  the  specified version of <source package> from Launchpad, or the latest version of the specified
       release.  To request a version from a particular pocket say release-pocket (with a magic -release for only the release pocket).  If no ver‐
       sion or release is specified, the latest version in the development release will be downloaded.

OPTIONS
       Listed below are the command line options for pull-lp-source:

       source package
              This is the source package that you would like to be downloaded from Launchpad.

       version
              This is the version of the source package to be downloaded.

       release
              This  is  the  release that you would like the source package to be downloaded from.  This value defaults to the current development
              release.

       -h, --help
              Display a help message and exit.

       -d, --download-only
              Do not extract the source package.

       -m UBUNTU_MIRROR, --mirror=UBUNTU_MIRROR
              Use the specified Ubuntu mirror.  Should be in the form http://archive.ubuntu.com/ubuntu.  If the package isn't found on  this  mir‐
              ror, pull-lp-source will fall back to Launchpad, as its name implies.

       --no-conf
              Do not read any configuration files, or configuration from environment variables.

ENVIRONMENT
       All  of  the  CONFIGURATION  VARIABLES  below are also supported as environment variables.  Variables in the environment take precedence to
       those in configuration files.

       DIST   Specifies the default target.

CONFIGURATION VARIABLES
       The following variables can be set in the environment or in ubuntu-dev-tools(5) configuration files.  In  each  case,  the  script-specific
       variable takes precedence over the package-wide variable.

       PULL_LP_SOURCE_UBUNTU_MIRROR, UBUNTUTOOLS_UBUNTU_MIRROR
              The default value for --mirror.

SEE ALSO
       dget(1), pull-debian-source(1), pull-debian-debdiff(1), ubuntu-dev-tools(5)

AUTHOR
       pull-lp-source  and  this manual page were written by Iain Lane <iain@orangesquash.org.uk>.  Both are released under the GNU General Public
       License, version 3 or later.

ubuntu-dev-tools                                                   4 August 2008                                                 PULL-LP-SOURCE(1)
