PULL-DEBIAN-DEBDIFF(1)                                        General Commands Manual                                       PULL-DEBIAN-DEBDIFF(1)

NAME
       pull-debian-debdiff - find, download, and generate a debdiff

SYNOPSIS
       pull-debian-debdiff [options] <package> <version> [distance]

DESCRIPTION
       pull-debian-debdiff attempts to find and download a specific version of a Debian package and its immediate parent to generate a debdiff.

OPTIONS
       package
              The source package to download and diff.

       version
              The most recent of the two versions you want to diff.

       distance
              If specified (default 1), the debdiff is against that many versions previous.

       -h, --help
              Display the usage instructions and exit.

       -f, --fetch
              Simply download the specified version and exit.

       -d DEBIAN_MIRROR, --debian-mirror=DEBIAN_MIRROR
              Use  the  specified  mirror.   Should  be  in  the  form  http://ftp.debian.org/debian.   If the package isn't found on this mirror,
              pull-debian-source will fall back to the default mirror.

       -s DEBSEC_MIRROR, --debsec-mirror=DEBSEC_MIRROR
              Use the specified Debian security mirror.  Should be in the form http://security.debian.org.  If the package  isn't  found  on  this
              mirror, pull-debian-source will fall back to the default mirror.

       --no-conf
              Do not read any configuration files, or configuration from environment variables.

ENVIRONMENT
       All  of  the  CONFIGURATION  VARIABLES  below are also supported as environment variables.  Variables in the environment take precedence to
       those in configuration files.

CONFIGURATION VARIABLES
       The following variables can be set in the environment or in ubuntu-dev-tools(5) configuration files.  In  each  case,  the  script-specific
       variable takes precedence over the package-wide variable.

       PULL_DEBIAN_DEBDIFF_DEBIAN_MIRROR, UBUNTUTOOLS_DEBIAN_MIRROR
              The default value for --debian-mirror.

       PULL_DEBIAN_DEBDIFF_DEBSEC_MIRROR, UBUNTUTOOLS_DEBSEC_MIRROR
              The default value for --debsec-mirror.

SEE ALSO
       debdiff(1), dget(1), pull-debian-source(1), ubuntu-dev-tools(5)

AUTHORS
       pull-debian-debdiff was written by Stefano Rivera <stefanor@ubuntu.com>, a clone of a tool by Kees Cook <kees@ubuntu.com>.

       This manual page was written by Stefano Rivera, based on the original by Andrew Starr-Bochicchio <a.starr.b@gmail.com>.

ubuntu-dev-tools                                                   December 2010                                            PULL-DEBIAN-DEBDIFF(1)
