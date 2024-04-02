PULL-DEBIAN-SOURCE(1)                                         General Commands Manual                                        PULL-DEBIAN-SOURCE(1)

NAME
       pull-debian-source - download and extract a source package from Debian

SYNOPSIS
       pull-debian-source [options] <source package> [release|version]

DESCRIPTION
       pull-debian-source downloads and extracts the specified version of source package, or the latest version in the specified Debian release.

       pull-debian-source  will  try  the preferred mirror, default mirror, security mirror, and fall back to Launchpad or snapshot.debian.org, in
       search of the requested version.

OPTIONS
       source package
              The source package to download from Debian.

       release
              The release to download the source package from. Defaults to unstable.

       version
              The specific version of the package to download.

       -d, --download-only
              Do not extract the source package.

       -m DEBIAN_MIRROR, --mirror=DEBIAN_MIRROR
              Use the specified mirror.  Should be in the  form  http://ftp.debian.org/debian.   If  the  package  isn't  found  on  this  mirror,
              pull-debian-source will fall back to the default mirror.

       -s DEBSEC_MIRROR, --security-mirror=DEBSEC_MIRROR
              Use  the  specified  mirror.   Should  be  in  the  form  http://security.debian.org.   If  the  package isn't found on this mirror,
              pull-debian-source will fall back to the default mirror.

       --no-conf
              Do not read any configuration files, or configuration from environment variables.

       -h, --help
              Display the usage instructions and exit.

ENVIRONMENT
       All of the CONFIGURATION VARIABLES below are also supported as environment variables.  Variables in  the  environment  take  precedence  to
       those in configuration files.

CONFIGURATION VARIABLES
       The  following  variables  can  be set in the environment or in ubuntu-dev-tools(5) configuration files.  In each case, the script-specific
       variable takes precedence over the package-wide variable.

       PULL_DEBIAN_SOURCE_DEBIAN_MIRROR, UBUNTUTOOLS_DEBIAN_MIRROR
              The default value for --mirror.

       PULL_DEBIAN_SOURCE_DEBSEC_MIRROR, UBUNTUTOOLS_DEBSEC_MIRROR
              The default value for --security-mirror.

SEE ALSO
       dget(1), pull-debian-debdiff(1), pull-lp-source(1), ubuntu-dev-tools(5)

ubuntu-dev-tools                                                  22 January 2011                                            PULL-DEBIAN-SOURCE(1)
