DH_INSTALLLOGROTATE(1)                         Debhelper                        DH_INSTALLLOGROTATE(1)

NAME
       dh_installlogrotate - install logrotate config files

SYNOPSIS
       dh_installlogrotate [debhelper options] [--name=name]

DESCRIPTION
       dh_installlogrotate is a debhelper program that is responsible for installing logrotate config
       files into etc/logrotate.d in package build directories.  Files named debian/package.logrotate
       are installed.

OPTIONS
       --name=name
           Look for files named debian/package.name.logrotate and install them as
           etc/logrotate.d/name, instead of using the usual files and installing them as the package
           name.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                        DH_INSTALLLOGROTATE(1)
