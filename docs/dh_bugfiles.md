DH_BUGFILES(1)                                                       Debhelper                                                      DH_BUGFILES(1)

NAME
       dh_bugfiles - install bug reporting customization files into package build directories

SYNOPSIS
       dh_bugfiles [-A] [debhelper options]

DESCRIPTION
       dh_bugfiles is a debhelper program that is responsible for installing bug reporting customization files (bug scripts and/or bug control
       files and/or presubj files) into package build directories.

FILES
       debian/package.bug-script
           This is the script to be run by the bug reporting program for generating a bug report template. This file is installed as
           usr/share/bug/package in the package build directory if no other types of bug reporting customization files are going to be installed
           for the package in question. Otherwise, this file is installed as usr/share/bug/package/script. Finally, the installed script is given
           execute permissions.

       debian/package.bug-control
           It is the bug control file containing some directions for the bug reporting tool. This file is installed as
           usr/share/bug/package/control in the package build directory.

       debian/package.bug-presubj
           The contents of this file are displayed to the user by the bug reporting tool before allowing the user to write a bug report on the
           package to the Debian Bug Tracking System. This file is installed as usr/share/bug/package/presubj in the package build directory.

OPTIONS
       -A, --all
           Install debian/bug-* files to ALL packages acted on when respective debian/package.bug-* files do not exist. Normally, debian/bug-*
           will be installed to the first package only.

SEE ALSO
       /usr/share/doc/reportbug/README.developers.gz

       debhelper(1)

       This program is a part of debhelper.

AUTHOR
       Modestas Vainius <modestas@vainius.eu>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                      DH_BUGFILES(1)
