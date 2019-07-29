VDEQ(1)                                                       General Commands Manual                                                      VDEQ(1)

NAME
       vdeq - Virtual Distributed Ethernet wrapper for QEMU/KVM virtual machines

SYNOPSIS
       vdeq qemu [ --mod octalmode ] QEMU_OPTIONS -net vde[,vlan=n][,sock=socketpath][,port=n] QEMU_OPTIONS
       vdeq kvm [ --mod octalmode ] KVM_OPTIONS -net vde[,vlan=n][,sock=socketpath][,port=n] KVM_OPTIONS
       vde{qemu_name} [ --mod octalmode ] QEMU_OPTIONS -net vde[,vlan=n][,sock=socketpath][,port=n] QEMU_OPTIONS

OLD SYNOPSIS
       vdeq qemu [ --mod octalmode ] [ -sock socketpath [ ,socketpath [ ,...  ] ] ] [ qemu_args ]
       vde{qemu_name} [ -sock socketpath [ ,socketpath [ ,...  ] ] ] [ qemu_args ]

DESCRIPTION
       vdeq  is  a wrapper to start a QEMU/KVM virtual machine connected to a VDE network.  It uses the qemu/kvm  -tun-fd  parameter to set up the
       connection with a vde_switch.

       The command
              vdeq qemu -b c -hda=sampledisk
       starts a qemu machine which boots from the sampledisk image and has a ne2000 ethernet interface connected to the standard vde_switch.   The
       command
              vdeq kvm -b c -hda=sampledisk
       starts a kvm machine which boots from the sampledisk image and has a ne2000 ethernet interface connected to the standard vde_switch.

       It  is also possible to create symbolic links to the vdeq executable to have a simpler command. If the link has a name that begins with vde
       the remaining part of the name is taken as the qemu command. For example if vdeq is linked to vdeqemu:
              vdeqemu -b c -hda=sampledisk
       starts qemu as above. If vdeq is linked to vdekvm:
              vdekvm -b c -hda=sampledisk
       starts kvm with the same parameters.

       The new syntax is consistent with the new Qemu 0.8.0 network parameters.  Using vdeq is possible to specify a vde interface in the same way
       as  user,tap  or socket interfaces.  The sock= parameter can be used to use a specific socket.  Please note that what qemu names as vlan is
       not related to the 802.1q VLAN managed by the vde_switch.  port= can be used to specify the port of the switch, otherwise the  first  allo‐
       catable  port  is  assigned.   The  following command run a qemu VM with two ethernet interface connected to the standard switch and to the
       switch with local socket "/tmp/my.ctl", port 10, respectively
              vde qemu -net nic,vlan=0 -net nic,vlan=1 -net vde,vlan=0 -net vde,vlan=1,sock=/tmp/my.ctl,port=10
              vdeqemu -net nic,vlan=0 -net nic,vlan=1 -net vde,vlan=0 -net vde,vlan=1,sock=/tmp/my.ctl,port=10
       The following command run a kvm VM with two ethernet interface connected to the standard  switch  and  to  the  switch  with  local  socket
       "/tmp/my.ctl", port 10, respectively
              vde kvm -net nic,vlan=0 -net nic,vlan=1 -net vde,vlan=0 -net vde,vlan=1,sock=/tmp/my.ctl,port=10
              vdekvm -net nic,vlan=0 -net nic,vlan=1 -net vde,vlan=0 -net vde,vlan=1,sock=/tmp/my.ctl,port=10

       The old syntax can be used with Qemu 0.8.0 but all the vde interfaces are assigned to vlan 0.
              vdeq qemu -sock /tmp/vde.ctl,/tmp/my.ctl -b c -hda=sampledisk
              vdeqemu -sock /tmp/vde.ctl,/tmp/my.ctl -b c -hda=sampledisk
       both start qemu with one ethernet interface connected both to the standard switch and to the switch with local socket "/tmp/my.ctl".

OPTIONS
       --mod  octalmode, specify the mode for comm socket.

       -sock  socketpath,  specify  the  UNIX  socket to be used by local programs for joining the VDE.  The default value is "/tmp/vde.ctl" It is
              also possible to indicate several socketpath (comma separated, no blanks): in this case several interfaces are  defined.  The  first
              socketpath is connected to the first ne2k interface and so on.

       -h, -help, --help
              print a Usage help.

NOTE
       Qemu  has  changed its syntax for networking (cvs Nov.15 2005).  As a temporary solution use vdeoq and vdeoqemu instead of vdeq and vdeqemu
       if you are running a qemu with the old syntax.
       By default qemu uses the same MAC address for every virtual machine, so if you plan to use several instances of qemu be sure to  explicitly
       set  a  different  MAC address for each virtual machine. While generating your address beware to not use broadcast/multicast reserved MACs,
       ethernet rules say: the multicast bit is the low-order bit of the first  byte,  which  is  "the  first  bit  on  the  wire".   For  example
       34:12:de:ad:be:ef  is  an  unicast  address,  35:12:de:ad:be:ef  is  a  multicast  address  (see  ETHERNET  MULTICAST  ADDRESSES section in
       http://www.iana.org/assignments/ethernet-numbers for more informations).

NOTICE
       Virtual Distributed Ethernet is not related in any way with www.vde.com ("Verband der Elektrotechnik, Elektronik  und  Informationstechnik"
       i.e. the German "Association for Electrical, Electronic & Information Technologies").

SEE ALSO
       vde_switch(1), vde_plug(1), vde_plug2tap(1), dpipe(1).

AUTHOR
       VDE is a project by Renzo Davoli <renzo@cs.unibo.it>

Virtual Distributed Ethernet                                     December 6, 2006                                                          VDEQ(1)
