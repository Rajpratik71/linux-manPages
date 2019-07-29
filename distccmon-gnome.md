Distccmon-gnome(1)                                            General Commands Manual                                           Distccmon-gnome(1)

NAME
       Distccmon-gnome - GTK monitor for distcc a distributed client and server

SYNOPSIS
       distccmon-gnome [OPTION...]

DESCRIPTION
       This manual page documents briefly the Distccmon-gnome commands.

OPTIONS
       This version of distccmon-gnome understands the following command line options:

       --load-modules=MODULE1,MODULE2,...
              Dynamic modules to load

       -?, --help
              Show this help message

       --usage
              Display brief usage message

       --gdk-debug=FLAGS
              Gdk debugging flags to set

       --gdk-no-debug=FLAGS
              Gdk debugging flags to unset

       --display=DISPLAY
              X display to use

       --screen=SCREEN
              X screen to use

       --sync Make X calls synchronous

       --name=NAME
              Program name as used by the window manager

       --class=CLASS
              Program class as used by the window manager

       --gtk-debug=FLAGES
              Gtk+ debugging flags to set

       --gtk-no-debug=FLAGS
              Gtk+ debugging flags to unset

       --g-fatal-warnings
              Make all warnings fatal

       --gtk-module=MODULE
              Load an additional Gtk module

       --oaf-ior-fd=FD
              File descriptor to print IOR on

       --oaf-activate-iid=IID
              IID to activate

       --oaf-private
              Prevent registering of server with OAF

       --disable-sound
              Disable sound server usage

       --enable-sound
              Enable sound server usage

       --espeaker=HOSTNAME:PORT
              Host:port on which the sound server to use is running

       --version
              Print the current version of distccmon-gnome

       --sm-client-id=ID
              Specify session management ID

       --sm-config-prefix=PREFIX
              Specify prefix of saved configuration

       --sm-disable
              Disable connection to session manager

       --disable-crash-dialog
              Disable Crash Dialog

AUTHOR
       Distccmon-gnome was written by Martin Pool.

       This manual page was written by Mohammed Adnène Trojette for the Debian project (but may be used by others).

                                                                   March 1, 2005                                                Distccmon-gnome(1)
