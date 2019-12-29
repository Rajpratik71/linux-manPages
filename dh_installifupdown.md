DH_INSTALLIFUPDOWN(1)                          Debhelper                         DH_INSTALLIFUPDOWN(1)

NAME
       dh_installifupdown - install if-up and if-down hooks

SYNOPSIS
       dh_installifupdown [debhelper options] [--name=name]

DESCRIPTION
       dh_installifupdown is a debhelper program that is responsible for installing if-up, if-down,
       if-pre-up, and if-post-down hook scripts into package build directories.

FILES
       debian/package.if-up
       debian/package.if-down
       debian/package.if-pre-up
       debian/package.if-post-down
           These files are installed into etc/network/if-*.d/package in the package build directory.

OPTIONS
       --name=name
           Look for files named debian/package.name.if-* and install them as etc/network/if-*/name,
           instead of using the usual files and installing them as the package name.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                         DH_INSTALLIFUPDOWN(1)
