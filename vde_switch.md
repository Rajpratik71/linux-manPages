VDE_SWITCH(1)                                                                            General Commands Manual                                                                            VDE_SWITCH(1)

NAME
       vde_switch - Virtual Distributed Ethernet switch

SYNOPSIS
       vde_switch [ -hub ] [ -sock commdirpath ] [ -mod octal-mode ] [ -group NAME ] [ -tap interface ] [ -daemon ]

DESCRIPTION
       A vde_switch is a virtual switch for the vde architecture.
       A vde network can include several vde_switches running on different (real) computers.  vde_switches can be connected by vde cables (see vde_plug (1) ).
       Supported architecture for VDE end nodes include: real linux boxes (through the tuntap interface), bochs, qemu and MPS virtual machines.
       VDE  is  useful  to create networks of heterogeneous virtual machines as well as as a general tunneling tool -- all the ethernet based protocols work by this kind of tunnel -- and also as a tool
       for mobility.  In fact VDE creates an overlay network where users can keep their IP addresses despite of the change of IP addresses on the interfaces.

       vde_switch needs root privileges to open a tap interface, can be run by users when no -tap option is specified.

       vde-2 has several features: VLAN, Fast Spanning Tree Protocol, command line management (on console for foreground switches, on a terminal for daemonized switches).  If a vde_switch run in  fore‐
       ground mode simply type return to have the prompt.  For daemons there is the -M option to specify the management socket. Unixterm is the tool to start a terminal for the management.  Type "help"
       at the prompt for a list of possible options.

OPTIONS
       -hub   turn off the switch engine. It operates as a hub.

       -sock commdirpath
              specify the directory when comm socket are created.  The default value is "/tmp/vde.ctl"

       -mod octalmode
              specify the octal permissions for the comm sockets.

       -group NAME
              specify the group owner for the comm socket.  The default value is the current user's primary group

       -tap interface
              connect the specified tuntap interface to this vde_switch (needs root privileges) It is possible to specify several tap interfaces, comma separated.

       -daemon
              Run as a daemon. Use syslog for logging.

       -f rcfile
              rc file to set the initial switch configuration. This rc file has the same syntax of the command line interface.

       -h     help. Please use it for a more complete list of options.  vde_switch is a modular program, options vary depending of the compiled-in modules.

NOTICE
       Virtual Distributed Ethernet is not related in any way with www.vde.com ("Verband der Elektrotechnik, Elektronik und Informationstechnik" i.e. the German "Association for Electrical,  Electronic
       & Information Technologies").

SEE ALSO
       vde_plug(1), vde_plug2tap(1), vdeq(1), dpipe(1), unixterm(1).

AUTHOR
       VDE is a project by Renzo Davoli <renzo@cs.unibo.it>
       VDE started as an enhancement of uml_switch by Jeff Dike and others.  VDE-2 has been almost completely rewritten but maybe some statements come from the historical source. So, some copyright and
       thanks also for Dike&Co.

Virtual Distributed Ethernet                                                                 December 6, 2006                                                                               VDE_SWITCH(1)
