DH_INSTALLMENU(1)                                                    Debhelper                                                   DH_INSTALLMENU(1)

NAME
       dh_installmenu - install Debian menu files into package build directories

SYNOPSIS
       dh_installmenu [debhelper options] [-n]

DESCRIPTION
       dh_installmenu is a debhelper program that is responsible for installing files used by the Debian menu package into package build
       directories.

       It also automatically generates the postinst and postrm commands needed to interface with the Debian menu package. These commands are
       inserted into the maintainer scripts by dh_installdeb(1).

FILES
       debian/package.menu
           Debian menu files, installed into usr/share/menu/package in the package build directory. See menufile(5) for its format.

       debian/package.menu-method
           Debian menu method files, installed into etc/menu-methods/package in the package build directory.

OPTIONS
       -n, --no-scripts
           Do not modify postinst/postrm scripts.

SEE ALSO
       debhelper(7) update-menus(1) menufile(5)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                   DH_INSTALLMENU(1)
