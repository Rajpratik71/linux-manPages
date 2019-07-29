AIRDECAP-NG(1)                                                General Commands Manual                                               AIRDECAP-NG(1)

NAME
       airdecap-ng - decrypt a WEP/WPA crypted pcap file

SYNOPSIS
       airdecap-ng [options] <pcap file>

DESCRIPTION
       airdecap-ng decrypts a WEP/WPA crypted pcap file to a unencrypted one by using the right WEP/WPA keys.

OPTIONS
       -H, --help
              Shows the help screen.

       -l     Do not remove the 802.11 header.

       -b <bssid>
              Access point MAC address filter.

       -k <pmk>
              WPA Pairwise Master Key in hex.

       -e <essid>
              Target  network SSID. For SSID containing special characters, see https://www.aircrack-ng.org/doku.php?id=faq#how_to_use_spaces_dou‐
              ble_quote_and_single_quote_etc_in_ap_names

       -p <pass>
              Target network WPA passphrase.

       -w <key>
              Target network WEP key in hex.

EXAMPLES
       airdecap-ng -b 00:09:5B:10:BC:5A open-network.cap
       airdecap-ng -w 11A3E229084349BC25D97E2939 wep.cap
       airdecap-ng -e my_essid -p my_passphrase tkip.cap

AUTHOR
       This manual page was written by Adam Cecile <gandalf@le-vert.net> for the Debian system (but may be used by others).  Permission is granted
       to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or any later version published
       by the Free Software Foundation On Debian systems, the complete text of the GNU General Public License can be found  in  /usr/share/common-
       licenses/GPL.

SEE ALSO
       airbase-ng(8)
       aireplay-ng(8)
       airmon-ng(8)
       airodump-ng(8)
       airodump-ng-oui-update(8)
       airserv-ng(8)
       airtun-ng(8)
       besside-ng(8)
       easside-ng(8)
       tkiptun-ng(8)
       wesside-ng(8)
       aircrack-ng(1)
       airdecloak-ng(1)
       airolib-ng(1)
       besside-ng-crawler(1)
       buddy-ng(1)
       ivstools(1)
       kstats(1)
       makeivs-ng(1)
       packetforge-ng(1)
       wpaclean(1)
       airventriloquist(8)

Version 1.5.2                                                      December 2018                                                    AIRDECAP-NG(1)
