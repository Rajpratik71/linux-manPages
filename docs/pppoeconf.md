PPPOECONF(8)                                                                            System Manager's Manual                                                                           PPPOECONF(8)

NAME
       pppoeconf — configures a PPPoE (ADSL) connection

SYNOPSIS
       pppoeconf [-nox]  [iface]

DESCRIPTION
       The  pppoeconf  program  is  user-friendly dialog based setup tool for pppd (and pppoe      if needed). It will look for existing ethernet cards and look for ADSL hardware connected to one of
       them. You can add an interface name iface to force pppoeconf to use it. Then it will get some login info and do some minor modifications to make working settings. Note that you  can  use  ESC
       key to exit program when you wan.

OPTIONS
       -nox      Force ncurses use.

FILES
       /etc/ppp/peers/dsl-provider is pppd options file for your dsl provider.

       /etc/ppp/pap-secrets and /etc/ppp/chap-secrets are described in pppd documentation.  pppoeconf may add lines to theses files.

       /etc/ppp/ip-up.d/0clampmss and /etc/ppp/ip-down.d/0clampmss are used to clamp MSS if needed.

       /etc/network/interfaces is network interface file for your system.

SEE ALSO
       pppd(8), interfaces(5), pon(1) and pppoe(8).

AUTHOR
       This  manual  page was originally written by Eduard Bloch (blade@debian.org) and now maintained by Gregory Colpart (reg@evolix.fr) for the Debian GNU/Linux system (but may be used by others).
       This document is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either  version  2  of
       the License, or (at your option) any later version.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

                                                                                                                                                                                          PPPOECONF(8)
