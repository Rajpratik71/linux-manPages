DH_INSTALLPPP(1)                               Debhelper                              DH_INSTALLPPP(1)

NAME
       dh_installppp - install ppp ip-up and ip-down files

SYNOPSIS
       dh_installppp [debhelper options] [--name=name]

DESCRIPTION
       dh_installppp is a debhelper program that is responsible for installing ppp ip-up and ip-down
       scripts into package build directories.

FILES
       debian/package.ppp.ip-up
           Installed into etc/ppp/ip-up.d/package in the package build directory.

       debian/package.ppp.ip-down
           Installed into etc/ppp/ip-down.d/package in the package build directory.

OPTIONS
       --name=name
           Look for files named debian/package.name.ppp.ip-* and install them as etc/ppp/ip-*/name,
           instead of using the usual files and installing them as the package name.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                              DH_INSTALLPPP(1)
