DH_DKMS(1)                                                        DKMS Debhelper                                                        DH_DKMS(1)

NAME
       dh_dkms - correctly handle DKMS usage by a kernel module package

SYNOPSIS
       dh_dkms [debhelper options] [-l] [-V[version]] [-- file]

DESCRIPTION
       dh_dkms is a debhelper program that is responsible for correctly setting postinst, postrm and dependencies in kernel module packages using
       DKMS.

       If a file named debian/package.dkms exists, then different actions are performed, depending on its contents.

FILES
       debian/package.dkms
       debian/dkms
           It can be a proper configuration file, and in this case it would be installed in the proper directory as dkms.conf.

           It can also point to another file (this should be used when the configuration is provided by upstream), and in this case that file will
           be installed as dkms.conf in the proper directory.

           This file can only miss if a filename is provided when calling dh_dkms.

OPTIONS
       -l, --legacy
           Add code to also support DKMS versions < 2.1.0.0.

       -V, -V version
           If "PACKAGE_VERSION" in dkms.conf is set to "#MODULE_VERSION#", set it to the given version or, if none is given, default to the
           upstream version of the current package. Otherwise, leave the value specified in dkms.conf.

       -- file
           Don't look for debian/package.dkms or debian/dkms, but install file as dkms.conf.

NOTES
       Note that this command is not idempotent. dh_prep(1) should be called between invocations of this command. Otherwise, it may cause multiple
       instances of the same text to be added to maintainer scripts.

       IMPORTANT: binary packages using dh_dkms must have a name that ends in '-dkms'.

SEE ALSO
       debhelper(1)

       This program is part of the Debian DKMS package.

       dkms(8)

AUTHOR
       David Paleino <dapal@debian.org>

2.1.1.1                                                             2010-02-17                                                          DH_DKMS(1)
