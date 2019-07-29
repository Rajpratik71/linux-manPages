avahi-browse(1)                                                                         General Commands Manual                                                                        avahi-browse(1)

NAME
       avahi-browse - Browse for mDNS/DNS-SD services using the Avahi daemon

SYNOPSIS
       avahi-browse [options] service-type

       avahi-browse [options] --all

       avahi-browse [options] --browse-domains

       avahi-browse [options] --dump-db

       avahi-browse-domains [options]

DESCRIPTION
       Browse for mDNS/DNS-SD network services and browsing domains using the Avahi daemon.

OPTIONS
       Specify  a  DNS-SD  service  type (e.g. _http._tcp) to browse for on the command line, or -a to browse for all available service types. Items that appear on the network are prefixed with "+",
       items that disappear are prefixed with "-". If --resolve is passed items that are resolved are prefixed with "=".

       -a | --all
              Browse for all service types registered on the LAN, not just the one specified on the command line.

       -D | --browse-domains
              Browse for browsing domains instead for services. avahi-browse-domains is equivalent to avahi-browse --browse-domains

       -d | --domain= DOMAIN
              Browse in the specified domain. If omitted avahi-browse will browse in the default browsing domain (usually .local)

       -v | --verbose
              Enable verbose mode.

       -t | --terminate
              Terminate after dumping a more or less complete list.

       -c | --cache
              Terminate after dumping all entries available in the cache.

       -l | --ignore-local
              Ignore local services, show only remote services.

       -r | --resolve
              Automatically resolve services found.

       -f | --no-fail
              Don't fail if the daemon is not found running. Instead, wait until it appears. If it disconnects, try to reconnect.

       -p | --parsable
              Make output easily parsable for usage in scripts. If enabled fields are separated by semicolons (;), service names are escaped. It is recommended to combine this with --no-db-lookup.

       -k | --no-db-lookup
              Don't lookup services types in service type database.

       -b | --dump-db
              Dump the service type database (may be combined with -k)

       -h | --help
              Show help.

       -V | --version
              Show version information.

AUTHORS
       The Avahi Developers <avahi (at) lists (dot) freedesktop (dot) org>; Avahi is available from http://avahi.org/

SEE ALSO
       avahi-publish(1), avahi-resolve(1), avahi-daemon(8)

COMMENTS
       This man page was written using xml2man(1) by Oliver Kurth.

Manuals                                                                                          User                                                                                  avahi-browse(1)
