METACITY-MESSAGE(1)                                           General Commands Manual                                          METACITY-MESSAGE(1)

NAME
       METACITY-MESSAGE - a command to send a message to Metacity

SYNOPSIS
       METACITY-MESSAGE  [  restart | reload-theme | enable-keybindings | disable-keybindings | enable-mouse-button-modifiers | disable-mouse-but‐
       ton-modifiers | toggle-verbose ]

DESCRIPTION
       This manual page documents briefly the metacity-message.  This manual page was written for the Debian  distribution  because  the  original
       program does not have a manual page.

       metacity-message send a specified message to metacity(1).

OPTIONS
       restart
              Restart metacity(1) which is running.

       reload-theme
              Reload a theme which is specified on gsettings database.

       enable-keybindings
              Enable all of keybindings which is specified on gsettings database.

       disable-keybindings
              Disable all of keybindings which is specified on gsettings database.

       enable-mouse-button-modifiers
              Enable move/resize operations while pressing a modifier key

       disable-mouse-button-modifiers
              Disable move/resize operations while pressing a modifier key

       toggle-verbose
              Turn debug messages on or off

SEE ALSO
       metacity(1)

AUTHOR
       This manual page was written by Akira TAGOH <tagoh@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                    16 May 2013                                                METACITY-MESSAGE(1)
