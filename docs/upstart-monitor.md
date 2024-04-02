upstart-monitor(8)                                            System Manager's Manual                                           upstart-monitor(8)

NAME
       upstart-monitor - Display system and session Upstart events

SYNOPSIS
       upstart-monitor [OPTIONS]...

DESCRIPTION
       upstart-monitor displays Upstart system events or Upstart session events using either a command-line or graphical interface.

OPTIONS
       -d destination , --destination=destination
              Specify the endpoint to connect to. Valid destinations are session-socket, session-bus, system-socket and system-bus.

       --help Show brief usage summary.

       -n , --no-gui
              Run in command-line mode.

       -s , --separator
              Specify alternate field separator to use for command-line output (default is a single tab character).

NOTES
       ·   By default, upstart-monitor will attempt to start in a graphical mode unless --no-gui is specified. However, if it is unable to display
           a graphical interface, it will display a warning message and automatically revert to the command-line interface.

       ·   When no command-line option (that affects the destination) is specified, upstart-monitor will attempt to connect to  the  Session  Init
           (destination  session-socket) and display session events. In this mode, it will display both session events and system events, assuming
           the upstart-event-bridge(8) is running.

           If invoked with no arguments from within a non-Upstart session environment it will attempt to connect to Upstart running as process  ID
           1 (destination system-bus) and will only display system events.

AUTHOR
       Written by James Hunt <james.hunt@ubuntu.com>

BUGS
       Report bugs at <https://launchpad.net/ubuntu/+source/upstart/+bugs>

COPYRIGHT
       Copyright © 2013 Canonical Ltd.

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

SEE ALSO
       init(5) init(8) upstart-events(7) upstart-event-bridge(8)

upstart                                                             2013-03-13                                                  upstart-monitor(8)
