KSTATS(1)                                                     General Commands Manual                                                    KSTATS(1)

NAME
       kstats - show statistical FMS algorithm votes for an ivs dump and a specified WEP key

SYNOPSIS
       kstats <ivs file> <104-bit key>

DESCRIPTION
       kstats  is  a tool designed to show the FMS algorithm votes for an ivs dump (initialization vectors) with a specified WEP key. The ivs dump
       can be get by using the combination of both airodump(1) and ivstools(1).

EXAMPLE
       kstats kstats out.ivs 123456789ABCDEF123456789AB

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
       airdecap-ng(1)
       airdecloak-ng(1)
       airolib-ng(1)
       besside-ng-crawler(1)
       buddy-ng(1)
       ivstools(1)
       makeivs-ng(1)
       packetforge-ng(1)
       wpaclean(1)
       airventriloquist(8)

Version 1.5.2                                                      December 2018                                                         KSTATS(1)
