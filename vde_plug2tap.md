VDE_PLUG2TAP(1)                                                                          General Commands Manual                                                                          VDE_PLUG2TAP(1)

NAME
       vde_plug2tap - Virtual Distributed Ethernet plug-to-tap

SYNOPSIS
       vde_plug2tap [OPTION]... tap_name

DESCRIPTION
       vde_plug2tap  is  a  plug to be connected into a VDE switch.  All the data that is catched by the plug is sent to the tap interface tap_name and everything from that interface is injected in the
       switch.
       Example:
         vde_plug2tap tap4
       connects the default switch (/var/run/vde.ctl) to the tap4 interface.

OPTIONS
       -p, --port=portnum
              It is possible to decide which port of the switch to use.  When this option is not specified the switch assigns the first available unused port (if any).  It is possible to  connect  sev‐
              eral cables in the same switch port: in this way all this cables work concurrently.  It means that packet can result as duplicate but no ARP table loops are generated.  Is useful when vde
              is used for mobility. Several physical interfaces can be used at a time during handoffs to prevent hichups in connectivity.

       -g, --group=group
              group ownership of the communication socket. For security when more want to share a switch it is better to use a unix group to own the comm sockets so that the network traffic  cannot  be
              sniffed.

       -m, --mod=octal-mode
              octal chmod like permissions for the comm sockets

       -s, --sock=socket
              specify  the  UNIX  socket to be used by local programs for joining the VDE.  The default value is "/var/run/vde.ctl".  When '-' is used in place of the VDE switch directory, vde_plug2tap
              works as a plug (see vde_plug(1)).  The command:
                dpipe vde_plug = ssh remote.machine.org vde_plug2tap -s - tapx
              connects the default local switch to a remote tapx interface.

       -d, --daemon
              start vde_plug2tap as a background process

       -P, --pidfile=pidfile
              put the process ID of vde_plug2tap in pidfile. Can be used with --daemon to store the PID for future killing.

       -h, --help
              show a brief help

NOTICE
       Virtual Distributed Ethernet is not related in any way with www.vde.com ("Verband der Elektrotechnik, Elektronik und Informationstechnik" i.e. the German "Association for Electrical,  Electronic
       & Information Technologies").

SEE ALSO
       vde_switch(1), vde_plug(1), vdeq(1), dpipe(1).

AUTHOR
       VDE is a project by Renzo Davoli <renzo@cs.unibo.it>

Virtual Distributed Ethernet                                                                 December 5, 2006                                                                             VDE_PLUG2TAP(1)
