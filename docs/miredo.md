MIREDO(8)                                                     System Manager's Manual                                                    MIREDO(8)

NAME
       miredo - Teredo IPv6 tunneling for Unix

SYNOPSIS
       miredo [-c config_file] [-f] [-u user] [ -t chrootdir] [server_name]

DESCRIPTON
       Miredo  is  a  daemon program providing a Teredo tunnel service compatible with the "Teredo: Tunneling IPv6 over UDP through NATs" Internet
       proposed standard (RFC 4380). It can provide either Teredo client or Teredo relay functionality.

       This is mostly useful to provide IPv6 connectivity to users behind NAT, most of which do not support IPv6 at all. Many  NATs  do  not  even
       support proto-41 forwarding, so it is not possible to set up a 6to4 or point-to-point IPv6-over-IPv4 tunnel through them.

       A Teredo relay is an IPv6 router which forwards IPv6 packets between the IPv6 Internet and Teredo clients by encapsulating these IPv6 pack‐
       ets over UDP/IPv4.

       A Teredo client is an IPv6-enabled host which is located behind an IPv4-only Network Address Translator (a.k.a. NAT), and encapsulates  its
       IPv6 traffic inside UDP over IPv4 packets.

       A  Teredo  server  is a special Teredo relay which is required for Teredo clients to setup their IPv6 connectivity through Teredo. A Teredo
       server must have to global static subsequent IPv4 addresses. It receives packets from Teredo clients and Teredo relays on UDP port 3544.

OPTIONS
       -c config_file or --config config_file
              Specify an alternate configuration file for Miredo instead of the default, /etc/miredo/miredo.conf.

       -f or --foreground
              Do not detach from the console. Run the program in the foreground.

       -h or --help
              Display some help and exit.

       -t or --chrootdir
              Specify a directory to use as a root after initialization is completed.  When used as a Teredo client, the hostname resolver library
              files must be present in the chroot. The directory can safely be left empty for a Teredo relay.

       -u username or --user username
              Override the user that the program will run as. By default, it runs as nobody.

       -V or --version
              Display program version and license and exit.

       server_name
              This  optional command argument specifies a Teredo server to use. It will override any ServerAddress directive found in the configu‐
              ration file. It is ignored if RelayType is not set to "client" (see miredo.conf).

SECURITY
       Miredo requires root privileges to create its IPv6 tunneling network interface, and to set it up properly. Once its initialization is  com‐
       plete,  it  will  setgid,  chroot into an empty directory and ultimately setuid (see option -u), so as to decrease the system's exposure to
       potential security issues. However, if Miredo runs as a Teredo client, it needs root privileges when running, in order to change  the  tun‐
       neling  network interface settings automatically. To prevent possible root compromise, Miredo implements priveleges separation. The process
       that handles data from the network is not privileged.

       While that is not specific to nor dependent on Miredo, it should be noted that Teredo connectivity allows anyone behind  a  NAT  to  obtain
       global  public  IPv6  connectivity.  It might break some corporate policy.  If that is an issue, outgoing UDP packets with destination port
       3544 should be blocked at the perimeter firewall.

SIGNALS
       SIGHUP Force a reload of the daemon.

       SIGINT, SIGTERM Shutdown the daemon.

       SIGUSR1, SIGUSR2 Do nothing, might be used in future versions.

FILES
       /etc/miredo/miredo.conf
              The default configuration file.

       /var/run/miredo.pid
              The process-id file.

SEE ALSO
       miredo.conf(5), miredo-server(8), ipv6(7), route(8), ip(8)

AUTHOR
       Rémi Denis-Courmont <remi at remlab dot net>

       http://www.remlab.net/miredo/

miredo                                                             February 2008                                                         MIREDO(8)
