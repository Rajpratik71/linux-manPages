avahi-publish-service(1)                General Commands Manual               avahi-publish-service(1)

NAME
       avahi-publish-service  -  Register an mDNS/DNS-SD service or host name or address mapping using
       the Avahi daemon

SYNOPSIS
       avahi-publish -s [options] name service-type port [TXT data ...]

       avahi-publish-service [options] name service-type port [TXT data ...]

       avahi-publish -a [options] host name address

       avahi-publish-address [options] host name address

DESCRIPTION
       Register an mDNS/DNS-SD service or host name/address mapping using the Avahi daemon.

OPTIONS
       When calling in service registration mode, specify  a  DNS-SD  service  name  (e.g.  "Lennart's
       Files"),  a  service  type  (e.g. _http._tcp) and an IP port number for the service, optionally
       followed by any number of TXT record strings on the command line. When calling in  address/host
       name registration mode specify a fully qualified host name and an address (IPv4 or IPv6).

       -s | --service
              Register a service. avahi-publish-service is equivalent to avahi-publish -s.

       -a | --address
              Register an address/host name mapping. avahi-publish-address is equivalent to avahi-pub‐
              lish -a.

       -v | --verbose
              Enable verbose mode.

       -H | --host= HOSTNAME
              Specify a host name for this service, in case it doesn't reside on the local host.  This
              host name needs to be fully qualified and resolvable using mDNS or unicast DNS.

       -d | --domain= DOMAIN
              Publish the service in the specified domain. If omitted the Avahi daemon will publish it
              in its default domain (usually .local).

       --subtype= SUBTYPE
              Register the service with an additional subtype in addition to  the  main  type.  DNS-SD
              subtypes  have  the form _anon._sub._ftp._tcp, where _anon is the identifier of the sub‐
              type and _ftp._tcp is the main type. You may pass this option multiple times to register
              the service with multiple subtypes.

       -f | --no-fail
              Don't  fail  if  the  daemon is not found running. Instead, wait until it appears. If it
              disconnects, try to reconnect.

       -h | --help
              Show help

       -V | --version
              Show version information.

AUTHORS
       The Avahi Developers <avahi (at) lists (dot) freedesktop (dot) org>; Avahi  is  available  from
       http://avahi.org/

SEE ALSO
       avahi-resolve(1), avahi-browse(1), avahi-daemon(8)

COMMENTS
       This man page was written using xml2man(1) by Oliver Kurth.

Manuals                                          User                         avahi-publish-service(1)
