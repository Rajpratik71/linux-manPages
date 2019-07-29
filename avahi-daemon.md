avahi-daemon(8)                                               System Manager's Manual                                              avahi-daemon(8)

NAME
       avahi-daemon - The Avahi mDNS/DNS-SD daemon

SYNOPSIS
       avahi-daemon [options]

       avahi-daemon --kill

       avahi-daemon --reload

       avahi-daemon --check

DESCRIPTION
       The Avahi mDNS/DNS-SD daemon implements Apple's Zeroconf architecture (also known as "Rendezvous" or "Bonjour"). The daemon registers local
       IP addresses and static services using mDNS/DNS-SD and provides two IPC APIs for local programs to make use of the mDNS  record  cache  the
       avahi-daemon  maintains. First there is the so called "simple protocol" which is used exclusively by avahi-dnsconfd (a daemon which config‐
       ures unicast DNS servers using server info published via mDNS) and nss-mdns (a libc  NSS  plugin,  providing  name  resolution  via  mDNS).
       Finally there is the D-Bus interface which provides a rich object oriented interface to D-Bus enabled applications.

       Upon  startup  avahi-daemon  interprets  its  configuration  file /etc/avahi/avahi-daemon.conf and reads XML fragments from /etc/avahi/ser‐
       vices/*.service which may define static DNS-SD services. If  you  enable  publish-resolv-conf-dns-servers  in  avahi-daemon.conf  the  file
       /etc/resolv.conf will be read, too.

OPTIONS
       -f | --file= FILE
              Specify the configuration file to read. (default: /etc/avahi/avahi-daemon.conf)

       -D | --daemonize
              Daemonize after startup. Implies --syslog.

       -s | --syslog
              Log to syslog instead of STDERR. Implied by --daemonize.

       --debug
              Increase verbosity to debug level.

       --no-rlimits
              Don't enforce resource limits as specified in the configuration file. (See setrlimit(2) for more information)

       --no-drop-root
              Don't drop root privileges after startup and don't require daemon to be started as root. We recommend not to use this option.

       --no-chroot
              Don't chroot(2) the daemon. This option is only available when compiled with chroot() support.

       --no-proc-title
              Don't  change  the  process  name while running. Unless this option is specified avahi-daemon will reflect its current state and the
              selected host name in the process title.

       -k | --kill
              Kill an already running avahi-daemon. (equivalent to sending a SIGTERM)

       -r | --reload
              Tell an already running avahi-daemon to reread /etc/resolv.conf (in case you enabled publish-resolv-conf-dns-servers  in  avahi-dae‐
              mon.conf)  the  files from /etc/avahi/services/. Please note that this will not reload the /etc/avahi/avahi-daemon.conf. (equivalent
              to sending a SIGHUP)

       -c | --check
              Return 0 as return code when avahi-daemon is already running.

       -h | --help
              Show help

       -v | --version
              Show version information

FILES
       /etc/avahi/avahi-daemon.conf: the default configuration file for avahi-daemon, avahi-daemon.conf(5) for more information.

       /etc/avahi/hosts: additional static hostname mappings to publish in mDNS, see avahi.hosts(5) for more information.

       /etc/avahi/services/*.service: static service definitions, see avahi.service(5) for more information.

SIGNALS
       SIGINT, SIGTERM: avahi-daemon will shutdown. (Same as --kill).

       SIGHUP: avahi-daemon will reload unicast DNS server data from /etc/resolv.conf and static service  definitions  from  /etc/avahi/services/.
       (Same as --reload)

       SIGUSR1: avahi-daemon will dump local and remote cached resource record data to syslog.

AUTHORS
       The Avahi Developers <avahi (at) lists (dot) freedesktop (dot) org>; Avahi is available from http://avahi.org/

SEE ALSO
       avahi-daemon.conf(5), avahi.hosts(5), avahi.service(5), avahi-dnsconfd(8), avahi-set-host-name(1)

       http://avahi.org/wiki/AvahiAndUnicastDotLocal documents the problems when using Avahi in a unicast DNS zone .local.

COMMENTS
       This man page was written using xml2man(1) by Oliver Kurth.

Manuals                                                                User                                                        avahi-daemon(8)
