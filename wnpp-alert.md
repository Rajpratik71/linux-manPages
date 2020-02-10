WNPP-ALERT(1)                                                                            General Commands Manual                                                                            WNPP-ALERT(1)

NAME
       wnpp-alert - check for installed packages up for adoption or orphaned

SYNOPSIS
       wnpp-alert [--diff] [package ...]
       wnpp-alert --help|--version

DESCRIPTION
       wnpp-alert  downloads the lists of packages which have been orphaned (O), are up for adoption (RFA), or the maintainer has asked for help (RFH) from the WNPP webpages, and then outputs a list of
       packages installed on the system, or matching the listed packages, which are in those lists.

       Note that WNPP, and therefore wnpp-alert's output, is source package based.

OPTIONS
       --diff, -d
              If the $XDG_CACHE_HOME/devscripts directory exists, compare the output of wnpp-alert to the previous output (cached in the file wnpp-diff) and output the differences.

       --help, -h
              Show a summary of options.

       --version, -v
              Show version and copyright information.

SEE ALSO
       https://www.debian.org/devel/wnpp

AUTHOR
       wnpp-alert was written by Arthur Korn <arthur@korn.ch> and modified by Julian Gilbey <jdg@debian.org> for the devscripts package.  It is in the public domain.

DEBIAN                                                                                       Debian Utilities                                                                               WNPP-ALERT(1)
