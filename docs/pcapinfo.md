PCAPINFO(1p)                                            User Contributed Perl Documentation                                           PCAPINFO(1p)

NAME
       pcapinfo - Prints detailed information about the network devices

SYNOPSIS
           pcapinfo

OPTIONS
       None.

DESCRIPTION
       pcapinfo prints detailed information about the network devices and Pcap library available on the current host. Here is an example:

           Host information
           ----------------
             Hostname      : fangorn.maddingue.net
             Aliases       : fangorn.local fangorn
             Pcap version  : libpcap version 0.8.3

           Devices information
           -------------------
           Device eth0 (default)
             Description       : No description available
             Link type         : Ethernet, no autonegotiation, 10baseT-HD, link ok
             Hardware address  : 00:0c:6e:0a:c3:ca
             Network address   : 10.0.1.51
             Network mask      : 255.255.255.0
             Flags             : up running broadcast multicast

           Device eth1
             Description       : No description available
             Link type         : Ethernet, no autonegotiation, 10baseT-HD, link ok
             Hardware address  : 00:26:54:0a:d8:4d
             Network address   : 192.168.1.51
             Network mask      : 255.255.255.0
             Flags             : up running broadcast multicast

       The device marked as "(default)" is the one returned when calling "Net::Pcap::lookupdev()"

       Some information like the link type can only be gathered with administrative privileges.

AUTHOR
       Sébastien Aperghis-Tramoni, <sebastien@aperghis.net>

COPYRIGHT
       Copyright (C) 2005, 2006, 2007, 2008, 2009 Sébastien Aperghis-Tramoni.  All rights reserved.

       This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

perl v5.22.1                                                        2015-12-17                                                        PCAPINFO(1p)
