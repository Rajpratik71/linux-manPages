SYSTEMD-RESOLVE(1)                                                                          systemd-resolve                                                                         SYSTEMD-RESOLVE(1)

NAME
       systemd-resolve - Resolve domain names, IPV4 and IPv6 addresses, DNS resource records, and services

SYNOPSIS
       systemd-resolve [OPTIONS...] HOSTNAME...

       systemd-resolve [OPTIONS...] ADDRESS...

       systemd-resolve [OPTIONS...] --type=TYPE DOMAIN...

       systemd-resolve [OPTIONS...] --service [[NAME] TYPE] DOMAIN

       systemd-resolve [OPTIONS...] --openpgp USER@DOMAIN

       systemd-resolve [OPTIONS...] --tlsa DOMAIN[:PORT]

       systemd-resolve [OPTIONS...] --statistics

       systemd-resolve [OPTIONS...] --reset-statistics

DESCRIPTION
       systemd-resolve may be used to resolve domain names, IPv4 and IPv6 addresses, DNS resource records and services with the systemd-resolved.service(8) resolver service. By default, the
       specified list of parameters will be resolved as hostnames, retrieving their IPv4 and IPv6 addresses. If the parameters specified are formatted as IPv4 or IPv6 operation the reverse operation
       is done, and a hostname is retrieved for the specified addresses.

       The program's output contains information about the protocol used for the look-up and on which network interface the data was discovered. It also contains information on whether the
       information could be authenticated. All data for which local DNSSEC validation succeeds is considered authenticated. Moreover all data originating from local, trusted sources is also reported
       authenticated, including resolution of the local host name, the "localhost" host name or all data from /etc/hosts.

       The --type= switch may be used to specify a DNS resource record type (A, AAAA, SOA, MX, ...) in order to request a specific DNS resource record, instead of the address or reverse address
       lookups. The special value "help" may be used to list known values.

       The --service switch may be used to resolve SRV[1] and DNS-SD[2] services (see below). In this mode, between one and three arguments are required. If three parameters are passed the first is
       assumed to be the DNS-SD service name, the second the SRV service type, and the third the domain to search in. In this case a full DNS-SD style SRV and TXT lookup is executed. If only two
       parameters are specified, the first is assumed to be the SRV service type, and the second the domain to look in. In this case no TXT RR is requested. Finally, if only one parameter is
       specified, it is assumed to be a domain name, that is already prefixed with an SRV type, and an SRV lookup is done (no TXT).

       The --openpgp switch may be used to query PGP keys stored as OPENPGPKEY[3] resource records. When this option is specified one or more e-mail address must be specified.

       The --tlsa switch maybe be used to query TLS public keys stored as TLSA[4] resource records. When this option is specified one or more domain names must be specified.

       The --statistics switch may be used to show resolver statistics, including information about the number of successful and failed DNSSEC validations.

       The --reset-statistics may be used to reset various statistics counters maintained the resolver, including those shown in the --statistics output. This operation requires root privileges.

OPTIONS
       -4, -6
           By default, when resolving a hostname, both IPv4 and IPv6 addresses are acquired. By specifying -4 only IPv4 addresses are requested, by specifying -6 only IPv6 addresses are requested.

       -i INTERFACE, --interface=INTERFACE
           Specifies the network interface to execute the query on. This may either be specified as numeric interface index or as network interface string (e.g.  "en0"). Note that this option has no
           effect if system-wide DNS configuration (as configured in /etc/resolv.conf or /etc/systemd/resolve.conf) in place of per-link configuration is used.

       -p PROTOCOL, --protocol=PROTOCOL
           Specifies the network protocol for the query. May be one of "dns" (i.e. classic unicast DNS), "llmnr" (Link-Local Multicast Name Resolution[5]), "llmnr-ipv4", "llmnr-ipv6" (LLMNR via the
           indicated underlying IP protocols), "mdns" (Multicast DNS[6]), "mdns-ipv4", "mdns-ipv6" (MDNS via the indicated underlying IP protocols). By default the lookup is done via all protocols
           suitable for the lookup. If used, limits the set of protocols that may be used. Use this option multiple times to enable resolving via multiple protocols at the same time. The setting
           "llmnr" is identical to specifying this switch once with "llmnr-ipv4" and once via "llmnr-ipv6". Note that this option does not force the service to resolve the operation with the
           specified protocol, as that might require a suitable network interface and configuration. The special value "help" may be used to list known values.

       -t TYPE, --type=TYPE, -c CLASS, --class=CLASS
           Specifies the DNS resource record type (e.g. A, AAAA, MX, ...) and class (e.g. IN, ANY, ...) to look up. If these options are used a DNS resource record set matching the specified class
           and type is requested. The class defaults to IN if only a type is specified. The special value "help" may be used to list known values.

       --service
           Enables service resolution. This enables DNS-SD and simple SRV service resolution, depending on the specified list of parameters (see above).

       --service-address=BOOL
           Takes a boolean parameter. If true (the default), when doing a service lookup with --service the hostnames contained in the SRV resource records are resolved as well.

       --service-txt=BOOL
           Takes a boolean parameter. If true (the default), when doing a DNS-SD service lookup with --service the TXT service metadata record is resolved as well.

       --openpgp
           Enables OPENPGPKEY resource record resolution (see above). Specified e-mail addresses are converted to the corresponding DNS domain name, and any OPENPGPKEY keys are printed.

       --tlsa
           Enables TLSA resource record resolution (see above). A query will be performed for each of the specified names prefixed with the port and family ("_port._family.domain"). The port number
           may be specified after a colon (":"), otherwise 443 will be used by default. The family may be specified as an argument after --tlsa, otherwise tcp will be used.

       --cname=BOOL
           Takes a boolean parameter. If true (the default), DNS CNAME or DNAME redirections are followed. Otherwise, if a CNAME or DNAME record is encountered while resolving, an error is returned.

       --search=BOOL
           Takes a boolean parameter. If true (the default), any specified single-label hostnames will be searched in the domains configured in the search domain list, if it is non-empty. Otherwise,
           the search domain logic is disabled.

       --raw[=payload|packet]
           Dump the answer as binary data. If there is no argument or if the argument is "payload", the payload of the packet is exported. If the argument is "packet", the whole packet is dumped in
           wire format, prefixed by length specified as a little-endian 64-bit number. This format allows multiple packets to be dumped and unambiguously parsed.

       --legend=BOOL
           Takes a boolean parameter. If true (the default), column headers and meta information about the query response are shown. Otherwise, this output is suppressed.

       --statistics
           If specified general resolver statistics are shown, including information whether DNSSEC is enabled and available, as well as resolution and validation statistics.

       --reset-statistics
           Resets the statistics counters shown in --statistics to zero.

       --flush-caches
           Flushes all DNS resource record caches the service maintains locally. This is mostly equivalent to sending the SIGUSR2 to the systemd-resolved service.

       --reset-server-features
           Flushes all feature level information the resolver learnt about specific servers, and ensures that the server feature probing logic is started from the beginning with the next look-up
           request. This is mostly equivalent to sending the SIGRTMIN+1 to the systemd-resolved service.

       --status
           Shows the global and per-link DNS settings in currently in effect.

       --set-dns=SERVER, --set-domain=DOMAIN, --set-llmnr=MODE, --set-mdns=MODE, --set-dnssec=MODE, --set-nta=DOMAIN
           Set per-interface DNS configuration. These switches may be used to configure various DNS settings for network interfaces that aren't managed by systemd-networkd.service(8). (These
           commands will fail when used on interfaces that are managed by systemd-networkd, please configure their DNS settings directly inside the .network files instead.) These switches may be
           used to inform systemd-resolved about per-interface DNS configuration determined through external means. Multiple of these switches may be passed on a single invocation of systemd-resolve
           in order to set multiple configuration options at once. If any of these switches is used, it must be combined with --interface= to indicate the network interface the new DNS configuration
           belongs to. The --set-dns= option expects an IPv4 or IPv6 address specification of a DNS server to use, and may be used multiple times to define multiple servers for the same interface.
           The --set-domain= option expects a valid DNS domain, possibly prefixed with "~", and configures a per-interface search or route-only domain. It may be used multiple times to configure
           multiple such domains. The --set-llmnr=, --set-mdns= and --set-dnssec= options may be used to configure the per-interface LLMNR, MulticastDNS and DNSSEC settings. Finally, --set-nta= may
           be used to configure additional per-interface DNSSEC NTA domains and may also be used multiple times. For details about these settings, their possible values and their effect, see the
           corresponding options in systemd.network(5).

       --revert
           Revert the per-interface DNS configuration. This option must be combined with --interface= to indicate the network interface the DNS configuration shall be reverted on. If the DNS
           configuration is reverted all per-interface DNS setting are reset to their defaults, undoing all effects of --set-dns=, --set-domain=, --set-llmnr=, --set-mdns=, --set-dnssec=,
           --set-nta=. Note that when a network interface disappears all configuration is lost automatically, an explicit reverting is not necessary in that case.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

       --no-pager
           Do not pipe output into a pager.

EXAMPLES
       Example 1. Retrieve the addresses of the "www.0pointer.net" domain

           $ systemd-resolve www.0pointer.net
           www.0pointer.net: 2a01:238:43ed:c300:10c3:bcf3:3266:da74
                             85.214.157.71

           -- Information acquired via protocol DNS in 611.6ms.
           -- Data is authenticated: no

       Example 2. Retrieve the domain of the "85.214.157.71" IP address

           $ systemd-resolve 85.214.157.71
           85.214.157.71: gardel.0pointer.net

           -- Information acquired via protocol DNS in 1.2997s.
           -- Data is authenticated: no

       Example 3. Retrieve the MX record of the "yahoo.com" domain

           $ systemd-resolve -t MX yahoo.com --legend=no
           yahoo.com. IN MX    1 mta7.am0.yahoodns.net
           yahoo.com. IN MX    1 mta6.am0.yahoodns.net
           yahoo.com. IN MX    1 mta5.am0.yahoodns.net

       Example 4. Resolve an SRV service

           $ systemd-resolve --service _xmpp-server._tcp gmail.com
           _xmpp-server._tcp/gmail.com: alt1.xmpp-server.l.google.com:5269 [priority=20, weight=0]
                                        173.194.210.125
                                        alt4.xmpp-server.l.google.com:5269 [priority=20, weight=0]
                                        173.194.65.125
                                        ...

       Example 5. Retrieve a PGP key

           $ systemd-resolve --openpgp zbyszek@fedoraproject.org
           d08ee310438ca124a6149ea5cc21b6313b390dce485576eff96f8722._openpgpkey.fedoraproject.org. IN OPENPGPKEY
                   mQINBFBHPMsBEACeInGYJCb+7TurKfb6wGyTottCDtiSJB310i37/6ZYoeIay/5soJjlMyf
                   MFQ9T2XNT/0LM6gTa0MpC1st9LnzYTMsT6tzRly1D1UbVI6xw0g0vE5y2Cjk3xUwAynCsSs
                   ...

       Example 6. Retrieve a TLS key ("=tcp" and ":443" could be skipped)

           $ systemd-resolve --tlsa=tcp fedoraproject.org:443
           _443._tcp.fedoraproject.org IN TLSA 0 0 1 19400be5b7a31fb733917700789d2f0a2471c0c9d506c0e504c06c16d7cb17c0
                   -- Cert. usage: CA constraint
                   -- Selector: Full Certificate
                   -- Matching type: SHA-256

SEE ALSO
       systemd(1), systemd-resolved.service(8), systemd.dnssd(5), systemd-networkd.service(8)

NOTES
        1. SRV
           https://tools.ietf.org/html/rfc2782

        2. DNS-SD
           https://tools.ietf.org/html/rfc6763

        3. OPENPGPKEY
           https://tools.ietf.org/html/rfc7929

        4. TLSA
           https://tools.ietf.org/html/rfc6698

        5. Link-Local Multicast Name Resolution
           https://tools.ietf.org/html/rfc4795

        6. Multicast DNS
           https://www.ietf.org/rfc/rfc6762.txt

systemd 237                                                                                                                                                                         SYSTEMD-RESOLVE(1)
