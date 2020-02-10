MANPAGE-ALERT(1)                                                                         General Commands Manual                                                                         MANPAGE-ALERT(1)

NAME
       manpage-alert - check for binaries without corresponding manpages

SYNOPSIS
       manpage-alert [options] [paths]

DESCRIPTION
       manpage-alert searches the given list of paths for binaries without corresponding manpages.

       If no paths are specified on the command line, the path list /bin /sbin /usr/bin /usr/sbin /usr/games will be assumed.

OPTIONS
       -h,--help
              Show a summary of options.

       -V,--version
              Show version and copyright information.

       -f,--file
              Show filenames of missing manpages without any leading text.

       -p,--package
              Show filenames of missing manpages with their package name.

       -n,--no-stat
              Do not show statistics at the end.

AUTHOR
       manpage-alert was written by Branden Robinson and modified by Julian Gilbey <jdg@debian.org> and Adam D. Barratt <debian-bts@adam-barratt.org.uk> (who also wrote this manpage) for the devscripts
       package.

       This manpage and the associated program are licensed under the terms of the GPL, version 2 or later.

DEBIAN                                                                                       Debian Utilities                                                                            MANPAGE-ALERT(1)
