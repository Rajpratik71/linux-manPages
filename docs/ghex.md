GHEX(1)                                                       General Commands Manual                                                      GHEX(1)

NAME
       ghex - A GNOME Hex Editor

SYNOPSIS
       ghex [options] files...

DESCRIPTION
       This manual page documents briefly the ghex command.  This manual page was written for the Debian GNU/Linux distribution because the origi‐
       nal program does not have a manual page.  Instead, it has documentation in the GNOME help system.

       ghex allows the user to load data from any file, view and edit it in either hex or ascii. A must for anyone playing  games  that  use  non-
       ascii format for saving.

OPTIONS
       These  programs  follow  the  usual  GNU  command  line  syntax, with long options starting with two dashes (`-').  A summary of options is
       included below.

       Usage: ghex [OPTION...]

       GNOME options
         --disable-sound             Disable sound server usage
         --enable-sound              Enable sound server usage
         --espeaker=HOSTNAME:PORT    Host:port on which the sound server to use is
                                     running
         --version

       Help options
         -?, --help                  Show this help message
         --usage                     Display brief usage message

       GTK options
         --gdk-debug=FLAGS           Gdk debugging flags to set
         --gdk-no-debug=FLAGS        Gdk debugging flags to unset
         --display=DISPLAY           X display to use
         --sync                      Make X calls synchronous
         --no-xshm                   Don't use X shared memory extension
         --name=NAME                 Program name as used by the window manager
         --class=CLASS               Program class as used by the window manager
         --gxid_host=HOST
         --gxid_port=PORT
         --xim-preedit=STYLE
         --xim-status=STYLE
         --gtk-debug=FLAGS           Gtk+ debugging flags to set
         --gtk-no-debug=FLAGS        Gtk+ debugging flags to unset
         --g-fatal-warnings          Make all warnings fatal
         --gtk-module=MODULE         Load an additional Gtk module

       GNOME GUI options
         --disable-crash-dialog

       Session management options
         --sm-client-id=ID           Specify session management ID
         --sm-config-prefix=PREFIX   Specify prefix of saved configuration
         --sm-disable                Disable connection to session manager

AUTHOR
       This manual page was written by Eric Gillespie, Jr. <epg@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                  April 14, 2001                                                           GHEX(1)
