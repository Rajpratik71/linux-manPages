VDE_PLUG(1)                                                                              General Commands Manual                                                                              VDE_PLUG(1)

NAME
       vde_plug - Virtual Distributed Ethernet plug (two plugs creates a vde cable)

SYNOPSIS
       vde_plug [ -p portnum ] [ -g group ] [ -m octal-mode ] [ socketdir ]

DESCRIPTION
       A vde_plug is a plug to be connected into a VDE switch.  All the data that is catched by the plug is written in its stdout and everything from stdin is injected in the switch.

       This tool has been designed to be used together with dpipe (1) to interconnect a second vde_plug to another switch, working as a virtual ethernet crossed cable between the two switches.

       The command
              dpipe vde_plug = vde_plug /tmp/vde2.ctl
       connects two local switches: the former is using the standard control socket /tmp/vde.ctl while the latter is using /tmp/vde2.ctl.

       The command
              dpipe vde_plug = ssh remote.machine.org vde_plug
       connects two remote switches.  If the two vde_switches run as daemon and they are connected to tap interfaces a level 2 encrypted tunnel is established.

       vde_plug can also be established as a login shell for users.  The following command works as in the previous example
              dpipe vde_plug = ssh vdeuser@remote.machine.org vde_plug
       where  vdeuser  is  the user with vde_plug as standard shell.  All the remote accesses are logged by syslog at the beginning and at the end of each session.  Attempt to login without the command
       vde_plug at the end or trying to execute something else are blocked and the attempt is logged into syslog.

OPTIONS
       -p portnum
              It is possible to decide which port of the switch to use.  When this option is not specified the switch assigns the first available unused port (if any).  It is possible to  connect  sev‐
              eral cables in the same switch port: in this way all this cables work concurrently.  It means that packet can result as duplicate but no ARP table loops are generated.  Is useful when vde
              is used for mobility. Several physical interfaces can be used at a time during handoffs to prevent hichups in connectivity.

       -g group
              group ownership of the communication socket. For security when more want to share a switch it is better to use a unix group to own the comm sockets so that the network traffic  cannot  be
              sniffed.

       -m octal-mode
              octal chmod like permissions for the comm sockets

       socketdir
              (This  option  can  be  also  set  as:  -sock  socketdir  )  specify  the  directory which contains the UNIX socket to be used by local programs for joining the VDE.  The default value is
              "/tmp/vde.ctl", which corresponds to the socket "/tmp/vde.ctl/ctl" (or /var/run/vde.ctl when the vde_switch runs as a shared daemon).  It is possible for users to redefine  their  default
              switch as ".vde-2/stdsock" in their home directory. If exist, this directory (or symbolic link to the actual directory) is used as the default value for the user.

NOTICE
       Virtual  Distributed Ethernet is not related in any way with www.vde.com ("Verband der Elektrotechnik, Elektronik und Informationstechnik" i.e. the German "Association for Electrical, Electronic
       & Information Technologies").

SEE ALSO
       vde_switch(1), vde_plug2tap(1), vdeq(1), dpipe(1).

AUTHOR
       VDE is a project by Renzo Davoli <renzo@cs.unibo.it>

Virtual Distributed Ethernet                                                                 December 6, 2006                                                                                 VDE_PLUG(1)
