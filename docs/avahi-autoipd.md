avahi-autoipd(8)                                                                        System Manager's Manual                                                                       avahi-autoipd(8)

NAME
       avahi-autoipd - IPv4LL network address configuration daemon

SYNOPSIS
       avahi-autoipd [options] interface

       avahi-autoipd --kill interface

       avahi-autoipd --refresh interface

       avahi-autoipd --check interface

DESCRIPTION
       avahi-autoipd  implements  IPv4LL,  "Dynamic  Configuration  of IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for automatic IP address configuration from the link-local 169.254.0.0/16
       range without the need for a central server. It is primarily intended to be used in ad-hoc networks which lack a DHCP server.

       IPv4LL is part of the Zeroconf stack.

       avahi-autoipd can be used as stand-alone address allocator or as plugin for a DHCP client such as ISC's dhclient, where it can be used as fallback solution if no DHCP server is found.

       To allow communication between hosts that have only an IPv4LL address assigned and hosts that only have a routable IP address assigned you may add the following routes to both network config‐
       urations:

       route add -net 169.254.0.0 netmask 255.255.0.0 dev eth0 metric 99

       route add default dev eth0 metric 99

       See http://developer.apple.com/qa/qa2004/qa1357.html for more information.

OPTIONS
       -D | --daemonize
              Daemonize after startup. Implies --syslog.

       -k | --kill
              Kill an already running avahi-autoipd on the specified network interface. (Equivalent to sending a SIGTERM)

       -r | --refresh
              Tell an already running avahi-autoipd to re-announce the acquired IP address on the specified network interface. (Equivalent to sending a SIGHUP)

       -c | --check
              Return 0 as return code if avahi-autoipd is already running for the specified network interface.

       -s | --syslog
              Log to syslog instead of STDERR. Implied by --daemonize.

       --debug
              Enable verbose mode.

       --no-drop-root
              Don't drop root privileges after startup. We recommend not to use this option.

       --no-chroot
              Don't chroot(2) the daemon. This option is only available when compiled with chroot() support.

       -S | --start=
              Try to acquire the specified IP address, which must be from the IPv4LL range 169.254.0.0/16.

       -w | --wait
              Wait until a IP address has been successfully acquired before detaching. Only valid in combination with --daemonize.

       --force-bind
              Acquire an IPv4LL address, even if a routable address has been configured on the interface.

       --no-proc-title
              Don't change the process name while running. Unless this option is specified avahi-autoipd will reflect its current state and the IP address in the process title.

       -h | --help
              Show help.

       -v | --version
              Show version information.

FILES
       /etc/avahi/avahi-autoipd.action: the script to run when an IP address as been acquired or is lost.

SIGNALS
       SIGINT, SIGTERM: avahi-autoipd will shutdown. (Same as --kill)

       SIGHUP: avahi-autoipd will re-announce the acquired IP address. (Same as --refresh)

AUTHORS
       The Avahi Developers <avahi (at) lists (dot) freedesktop (dot) org>; Avahi is available from http://avahi.org/

SEE ALSO
       avahi-autoipd.action(8), dhclient(8)

       http://avahi.org/wiki/AvahiAutoipd documents how avahi-autoipd is best packaged and integrated into distributions.

COMMENTS
       This man page was written using xml2man(1) by Oliver Kurth.

Manuals                                                                                          User                                                                                 avahi-autoipd(8)
