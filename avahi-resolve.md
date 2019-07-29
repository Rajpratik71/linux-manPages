avahi-resolve(1)                                              General Commands Manual                                             avahi-resolve(1)

NAME
       avahi-resolve - Resolve one or more mDNS/DNS host name(s) to IP address(es) (and vice versa) using the Avahi daemon

SYNOPSIS
       avahi-resolve --name host-name ...

       avahi-resolve-host-name host-name ...

       avahi-resolve --address address ...

       avahi-resolve-address address ...

DESCRIPTION
       Resolve one or more mDNS/DNS host name(s) to IP address(es) (and vice versa) using the Avahi daemon.

OPTIONS
       When  passing  -n, specify one or more fully qualified mDNS/DNS host name(s) (e.g. "foo.local") to resolve into IP addresses on the command
       line. When passing -a, specify one or more IP address to resolve into host names.

       avahi-resolve-host-name is equivalent to avahi-resolve --name.

       avahi-resolve-address is equivalent to avahi-resolve --address.

       -n | --name
              Translate one or more fully qualified host names into addresses.

       -a | --address
              Translate one or more addresses into fully qualified host names.

       -v | --verbose
              Enable verbose mode.

       -6     When resolving a host name, look for IPv6 addresses exclusively.

       -4     When resolving a host name, look for IPv4 addresses exclusively.

       -h | --help
              Show help.

       -V | --version
              Show version information.

AUTHORS
       The Avahi Developers <avahi (at) lists (dot) freedesktop (dot) org>; Avahi is available from http://avahi.org/

SEE ALSO
       avahi-publish-address(1), avahi-daemon(8)

COMMENTS
       This man page was written using xml2man(1) by Oliver Kurth.

Manuals                                                                User                                                       avahi-resolve(1)
