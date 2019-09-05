DH_GNOME_CLEAN(1)                                                 gnome-pkg-tools                                                DH_GNOME_CLEAN(1)

NAME
       dh_gnome - tools for the Debian GNOME Packaging Team

SYNOPSIS
       dh_gnome_clean [debhelper options] [--no-control] [--check-dist]

DESCRIPTION
       gnome-pkg-tools contains some useful tools for the Debian GNOME Packaging Team.

       dh_gnome_clean is a tool designed to provide useful functions to GNOME packages which do use of debhelper as preferred build system,
       similar to the CDBS routines provided by gnome-pkg-tools.

       dh_gnome_clean handles some routines to be run during clean phase.

OPTIONS
       --no-control
           Use this flag if you do not want to recreate debian/control file on top of debian/control.in, or if you do not provide the latter.

       --check-dist
           Use this flag if you want to avoid unwanted uploads to unstable.

SEE ALSO
       debhelper(7)

       This program is a part of gnome-pkg-tools but is made to work with debhelper.

AUTHORS
       Luca Falavigna <dktrkranz@debian.org>

                                                                    2010-11-01                                                   DH_GNOME_CLEAN(1)
