DH_ICONS(1)                                    Debhelper                                   DH_ICONS(1)

NAME
       dh_icons - Update caches of Freedesktop icons

SYNOPSIS
       dh_icons [debhelper options] [-n]

DESCRIPTION
       dh_icons is a debhelper program that updates caches of Freedesktop icons when needed, using the
       update-icon-caches program provided by GTK+2.12.  Currently this program does not handle
       installation of the files, though it may do so at a later date, so should be run after icons
       are installed in the package build directories.

       It takes care of adding maintainer script fragments to call update-icon-caches for icon
       directories. (This is not done for gnome and hicolor icons, as those are handled by triggers.)
       These commands are inserted into the maintainer scripts by dh_installdeb(1).

OPTIONS
       -n, --no-scripts
           Do not modify maintainer scripts.

SEE ALSO
       debhelper

       This program is a part of debhelper.

AUTHOR
       Ross Burton <ross@burtonini.com> Jordi Mallach <jordi@debian.org> Josselin Mouette
       <joss@debian.org>

12.6.1ubuntu2                                 2019-09-17                                   DH_ICONS(1)
