XFSETTINGSD(1)                                                                        User Commands                                                                        XFSETTINGSD(1)

NAME
       xfsettingsd - XSettings daemon for Xfce

DESCRIPTION
   Usage:
              xfsettingsd [OPTION...]

   Help Options:
       -h, --help
              Show help options

       --help-all
              Show all help options

       --help-gtk
              Show GTK+ Options

       --help-sm-client
              Show session management options

       GTK+ Options

       --class=CLASS
              Program class as used by the window manager

       --name=NAME
              Program name as used by the window manager

       --screen=SCREEN
              X screen to use

       --sync Make X calls synchronous

       --gtk-module=MODULES
              Load additional GTK+ modules

       --g-fatal-warnings
              Make all warnings fatal

       Session management options

       --sm-client-id=ID
              Session management client ID

       --sm-client-disable
              Disable session management

   Application Options:
       -V, --version
              Version information

       --no-daemon
              Do not fork to the background

       --replace
              Replace running xsettings daemon (if any)

       --display=DISPLAY
              X display to use

COPYRIGHT
       Copyright © 2008-2011

              The Xfce development team. All rights reserved.

       Please report bugs to <http://bugzilla.xfce.org/>.

xfsettingsd 4.11.0 (Xfce 4.10)                                                        September 2013                                                                       XFSETTINGSD(1)
