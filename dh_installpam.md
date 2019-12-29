DH_INSTALLPAM(1)                               Debhelper                              DH_INSTALLPAM(1)

NAME
       dh_installpam - install pam support files

SYNOPSIS
       dh_installpam [debhelper options] [--name=name]

DESCRIPTION
       dh_installpam is a debhelper program that is responsible for installing files used by PAM into
       package build directories.

FILES
       debian/package.pam
           Installed into etc/pam.d/package in the package build directory.

OPTIONS
       --name=name
           Look for files named debian/package.name.pam and install them as etc/pam.d/name, instead of
           using the usual files and installing them using the package name.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                              DH_INSTALLPAM(1)
