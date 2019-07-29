MIREDO-SERVER(8)                                              System Manager's Manual                                             MIREDO-SERVER(8)

NAME
       miredo-server - Teredo server for Unix

SYNOPSIS
       miredo-server [-c config_file] [-f] [-u user] [server_name]

DESCRIPTON
       Miredo-server is an Unix daemon program which implements a Teredo server as specified by the "Teredo: Tunneling IPv6 over UDP through NATs"
       Internet proposed standard (RFC 4380).

       A Teredo server is required for Teredo clients to setup their IPv6 connectivity through Teredo. A Teredo server must have two global static
       subsequent IPv4 addresses. It receives packets from Teredo clients and Teredo relays on UDP port 3544.

OPTIONS
       -c config_file or --config config_file
              Specify an alternate configuration file for Miredo instead of the default, /etc/miredo/miredo-server.conf.

       -f or --foreground
              Do not detach from the console. Run the program in the foreground.

       -h or --help
              Display some help and exit.

       -u username or --user username
              Override the user that the program will run as. By default, it runs as nobody.

       -V or --version
              Display program version and license and exit.

SECURITY
       miredo-server requires root privileges to create open a raw IPv6 socket that is used to emit ICMPv6 Echo Request packets. Once its initial‐
       ization is complete, it will setgid, chroot into an empty directory and ultimately setuid (see option -u), so as to decrease  the  system's
       exposure to potential security issues.

SIGNALS
       SIGHUP Force a reload of the daemon.

       SIGINT, SIGTERM Shutdown the daemon.

       SIGUSR1, SIGUSR2 Do nothing, might be used in future versions.

FILES
       /etc/miredo/miredo-server.conf
              The default configuration file.

       /var/run/miredo-server.pid
              The process-id file.

SEE ALSO
       miredo-server.conf(5), miredo(8), ipv6(7)

AUTHOR
       Rémi Denis-Courmont <remi at remlab dot net>

       http://www.remlab.net/miredo/

miredo                                                             February 2008                                                  MIREDO-SERVER(8)
