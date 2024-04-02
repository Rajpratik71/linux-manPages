PLASMAPKG(1)                                                                                  KDE User's Manual                                                                                  PLASMAPKG(1)



NAME
       plasmapkg - Install, list, remove Plasma packages

SYNOPSIS
       plasmapkg [-h, --hash path] [-g, --global] [-t, --type type] [-i, --install path] [-u, --upgrade path] [-l, --list] [--list-types] [-r, --remove name] [-p, --packageroot path] [KDE Generic Options]
                 [Qt Generic Options]

DESCRIPTION
       plasmapkg is a command line tool to install, list, remove Plasma packages.

OPTIONS
       -h, --hash  path
           Generate a SHA1 hash for the package at “path”.

       -g, --global
           For install or remove, operates on packages installed for all users.

       -t, --type  type
           The type of package, e.g.  theme, wallpaper, plasmoid, dataengine, runner, layout-template, etc.  [plasmoid].

       -i, --install  path
           Install the package at “path”.

       -u, --upgrade  path
           Upgrade the package at “path”.

       -l, --list
           List installed packages.

       -r, --remove  name
           Remove the package named “name”.

       -p, --packageroot  path
           Absolute path to the package root. If not supplied, then the standard data directories for this KDE session will be searched instead.

SEE ALSO
       More detailed user documentation is available from help:/plasma-desktop (either enter this URL into Konqueror, or run khelpcenter help:/plasma-desktop).

AUTHORS
       plasmapkg was written by Aaron Seigo<aseigo@kde.org>.



K Desktop Environment                                                                             2012-12-05                                                                                     PLASMAPKG(1)
