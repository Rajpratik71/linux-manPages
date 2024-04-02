REDSOCKS(8)                                                   System Manager's Manual                                                  REDSOCKS(8)

NAME
       redsocks - redirect any TCP connection to a SOCKS or HTTP proxy

SYNOPSIS
       redsocks [options]

DESCRIPTION
       redsocks  is  a  daemon  running on the local system, that will transparently tunnel any TCP connection via a remote SOCKS4, SOCKS5 or HTTP
       proxy server. It uses the system firewall's redirection facility to intercept TCP connections, thus the redirection  is  system-wide,  with
       fine-grained control, and does not depend on LD_PRELOAD libraries.

       Redsocks supports tunneling TCP connections and UDP packets. It has authentication support for both, SOCKS and HTTP proxies.

       Also included is a small DNS server returning answers with the "truncated" flag set for any UDP query, forcing the resolver to use TCP.

OPTIONS
       -p pidfile
              Write the process ID to pidfile.

       -c config
              Use config as configuration file.

       -t     Test configuration file syntax.

SEE ALSO
       iptables(8), /etc/redsocks.conf, /usr/share/doc/redsocks/README.gz

AUTHOR
       redsocks was written by Leonid Evdokimov <leon@darkk.net.ru>

       This manual page was written by Apollon Oikonomopoulos <apoikos@debian.org>, for the Debian project (and may be used by others).

                                                                 November 14, 2011                                                     REDSOCKS(8)
