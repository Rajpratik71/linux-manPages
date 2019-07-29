VDE_OVER_NS(1)                                                General Commands Manual                                               VDE_OVER_NS(1)

NAME
       vde_over_ns - Steganographic cable over NS protocol for Virtual Distributed Ethernet

SYNOPSIS
       vde_over_ns [-D] [-c server_address] [-s vde_plug] [-i ip.to.bi.nd] domain.name

DESCRIPTION
       A vde_over_ns allows to connect two remote vde_switches through steganographic NS query/response datagrams.  e.g.:

       dpipe vde_plug /tmp/s1 = vde_over_ns tun.mydomain.vde

       binds  to  udp port 53 and listen for incoming steganographic NS queries (server mode).  All the traffic to/from stdout/stdin is redirected
       to the client via ns responses.

       creates a wire between two vde_switches (with sockets /tmp/s1 and /tmp/s2 respectively). This cable looses  10%  of  the  packets  in  each
       direction.

       The same vde_over_dns server can be created using:

       vde_over_ns -s /tmp/s1 tun.mydomain.vde

       The  syntax is almost identical for the client mode, except that to have a vde_over_ns client connect to that server, the  -c server option
       must be specified.

OPTIONS
       -s vdeplug
              If specified, the vde_over_ns will connect to the local vde socket vdeplug instead pf stdin/stdout, using the libvdeplug library.

       -D     Detach console and send the process to background.

       -b ip.to.bind
              The NS server will bind only to the specified ip, instead of any ip.  Only valid in server mode (without -c)

       -c server_addr
              If specified, client mode is enabled. Vde_over_ns will try to send NS requests to server_addr. If  not  specified,  server  mode  is
              enabled by default.

NOTICE
       Virtual  Distributed  Ethernet is not related in any way with www.vde.com ("Verband der Elektrotechnik, Elektronik und Informationstechnik"
       i.e. the German "Association for Electrical, Electronic & Information Technologies").

SEE ALSO
       vde_switch(1), vdeq(1).  dpipe(1).  unixterm(1).

AUTHORS
       VDE_OVER_NS is a tool by Daniele Lacamera <root@danielinux.net>

       VDE is a project by Renzo Davoli <renzo@cs.unibo.it>

       based on nstx, a steganographic ns client/server software by:

            Florian Heinz <sky@sysv.de>

            Julien Oster <frodo@sysv.de>

Virtual Distributed Ethernet                                        May 2, 2007                                                     VDE_OVER_NS(1)
