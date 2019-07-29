IVSTOOLS(1)                                                   General Commands Manual                                                  IVSTOOLS(1)

NAME
       ivstools - extract IVs from a pcap file or merges several .ivs files into one

SYNOPSIS
       ivstools --convert <pcap file> <ivs output file> ivstools --merge <ivs file 1> <ivs file 2> .. <output file>

DESCRIPTION
       ivstools is a tool designed to extract ivs (initialization vectors) from a pcap dump to an ivs file and it can also merge several ivs (ini‐
       tialization vectors) files into one..

EXAMPLE
       ivstools --convert wep_dump.cap out.ivs
       ivstools --merge myivs1.ivs myivs2.ivs myivs3.ivs allivs.ivs

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
       kstats(1)
       makeivs-ng(1)
       packetforge-ng(1)
       wpaclean(1)
       airventriloquist(8)

Version 1.5.2                                                      December 2018                                                       IVSTOOLS(1)
