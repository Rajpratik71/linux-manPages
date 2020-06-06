VDE_CRYPTCAB(1)                                                                          General Commands Manual                                                                          VDE_CRYPTCAB(1)

NAME
       vde_cryptcab - Virtual Distributed Ethernet encrypted cable manager

SYNOPSIS
       vde_cryptcab [ -p portnum ] [ -s socketpath ] [ -c [remote_user@]host[:remote_portnum] ] [ -P pre_shared.key ]| [ -x ] [ -v [v][v][v] ] [ -k ] [ -d ]

DESCRIPTION
       A vde_cryptcab is a distributed cable manager for VDE switches.  It allows two VDE switches on two machines to communicate using a blowfish encrypted channel.

       When used in client mode (i.e., with -c option), it generates a random blowfish key, and uses scp (1) to transfer the key to the remote server.

       On the client side, the environment variable SCP_EXTRA_OPTIONS may be set in order to append options to the scp command line (this is useful for example when dropbear or another non-standard ssh
       client is used to transfer the blowfish key).

       After a 4-way handshake phase to verify client credentials, server and client will exchange VDE datagrams encapsulating them into cryptograms that are sent via udp to each remote host.

       On server side, one could run:
              vde_cryptcab -s /tmp/vde2.ctl -p 2100
       To start a multi-peer cryptcab server, accepting udp datagrams on port 2100, that connects each authenticated remote client to a different port of the switch. In fact, a new instance of vde_plug
       (1) is started and connected to the switch through local unix socket.

       The command
              vde_cryptcab -s /tmp/vde2.ctl -c foo@remote.machine.org:2100
       will  connect a client to the remote server, running on udp port 2100.  At this point, on server side a verify for user "foo" credentials is required, typically it could be: host-based authenti‐
       cation, password challenge or public key authentication. See ssh (1) for more details about it.

       If the two vde_switches run as daemon and they are connected to tap interfaces a level 2 encrypted tunnel is established.

OPTIONS
       -p portnum
              It is possible to decide which local udp port to use.  When this option is not specified, cryptcab will use default udp port number, 7667.

       -c [remote_user@]host[:remote_portnum]
              run vde_cryptcab in client mode, trying to connect to host .  Both remote_user and remote_portnum parameters are not required.  If not specified, the same  user  running  vde_cryptcab  is
              used for authentication on server, and default udp port 7667 is used.

       -s socketpath
              specify the UNIX socket to be used by local programs for joining the VDE.  The default value is "/tmp/vde.ctl".

       -P pre_shared.keypath
              if  specified, vde_cryptcab will run in pre-shared key mode, instead of generating a random key to transmit with ssh.  Given option is the path to the pre-shared symmetric key file to use
              for data encryption.  The same key has to be used on both client and server.

       -x     Disable symmetric key encryption.

       -k     Send periodic "keepalive" packets to avoid server timeouts. Useful when you want to keep a low-traffic link available.

       -d     Run as daemon.

       -v     Verbose. (Use -vv -vvv or -vvvv for more verbosity)

KNOWN ISSUES
       Encapsulating IP packets into session+udp layer results in real datagrams larger than tap device mtu. Since vde_cryptcab gets confused by packet fragmentation, the tap device mtu must be set  to
       a smaller value than real interface mtu. Use ip(8) or ifconfig(8) to set up your tap device mtu.

       Explicitly disabling encryption leads to obvious security problems. It is advised to avoid unencrypted mode (-x) in non-controlled networks.

NOTICE
       Virtual  Distributed Ethernet is not related in any way with www.vde.com ("Verband der Elektrotechnik, Elektronik und Informationstechnik" i.e. the German "Association for Electrical, Electronic
       & Information Technologies").

SEE ALSO
       vde_switch(1), vdeq(1), vde_plug(1), vde_plug2tap(1), scp(1), ssh(1).

AUTHORS
       VDE is a project by Renzo Davoli <renzo@cs.unibo.it>.

       vde_cryptcab is a VDE component by Daniele Lacamera <root@danielinux.net>

Virtual Distributed Ethernet                                                                 December 6, 2006                                                                             VDE_CRYPTCAB(1)
