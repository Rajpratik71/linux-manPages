VDE_TUNCTL(8)                                                                            System Manager's Manual                                                                            VDE_TUNCTL(8)

NAME
       vde_tunctl — create and manage persistent TUN/TAP interfaces

SYNOPSIS
       vde_tunctl [-f clone-dev] [-u owner] [-g group] [-n] [-t dev-name]

       vde_tunctl [-f clone-dev] -d dev-name

DESCRIPTION
       vde_tunctl  allows the host sysadmin to preconfigure a TUN/TAP device for use by a particular user.  That user may open and use the device, but may not change any aspects of the host side of the
       interface.

       vde_tunctl is an extension of tunctl.

       vde_tunctl defines tap interfaces unless dev-name begins by "tun" or the option -n appears in the command line.

USAGE
       To create an interface for use by a particular user, invoke tunctl without the -d option:

       # vde_tunctl -u someuser
       Set 'tap0' persistent and owned by uid 500

       Then, configure the interface as normal:

       # ifconfig tap0 192.168.0.254 up
       # route add -host 192.168.0.253 dev tap0
       # bash -c 'echo 1 > /proc/sys/net/ipv4/conf/tap0/proxy_arp'
       # arp -Ds 192.168.0.253 eth0 pub

       To delete the interface, use the -d option:

       # vde_tunctl -d tap0
       Set 'tap0' nonpersistent

       To create or destroy a tun interface (instead of tap):
       # vde_tunctl -n -u someuser
       Set 'tun0' persistent and owned by uid 500
       # vde_tunctl -d tun0
       Set 'tun0' nonpersistent

SEE ALSO
       vde_switch(1) vde_plug2tap(1)

AUTHOR
       tunctl was written by Jeff Dike jdike@karaya.com

       This manual page is based on tunctl manual page written by Matt Zimmerman mdz@debian.org for the Debian GNU/Linux system.

                                                                                                                                                                                            VDE_TUNCTL(8)
