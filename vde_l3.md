VDE_L3(1)                                                                                General Commands Manual                                                                                VDE_L3(1)

NAME
       vde_l3 - Virtual Distributed Ethernet 'Layer 3' Switch.

SYNOPSIS
       vde_l3 -v vde_plug:ipaddress/netmask [-v...]  [-r target_network/netmask:gateway] [-G default_gw] [-M mgmt_socket]

DESCRIPTION
       A  vde_l3  connects  to  one  or  more vde_switches, performing ip forwarding among its virtual interfaces. A new interface is created at startup for each -v option given at command line. Static
       routes to target networks can be defined using the -r option.

       vde_l3 -v /var/run/s1.ctl:192.168.0.1/24

       connects to the vde sock at /var/run/s1.ctl with its virtual interface ve0, having the address 192.168.0.1 and netmask 255.255.255.0.

       vde_l3 \

       -v /var/run/s1.ctl:192.168.0.1/24 \

       -v /var/run/s2.ctl:10.0.0.254/255.255.0.0

       connects to the two vde socks, with its virtual interfaces ve0 and ve1, having addressess 192.168.1.0 and 10.0.0.254 respectively. Hosts in each network can specify the vde_l3 as  their  gateway
       to reach the other one.

OPTIONS
       -v vde_plug:ipaddress/netmask
              Creates  a virtual network interfaces on the vde_l3 box, with address ipaddress and netmask netmask. Please note that the netmask can be specified either in the 'classic' A.B.C.D mode, or
              just by giving the number of leading bits (f.e., /17 for 255.255.128.0).  One can define as many interfaces as she wants.

       -r target_network/netmask:gateway
              Specify a static route through gateway to reach hosts in target_network with netmask netmask.  One can define as many routes as she wants.

       -G default_gw
              Specify a default gateway, to be used whenever no static route is defined for a target host.

       -M mgmt_socket
              the unix socket where the parameters (interfaces addresses, routes, etc.) can be checked and changed runtime. unixterm(1) can be used as a remote terminal for wirefilter.

NOTICE
       Virtual Distributed Ethernet is not related in any way with www.vde.com ("Verband der Elektrotechnik, Elektronik und Informationstechnik" i.e. the German "Association for Electrical,  Electronic
       & Information Technologies").

SEE ALSO
       vde_switch(1), vdeq(1), unixterm(1), vde_cryptcab(1), wirefilter(1).

AUTHORS
       VDE_L3 is a tool by Daniele Lacamera <root@danielinux.net>

       VDE is a project by Renzo Davoli <renzo@cs.unibo.it>

Virtual Distributed Ethernet                                                                   May 7, 2007                                                                                      VDE_L3(1)
