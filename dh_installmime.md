DH_INSTALLMIME(1)                                                    Debhelper                                                   DH_INSTALLMIME(1)

NAME
       dh_installmime - install mime files into package build directories

SYNOPSIS
       dh_installmime [debhelper options]

DESCRIPTION
       dh_installmime is a debhelper program that is responsible for installing mime files into package build directories.

FILES
       debian/package.mime
           Installed into usr/lib/mime/packages/package in the package build directory.

       debian/package.sharedmimeinfo
           Installed into /usr/share/mime/packages/package.xml in the package build directory.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                   DH_INSTALLMIME(1)
