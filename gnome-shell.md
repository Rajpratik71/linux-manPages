GNOME-SHELL(1)                                                      gnome-shell                                                     GNOME-SHELL(1)

NAME
       gnome-shell - Graphical shell for the GNOME desktop

SYNOPSIS
       gnome-shell [OPTION...]

DESCRIPTION
       GNOME shell provides core user interface functions for the GNOME 3 desktop, like switching to windows and launching applications. GNOME
       shell takes advantage of the capabilities of modern graphics hardware and introduces innovative user interface concepts to provide a
       visually attractive and easy to use experience.

       gnome-shell is a required component of the GNOME desktop, i.e. it is listed in the RequiredComponents field of
       /usr/share/gnome-session/sessions/gnome.session. It is started in the window manager phase of the session.

OPTIONS
       -r, --replace
           Replace the running window manager

       --sm-disable
           Disable connection to the session manager

       --sm-client-id=ID
           Specify session management ID

       --sm-save-file=FILE
           Initialize session from FILE

       --screen=SCREEN
           X screen to use

       -d, --display=DISPLAY
           X Display to use

       --sync
           Make X calls synchronous

       --version
           Print version and exit

       --help
           Display help and exit

       --mode=MODE
           Use a specific mode, e.g. "gdm" for login screen

       --list-modes
           List possible modes and exit

       --clutter-display=DISPLAY
           Clutter the option display (otherwise ignored)

FILES
       /usr/share/gnome-session/sessions/gnome.session, /usr/share/applications/org.gnome.Shell.desktop.

BUGS
       The bug tracker can be reached by visiting the website https://bugzilla.gnome.org/buglist.cgi?product=gnome-shell. Before sending a bug
       report, please verify that you have the latest version of gnome-shell. Many bugs (major and minor) are fixed at each release, and if yours
       is out of date, the problem may already have been solved.

ADDITIONAL INFORMATION
       For further information, visit the website http://live.gnome.org/GnomeShell.

gnome-shell                                                                                                                         GNOME-SHELL(1)
