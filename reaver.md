Reaver(1)                                                     General Commands Manual                                                    Reaver(1)

NAME
       Reaver - WPS Cracker

SYNOPSIS
       reaver -i <interface> -b <target bssid> -vv

DESCRIPTION
       Reaver implements a brute force attack against WiFi Protected Setup which can crack the WPS pin of an access point in a matter of hours and
       subsequently recover the WPA/WPA2 passphrase.

       Specifically, Reaver targets the registrar functionality of WPS, which is flawed in that it only takes 11,000 attempts to guess the correct
       WPS  pin  in  order  to become a WPS registrar. Once registred as a registrar with the access point, the access point will give you the WPA
       passphrase.

OPTIONS
              -m, --mac=<mac>
                     MAC of the host system (should be resolved automatically)

              -e, --essid=<ssid>
                     ESSID of the target AP. Unless cloaked, this will be resolved automatically.

              -c, --channel=<channel>
                     Set the 802.11 channel for the interface (implies -f)

              -o, --out-file=<file>
                     Send output to a log file [default: stdout]

              -f, --fixed
                     Disable channel hopping

              -5, --5ghz
                     Use 5GHz 802.11 channels

              -v, --verbose
                     Display non-critical warnings (-vv for more)

              -q, --quiet
                     Only display critical messages

              -i, --interface=<wlan>
                     Name of the monitor-mode interface to use

              -b, --bssid=<mac>
                     BSSID of the target AP

              -p, --pin=<wps pin>
                     Use the specified WPS pin

              -h, --help
                     Show help

AUTHOR
       This manual page was written by Craig Heffner <cheffner@tacnetsol.com>, Tactical Network Solutions.  Permission   is   granted   to   copy,
       distribute  and/or   modify  this  document  under the terms of the GNU General Public License, Version 2 or any later version published by
       the Free Software Foundation, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

1.3                                                              29 December, 2011                                                       Reaver(1)
