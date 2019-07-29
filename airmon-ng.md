AIRMON-NG(8)                                                  System Manager's Manual                                                 AIRMON-NG(8)

NAME
       airmon-ng - POSIX sh script designed to turn wireless cards into monitor mode.

SYNOPSIS
       airmon-ng <start|stop> <interface> [channel] airmon-ng <check> [kill]

DESCRIPTION
       airmon-ng  This  script can be used to enable monitor mode on wireless interfaces. It may also be used to go back from monitor mode to man‐
       aged mode. Entering the airmon-ng command without parameters will show the interfaces status.  It can  also  list/kill  programs  that  can
       interfere with the wireless card operation.

OPTIONAL PARAMETERS
       start <interface> [channel]
              Enable  monitor  mode  on  an  interface (and specify a channel). Note: Madwifi-ng is a special case, 'start' has to be used on wifi
              interfaces and 'stop' on ath interfaces.

       stop <interface>
              Disable monitor mode and go back to managed mode (except for madwifi-ng where it kills the ath VAP).

       check [kill]
              List all possible programs that could interfere with the wireless card. If 'kill' is specified, it will try to kill all of them.

       --verbose
              This flag must precede start/stop/check and can be combined with other parameters or used alone.  This flag will increase  the  ver‐
              bosity to provide additional useful information which may not be needed for normal operation.

       --debug
              This  flag  must precede start/stop/check and can be combined with other parameters or used alone.  This flag will increase the ver‐
              bosity to debug level to assist in troubleshooting errors in airmon-ng. Use this flag when opening a bug,  but  only  use  --verbose
              when requesting support in irc.

       --elite
              WARNING: DO NOT USE: This flag must precede start or stop and will prevent airmon-ng from removing interfaces.  WARNING: Use of this
              flag will immediately disqualify receiving any support from the aircrack-ng team, due to the fact that this behavior is known to  be
              broken. WARNING!

AUTHOR
       This  manual  page was written by Adam Cecile <gandalf@le-vert.net> for the Debian system (but may be used by others).  And modified to fit
       airmon-ng by David Francos Cuartero <xayon@xayon.net>.  Most recently modified by Zero_Chaos to update for the airmon-zc rewrite.   Permis‐
       sion  is  granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or any later
       version published by the Free Software Foundation On Debian systems, the complete text of the GNU General Public License can  be  found  in
       /usr/share/common-licenses/GPL.

SEE ALSO
       airbase-ng(8)
       aireplay-ng(8)
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
       kstats(1)
       makeivs-ng(1)
       packetforge-ng(1)
       wpaclean(1)

Version 1.5.2                                                      December 2018                                                      AIRMON-NG(8)
