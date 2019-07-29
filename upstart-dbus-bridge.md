upstart-dbus-bridge(8)                                        System Manager's Manual                                       upstart-dbus-bridge(8)

NAME
       upstart-dbus-bridge - Bridge between Upstart and D-Bus

SYNOPSIS
       upstart-dbus-bridge [OPTIONS]...

DESCRIPTION
       upstart-dbus-bridge receives information about D-Bus signals and creates init(8) events for them.

       With  no  options,  monitors  signals  on  the D-Bus system bus and emits an Upstart event called dbus via a D-Bus system bus connection to
       Upstart.

       When run with --user, monitors signals on the users D-Bus session bus and emits Upstart events via the  private  D-Bus  connection  to  the
       users Session Init.

       See dbus-daemon(1) and for further details.

OPTIONS
       --always
              Always emit events on receipt of D-Bus signal regardless of whether jobs care about them.

       --daemon
              Detach and run in the background.

       --debug
              Enable debugging output.

       --help Show brief usage summary.

       --session
              Monitor signals on the D-Bus session bus.

       --system
              Monitor signals on the D-Bus system bus.

       --user User-session mode: connect to Upstart via the user session rather than over the D-Bus system bus.

       --bus-name
              Set  a  name  for  the bus to be passed as an additional argument to the event under the property BUS.  Used to distinguish multiple
              D-Bus bridges.

       --verbose
              Enable verbose output.

RESTRICTIONS
       D-Bus signals emitted by Upstart itself are ignored.

AUTHOR
       Written by James Hunt <james.hunt@canonical.com>

BUGS
       Report bugs at <https://launchpad.net/ubuntu/+source/upstart/+bugs>

COPYRIGHT
       Copyright © 2013 Canonical Ltd.

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

SEE ALSO
       dbus-daemon(1) dbus-event(7) init(5) init(8)

upstart                                                             2013-04-25                                              upstart-dbus-bridge(8)
