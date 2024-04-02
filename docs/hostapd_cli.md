HOSTAPD_CLI(1)                                            hostapd command-line interface                                            HOSTAPD_CLI(1)

NAME
       hostapd_cli - hostapd command-line interface

SYNOPSIS
       hostapd_cli [-p<path>] [-i<ifname>] [-a<path>] [-hvB] [command..]

DESCRIPTION
       This manual page documents briefly the hostapd_cli utility.

       hostapd_cli is a command-line interface for the hostapd daemon.

       hostapd  is  a  user  space  daemon  for  access point and authentication servers.  It implements IEEE 802.11 access point management, IEEE
       802.1X/WPA/WPA2/EAP Authenticators and RADIUS authentication server.  For more information about hostapd refer to the hostapd(8) man page.

OPTIONS
       A summary of options is included below.  For a complete description, run hostapd_cli from the command line.

       -p<path>
              Path to find control sockets.

              Default: /var/run/hostapd

       -i<ifname>
              Interface to listen on.

              Default: first interface found in socket path.

       -a<path>
              Run in daemon mode executing the action file based on events from hostapd.

       -B     Run a daemon in the background.

       -h     Show usage.

       -v     Show hostapd_cli version.

COMMANDS
       A summary of commands is included below.  For a complete description, run hostapd_cli from the command line.

       mib    Get MIB variables (dot1x, dot11, radius).

       sta <addr>
              Get MIB variables for one station.

       all_sta
              Get MIB variables for all stations.

       help   Get usage help.

       interface [ifname]
              Show interfaces/select interface.

       level <debug level>
              Change debug level.

       license
              Show full hostapd_cli license.

       quit   Exit hostapd_cli.

SEE ALSO
       hostapd(8).

AUTHOR
       hostapd_cli was written by Jouni Malinen <j@w1.fi>.

       This manual page was written by Faidon Liambotis <faidon@cube.gr>, for the Debian project (but may be used by others).

hostapd_cli                                                       April  7, 2005                                                    HOSTAPD_CLI(1)
