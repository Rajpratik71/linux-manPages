AIRSERV-NG(8)                                                 System Manager's Manual                                                AIRSERV-NG(8)

NAME
       airserv-ng - a wireless card server

SYNOPSIS
       airserv-ng <options>

DESCRIPTION
       airserv-ng is a wireless card server which allows multiple wireless application programs to independently use a wireless card via a client-
       server TCP network connection. All operating system and wireless card driver specific code is incorporated into the server. This eliminates
       the  need  for each wireless application to contain the complex wireless card and driver logic. It is also supports multiple operating sys‐
       tems.

OPTIONS
       -h     Shows the help screen.

       -p <port>
              TCP port to listen on (by default: 666).

       -d <iface>
              Wifi interface to use.

       -c <chan>
              Lock interface to this channel.

       -v <level>
              Debug level. There are 3 debug levels.  Debug level of 1 shows client connection/disconnection (default).  Debug level  of  2  shows
              channel  change requests and invalid client command requests in addition to the debug level 1 messages.  Debug level of 3 displays a
              message each time a packet (and its length) is sent to the client. It also include messages from level 2 (and 1).

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
       kstats(1)
       makeivs-ng(1)
       packetforge-ng(1)
       wpaclean(1)
       airventriloquist(8)

Version 1.5.2                                                      December 2018                                                     AIRSERV-NG(8)
