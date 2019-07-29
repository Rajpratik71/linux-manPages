NETWORKD-DISPATCHER(8)                                                                                                                                                          NETWORKD-DISPATCHER(8)

NAME
       networkd-dispatcher - Dispatcher service for systemd-networkd connection status changes

SYNOPSIS
       networkd-dispatcher [-h] [-S SCRIPT_DIR] [-T] [-v] [-q]

DESCRIPTION
       Dispatcher daemon for systemd-networkd connection status changes. This daemon is similar to NetworkManager-dispatcher, but is much more limited in the types of events it supports due to the
       limited nature of systemd-networkd(8).

       Desired actions (scripts) are placed into directories that reflect systemd-networkd operational states under SCRIPT_DIR and are executed when the daemon receives the relevant event from
       systemd-networkd.

       The deamon listens for signals from systemd-networkd over dbus, so it should be very light on resources (e.g. no polling). It is meant to be run as a system-wide daemon (as root). This allows
       it to be used for tasks such as starting a VPN after a connection is established.

OPTIONS
       -h, --help
           Print command-line syntax and program options to stdout.

       -S, --script-dir=SCRIPT_DIR
           Location under which to look for scripts. Like the PATH environment variable, this may contain multiple directories separated by : and in case multiple directories have scripts with the
           same name, the earliest directory wins. Defaults to /etc/networkd-dispatcher:/usr/lib/networkd-dispatcher.

       -T, --run-startup-triggers
           Generate events reflecting preexisting state and behavior on startup. This can be used to ensure that triggers are belatedly run even if networkd-dispatcher is invoked after
           systemd-networkd has already started an interface.

       -v, --verbose
           Increase verbosity by one level. The default level is WARNING. Each use of -v will increment the log level (towards INFO or DEBUG), and each use of -q will decrement it (towards ERROR or
           CRITICAL).

       -q, --quiet
           Decrease verbosity by one level.

CONFIGURATION FILES
       The systemd service reads /etc/default/networkd-dispatcher as an environment file for additional daemon arguments.

       The scripts to be run on network changes are in subdirectories routable.d/, dormant.d/, no-carrier.d/, off.d/ inside SCRIPT_DIR. The default value for SCRIPT_DIR is
       /etc/networkd-dispatcher:/usr/lib/networkd-dispatcher.

RESOURCES
       GitHub: https://github.com/craftyguy/networkd-dispatcher

SEE ALSO
       systemd-networkd(8), networkctl(1)

                                                                                              10/15/2018                                                                        NETWORKD-DISPATCHER(8)
