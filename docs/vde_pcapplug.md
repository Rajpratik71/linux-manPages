VDE_PCAPPLUG(1)                                               General Commands Manual                                              VDE_PCAPPLUG(1)

NAME
       vde_pcapplug - Virtual Distributed Ethernet libpcap cable

SYNOPSIS
       vde_pcapplug [OPTION]... interface

DESCRIPTION
       vde_pcapplug  is  a plug to be connected into a VDE switch.  All the data that is catched by the plug is injected into interface and every‐
       thing from that interface is sent in the switch.

OPTIONS
       -p, --port=portnum
              It is possible to decide which port of the switch to use.  When this option is not specified the switch assigns the first  available
              unused  port  (if  any).  It is possible to connect several cables in the same switch port: in this way all this cables work concur‐
              rently.  It means that packet can result as duplicate but no ARP table loops are generated.  Is useful when vde is used  for  mobil‐
              ity. Several physical interfaces can be used at a time during handoffs to prevent hichups in connectivity.

       -g, --group=group
              group  ownership  of the communication socket. For security when more want to share a switch it is better to use a unix group to own
              the comm sockets so that the network traffic cannot be sniffed.

       -m, --mod=octal-mode
              octal chmod like permissions for the comm sockets

       -s, --sock=socket
              specify the UNIX socket to be used by local programs for joining the VDE.  The default value is "/tmp/vde.ctl".

       -d, --daemon
              start vde_plug2tap as a background process

       -P, --pidfile=pidfile
              put the process ID of vde_plug2tap in pidfile. Can be used with --daemon to store the PID for future killing.

       -h, --help
              show a brief help

NOTICE
       Virtual Distributed Ethernet is not related in any way with www.vde.com ("Verband der Elektrotechnik, Elektronik  und  Informationstechnik"
       i.e. the German "Association for Electrical, Electronic & Information Technologies").

SEE ALSO
       vde_switch(1), vde_plug(1), vdeq(1), dpipe(1).

AUTHOR
       VDE is a project by Renzo Davoli <renzo@cs.unibo.it>

Virtual Distributed Ethernet                                      August 20, 2008                                                  VDE_PCAPPLUG(1)
