dibbler-client(8)                                                                                  Dibbler                                                                                  dibbler-client(8)



NAME
       dibbler-client - a portable DHCPv6 client


DESCRIPTION
       dibbler-client  is  a  portable  implementation  of the DHCPv6 client. It supports both stateful (i.e. IPv6 address granting) and stateless (i.e. options granting) autoconfiguration. There are ports
       available for Linux 2.4/2.6 systems as well as MS Windows XP and 2003. They are freely available under GNU GPL version 2 (or later) license.


SYNOPSIS
       dibbler-client [ run | start | stop | status | install | uninstall ]


OPTIONS
       run - starts client in the console. Client can be closed using ctrl-c.

       start - starts client in daemon mode.

       stop - stops running clients.

       status - shows status of the client and server.

       install - installs client as a service. This is not implemented yet.

       uninstall - uninstall client service. This is not implemented yet.


EXAMPLES
       Let's start with simple configuration. We want receive one IPv6 address and there is only one Ethernet interface present. In that case client.conf file might be completly empty. Dibbler client  will
       request for one IPv6 address on each up, running and multicast capable interface (except loopback).

       Now some real example. We want one IPv6 address and receive DNS servers and domain name. We are also not interested in the details, so debug mode is disabled.

       log-mode short
       log-level 6
       iface eth0
       {
         ia { }
          option dns-server
          option domain
       }

       Next example: we want only NIS domain and NIS server information. That information should be periodicaly renewed, so we use lifetime option. We don't need any addresses so stateless mode is used.

       log-mode short
       iface eth0
       {
         stateless
         option nis-server
         option nis-domain
         option lifetime
       }

       More examples can be found in the User's Guide.


FILES
       All  files  are  created in the /var/lib/dibbler directory. Dibbler client reads /var/lib/dibbler/client.conf file. During operation, Dibbler saves various file in that directory. After reception of
       the DNS servers or domain informations, they are added to the /etc/resolv.conf file. After shutdown, that information is removed from that file. Option values are stored in the option-*  files.  Log
       file is named client.log.


STANDARDS
       This implementation aims at conformance to the following standards:

       RFC 3315 DHCP for IPv6

       RFC 3319 SIP options for DHCPv6

       RFC 3646 DNS server options for DHCPv6

       RFC 3736 Stateless DHCPv6

       RFC 3898 NIS options for DHCPv6

       Also options specified in following drafts are implemented:

       draft-ietf-dhc-dhcpv6-opt-timeconfig-03.txt NTP and timezone options.

       draft-ietf-dhc-dhcpv6-opt-lifetime-00.txt Option renewal.


BUGS
       Bugs are tracked with bugzilla, available at http://klub.com.pl/bugzilla/. If you belive you have found a bug, don't hesitate to report it.


AUTHOR
       Dibbler  was developed as master thesis on the Technical University of Gdansk by Tomasz Mrugalski and Marek Senderski. Currently Marek has not enough free time, so this project is being developed by
       Tomasz Mrugalski. Authors can be reached at thomson@klub.com.pl and msend@o2.pl


SEE ALSO
       There is dibbler-server(8) manual page. You are also advised to take a look at project website located at http://klub.com.pl/dhcpv6/.  As far as authors know, this is the only Windows DHCPv6  state‐
       ful  implementation  available.  It is also one of two freely available under Linux. The other Linux implementation is available at http://dhcpv6.sourceforge.net, but it is rather outdated and seems
       not being actively developed.



GNU                                                                                               2004-12-11                                                                                dibbler-client(8)
