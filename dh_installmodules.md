DH_INSTALLMODULES(1)                           Debhelper                          DH_INSTALLMODULES(1)

NAME
       dh_installmodules - register kernel modules

SYNOPSIS
       dh_installmodules [debhelper options] [-n] [--name=name]

DESCRIPTION
       dh_installmodules is a debhelper program that is responsible for registering kernel modules.

       Kernel modules are searched for in the package build directory and if found, preinst, postinst
       and postrm commands are automatically generated to run depmod and register the modules when the
       package is installed.  These commands are inserted into the maintainer scripts by
       dh_installdeb(1).

FILES
       debian/package.modprobe
           Installed to etc/modprobe.d/package.conf in the package build directory.

OPTIONS
       -n, --no-scripts
           Do not modify preinst/postinst/postrm scripts.

       --name=name
           When this parameter is used, dh_installmodules looks for and installs files named
           debian/package.name.modprobe instead of the usual debian/package.modprobe

NOTES
       Note that this command is not idempotent. dh_prep(1) should be called between invocations of
       this command. Otherwise, it may cause multiple instances of the same text to be added to
       maintainer scripts.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                          DH_INSTALLMODULES(1)
