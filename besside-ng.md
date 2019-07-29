BESSIDE-NG(8)                                                 System Manager's Manual                                                BESSIDE-NG(8)

NAME
       besside-ng - crack a WEP or WPA key without user intervention and collaborate with WPA cracking statistics

SYNOPSIS
       besside-ng [options] <interface>

DESCRIPTION
       besside-ng  is a tool which will crack all the WEP networks in range and log all the WPA handshakes.  WPA handshakes can be uploaded to the
       online cracking service at wpa.darkircop.org.   Wpa.darkircop.com also provides useful statistics based  on  user-submitted  capture  files
       about the feasibility of WPA cracking.

       -b <target mac>
              Specifies the target's BSSID

       -s <WPA server>
              Where to upload capture file for cracking. A good choice is wpa.darkircop.org

       -c <chan>
              Channel lock

       -p <pps>
              Packages per second to send (flood rate).

       -W     Crack only WPA networks

       -v     Verbose mode. Use -vv for more verbose, -vv for even more and so on.

       -h     Help screen

AUTHOR
       This  manual  page  was written by David Francos Cuartero.  Permission is granted to copy, distribute and/or modify this document under the
       terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation On  Debian  systems,  the
       complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

SEE ALSO
       airbase-ng(8)
       aireplay-ng(8)
       airmon-ng(8)
       airodump-ng(8)
       airodump-ng-oui-update(8)
       airserv-ng(8)
       airtun-ng(8)
       easside-ng(8)
       tkiptun-ng(8)
       wesside-ng(8)
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

Version 1.5.2                                                      December 2018                                                     BESSIDE-NG(8)
