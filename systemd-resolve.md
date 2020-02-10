SYSTEMD-RESOLVE(1)                                                                           systemd-resolve                                                                           SYSTEMD-RESOLVE(1)

NAME
       systemd-resolve - Resolve domain names, IPV4 and IPv6 addresses, DNS resource records, and services

SYNOPSIS
       systemd-resolve [OPTIONS...] HOSTNAME...

       systemd-resolve [OPTIONS...] ADDRESS...

       systemd-resolve [OPTIONS...] --type=TYPE RRDOMAIN...

       systemd-resolve [OPTIONS...] --service [[NAME] TYPE] DOMAIN

       systemd-resolve [OPTIONS...] --statistics

       systemd-resolve [OPTIONS...] --reset-statistics

DESCRIPTION
       systemd-resolve may be used to resolve domain names, IPv4 and IPv6 addresses, DNS resource records and services with the systemd-resolved.service(8) resolver service. By default, the specified
       list of parameters will be resolved as hostnames, retrieving their IPv4 and IPv6 addresses. If the parameters specified are formatted as IPv4 or IPv6 operation the reverse operation is done, and
       a hostname is retrieved for the specified addresses.

       The --type= switch may be used to specify a DNS resource record type (A, AAAA, SOA, MX, ...) in order to request a specific DNS resource record, instead of the address or reverse address
       lookups. The special value "help" may be used to list known values.

       The --service switch may be used to resolve SRV[1] and DNS-SD[2] services (see below). In this mode, between one and three arguments are required. If three parameters are passed the first is
       assumed to be the DNS-SD service name, the second the SRV service type, and the third the domain to search in. In this case a full DNS-SD style SRV and TXT lookup is executed. If only two
       parameters are specified, the first is assumed to be the SRV service type, and the second the domain to look in. In this case no TXT RR is requested. Finally, if only one parameter is specified,
       it is assumed to be a domain name, that is already prefixed with an SRV type, and an SRV lookup is done (no TXT).

       The --statistics switch may be used to show resolver statistics, including information about the number of succesful and failed DNSSEC validations.

       The --reset-statistics may be used to reset various statistics counters maintained the resolver, including those shown in the --statistics output. This operation requires root privileges.

OPTIONS
       -4, -6
           By default, when resolving a hostname, both IPv4 and IPv6 addresses are acquired. By specifying -4 only IPv4 addresses are requested, by specifying -6 only IPv6 addresses are requested.

       -i INTERFACE, --interface=INTERFACE
           Specifies the network interface to execute the query on. This may either be specified as numeric interface index or as network interface string (e.g.  "en0"). Note that this option has no
           effect if system-wide DNS configuration (as configured in /etc/resolv.conf or /etc/systemd/resolve.conf) in place of per-link configuration is used.

       -p PROTOCOL, --protocol=PROTOCOL
           Specifies the network protocol for the query. May be one of "dns" (i.e. classic unicast DNS), "llmnr" (Link-Local Multicast Name Resolution[3]), "llmr-ipv4", "llmnr-ipv6" (LLMNR via the
           indicated underlying IP protocols). By default the lookup is done via all protocols suitable for the lookup. If used, limits the set of protocols that may be used. Use this option multiple
           times to enable resolving via multiple protocols at the same time. The setting "llmnr" is identical to specifying this switch once with "llmnr-ipv4" and once via "llmnr-ipv6". Note that this
           option does not force the service to resolve the operation with the specified protocol, as that might require a suitable network interface and configuration. The special value "help" may be
           used to list known values.

       -t TYPE, --type=TYPE, -c CLASS, --class=CLASS
           Specifies the DNS resource record type (e.g. A, AAAA, MX, ...) and class (e.g. IN, ANY, ...) to look up. If these options are used a DNS resource record set matching the specified class and
           type is requested. The class defaults to IN if only a type is specified. The special value "help" may be used to list known values.

       --service
           Enables service resolution. This enables DNS-SD and simple SRV service resolution, depending on the specified list of parameters (see above).

       --service-address=BOOL
           Takes a boolean parameter. If true (the default), when doing a service lookup with --service the hostnames contained in the SRV resource records are resolved as well.

       --service-txt=BOOL
           Takes a boolean parameter. If true (the default), when doing a DNS-SD service lookup with --service the TXT service metadata record is resolved as well.

       --cname=BOOL
           Takes a boolean parameter. If true (the default), DNS CNAME or DNAME redirections are followed. Otherwise, if a CNAME or DNAME record is encountered while resolving, an error is returned.

       --search=BOOL
           Takes a boolean parameter. If true (the default), any specified single-label hostnames will be searched in the domains configured in the search domain list, if it is non-empty. Otherwise,
           the search domain logic is disabled.

       --legend=BOOL
           Takes a boolean parameter. If true (the default), column headers and meta information about the query response are shown. Otherwise, this output is suppressed.

       --statistics
           If specified general resolver statistics are shown, including information whether DNSSEC is enabled and available, as well as resolution and validation statistics.

       --reset-statistics
           Resets the statistics counters shown in --statistics to zero.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

EXAMPLES
       Example 1. Retrieve the addresses of the "www.0pointer.net" domain

           $ systemd-resolve www.0pointer.net

       Example 2. Retrieve the domain of the "85.214.157.71" IP address

           $ systemd-resolve 85.214.157.71

       Example 3. Retrieve the MX record of the "0pointer.net" domain

           $ systemd-resolve -t MX 0pointer.net

       Example 4. Resolve an SRV service

           $ systemd-resolve --service _xmpp-server._tcp gmail.com

SEE ALSO
       systemd(1), systemd-resolved.service(8)

NOTES
        1. SRV
           https://tools.ietf.org/html/rfc2782

        2. DNS-SD
           https://tools.ietf.org/html/rfc6763

        3. Link-Local Multicast Name Resolution
           https://tools.ietf.org/html/rfc4795

systemd 229                                                                                                                                                                            SYSTEMD-RESOLVE(1)
