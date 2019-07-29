DH_GNOME(1)                                                       gnome-pkg-tools                                                      DH_GNOME(1)

NAME
       dh_gnome - tools for the Debian GNOME Packaging Team

SYNOPSIS
       dh_gnome [debhelper options] [--no-clean-la] [--no-gnome-version]

DESCRIPTION
       gnome-pkg-tools contains some useful tools for the Debian GNOME Packaging Team.

       dh_gnome is a tool designed to provide useful functions to GNOME packages which do use of debhelper as preferred build system, similar to
       the CDBS routines provided by gnome-pkg-tools.

       dh_gnome handles some routines to be run during binary-install phase.

OPTIONS
       --no-clean-la
           Use this flag if you do not want to automatically empty dependency_libs fields provided by your packages' .la files.

       --no-gnome-versions
           Use this flag if you do not want to generate GNOME subsvars for your packages.

SEE ALSO
       debhelper(7)

       This program is a part of gnome-pkg-tools but is made to work with debhelper.

AUTHORS
       Luca Falavigna <dktrkranz@debian.org>

                                                                    2010-09-24                                                         DH_GNOME(1)
