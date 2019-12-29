DH_INSTALLUDEV(1)                              Debhelper                             DH_INSTALLUDEV(1)

NAME
       dh_installudev - install udev rules files

SYNOPSIS
       dh_installudev [debhelper options] [-n] [--name=name] [--priority=priority]

DESCRIPTION
       dh_installudev is a debhelper program that is responsible for installing udev rules files.

FILES
       debian/package.udev
           Installed into lib/udev/rules.d/ in the package build directory.

OPTIONS
       --name=name
           When this parameter is used, dh_installudev looks for and installs files named
           debian/package.name.udev instead of the usual debian/package.udev.

       --priority=priority
           Sets the priority the file. Default is 60.

NOTES
       Note that this command is not idempotent. dh_prep(1) should be called between invocations of
       this command. Otherwise, it may cause multiple instances of the same text to be added to
       maintainer scripts.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                             DH_INSTALLUDEV(1)
