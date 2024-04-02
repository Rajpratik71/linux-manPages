ALACARTE(1)                                                        User Commands                                                       ALACARTE(1)

NAME
       alacarte - Edit freedesktop.org menus

SYNOPSIS
       alacarte

DESCRIPTION
       alacarte is a graphical editor for the freedesktop.org menus that are used by many desktop environments. It can also edit and create
       application desktop files.

OPTIONS
       alacarte does not accept any commandline options.

ENVIRONMENT
       XDG_CONFIG_DIRS
           alacarte looks in the menus subdirectory of these directories for menu files. The default location for menu files is /etc/xdg/menus.

       XDG_DATA_DIRS
           alacarte looks in the applications subdirectory of these directories for desktop files. The default location for desktop files is
           /usr/share/applications.

       XDG_CONFIG_HOME
           The menus subdirectory of this directory is where alacarte stores modified menu files. The default location for modified menu files is
           $HOME/.config/menus.

       XDG_DATA_HOME
           The applications subdirectory of this directory is where alacarte stores modified and newly created desktop files. The default location
           for these is $HOME/.local/share/applications.

       XDG_MENU_PREFIX
           alacarte is editing the menus defined by the file $XDG_MENU_PREFIXapplications.menu. GNOME uses the menu file gnome-applications.menu.

GNOME                                                                                                                                  ALACARTE(1)
