onboard(1)                                                                                   X11 application                                                                                   onboard(1)

NAME
       onboard - On-screen Keyboard

SYNOPSIS
       onboard [ options ]

DESCRIPTION
       onboard  is an on-screen keyboard that can be useful for tablet PC users, as well as  for mobility impaired people.

       onboard supports macros, easy layout creation and word suggestion.

OPTIONS
       onboard accepts the following command-line options:

       -h, --help
              Display a help with all available command line options and exit.

       -l <LAYOUT>, --layout=<LAYOUT>
              Layout file (.onboard) or name

       -t <THEME>, --theme=<THEME>
              Theme file (.theme) or name

       -x <X> Window x position

       -y <Y> Window y position

       -s <SIZE>, --size=<SIZE>
              Window size, widthxheight

       -e, --xid
              Start in XEmbed mode, e.g. for gnome-screensaver

       -a, --keep-aspect
              Keep aspect ratio when resizing the window

       -d <DEBUG>, --debug=<DEBUG>
              <DEBUG>={notset|debug|info|warning|error|critical}

       -m, --allow-multiple-instances
              Allow multiple Onboard instances

       -q <QUIRKS>, --quirks=<QUIRKS>
              Override auto-detection and manually select quirks QUIRKS={metacity|compiz|mutter}

       --not-show-in=<DESKTOPS>
              Silently fail to start in the given desktop environments. <DESKTOPS> is a comma-separated list of XDG desktop names, e.g. GNOME for GNOME Shell.

       -g, --log-learning
              log all learned text; off by default

SEE ALSO
       /usr/share/doc/onboard

AUTHOR
       This manual has been written by Mike Gabriel <mike.gabriel@das-netzwerkteam.de> by using the options from Config.py (see COPYING file for authors of options).  It is distributed under the GPL-3+
       license.

Version 1.2.0                                                                                    Feb 2016                                                                                      onboard(1)
