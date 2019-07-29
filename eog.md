EOG(1)                                                                                  General Commands Manual                                                                                 EOG(1)

NAME
       eog - a GNOME image viewer

SYNOPSIS
       eog [options] files...

DESCRIPTION
       An image viewer for GNOME which uses gdk_pixbuf

USAGE
       Usage: eog [OPTION...]

       GNOME Options
         --disable-sound            Disable sound server usage
         --enable-sound             Enable sound server usage
         --espeaker=HOSTNAME:PORT   Host:port on which the sound
                                    server to use is running
         --version

       Help options
         -?, --help                 Show this help message
         --usage                    Display brief usage message

       GTK options
         --gdk-debug=FLAGS          Gdk debugging flags to set
         --gdk-no-debug=FLAGS       Gdk debugging flags to unset
         --display=DISPLAY          X display to use
         --sync                     Make X calls synchronous
         --no-xshm                  Don't use X shared
                                    memory extension
         --name=NAME                Program name as used by the
                                    window manager
         --class=CLASS              Program class as used by the
                                    window manager
         --gxid_host=HOST
         --gxid_port=PORT
         --xim-preedit=STYLE
         --xim-status=STYLE
         --gtk-debug=FLAGS          Gtk+ debugging flags to set
         --gtk-no-debug=FLAGS       Gtk+ debugging flags
                                    to unset
         --g-fatal-warnings         Make all warnings fatal
         --gtk-module=MODULE        Load an additional
                                    Gtk module

       GNOME GUI options
         --disable-crash-dialog

       Session management options
         --sm-client-id=ID          Specify session management ID
         --sm-config-prefix=PREFIX  Specify prefix of saved
                                    configuration
         --sm-disable               Disable connection to
                                    session manager

AUTHOR
       This manual page was written for the Debian GNU/Linux distribution because the original program does not have a manual page.

       This manual page was written by Dan Nguyen <dnn@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                                            April 22, 2000                                                                                      EOG(1)
