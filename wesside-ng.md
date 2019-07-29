WESSIDE-NG(8)                                                 System Manager's Manual                                                WESSIDE-NG(8)

NAME
       wesside-ng - crack a WEP key of an open network without user intervention

SYNOPSIS
       wesside-ng <options>

DESCRIPTION
       wesside-ng is an auto-magic tool which incorporates a number of techniques to seamlessly obtain a WEP key in minutes. It first identifies a
       network, then proceeds to associate with it, obtain PRGA (pseudo random generation algorithm) xor data, determine the  network  IP  scheme,
       reinject ARP requests and finally determine the WEP key. All this is done without your intervention.

OPTIONS
       -h     Shows the help screen.

       -i <iface>
              Wireless interface name. (Mandatory)

       -n <network ip>
              Network  IP as in 'who has destination IP (netip) tell source IP (myip)'. Defaults to the source IP on the ARP request which is cap‐
              tured and decrypted. (Optional)

       -m <my ip>
              'who has destination IP (netip) tell source IP (myip)'. Defaults to the network.123 on the ARP request captured (Optional).

       -a <source mac>
              Source MAC address (Optional)

       -c     Do not crack the key. Simply capture the packets until control-C is hit to stop the program! (Optional)

       -p <min PRGA>
              Determines the minimum number of bytes of PRGA which is gathered. Defaults to 128 bytes. (Optional).

       -v <victim MAC>
              Wireless access point MAC address (Optional).

       -t <threshold>
              For each number of IVs specified, restart the airecrack-ng PTW engine (Optional). It will restart PTW every <threshold> IVs.

       -f <channel>
              Allows the highest channel for scanning to be defined. Defaults to channel 11 (Optional).

AUTHOR
       This manual page was written by Thomas d'Otreppe.  Permission is granted to copy, distribute and/or modify this document under the terms of
       the  GNU  General  Public License, Version 2 or any later version published by the Free Software Foundation On Debian systems, the complete
       text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

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
       aircrack-ng(1)
       airdecap-ng(1)
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

Version 1.5.2                                                      December 2018                                                     WESSIDE-NG(8)
