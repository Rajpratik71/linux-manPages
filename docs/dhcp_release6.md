DHCP_RELEASE(1)                                                                            General Commands Manual                                                                            DHCP_RELEASE(1)



NAME
       dhcp_release6 - Release a DHCPv6 lease on a the local dnsmasq DHCP server.

SYNOPSIS
       dhcp_release6 --iface <interface> --client-id <client-id> --server-id server-id --iaid <iaid>  --ip <IP>  [--dry-run] [--help]

DESCRIPTION
       A utility which forces the DHCP server running on this machine to release a DHCPv6 lease.

   OPTIONS
       -a, --ip
              IPv6 address to release.

       -c, --client-id
              Colon-separated hex string representing DHCPv6 client id. Normally it can be found in leases file both on client and server.

       -d, --dry-run
              Print hexadecimal representation of generated DHCPv6 release packet to standard output and exit.

       -h, --help
              print usage information to standard output and exit.

       -i, --iaid
              Decimal representation of DHCPv6 IAID. Normally it can be found in leases file both on client and server.

       -n, --iface
              Network interface to send a DHCPv6 release packet from.

       -s, --server-id
              Colon-separated hex string representing DHCPv6 server id. Normally it can be found in leases file both on client and server.

NOTES
       MUST be run as root - will fail otherwise.

LIMITATIONS
       Only usable on IPv6 DHCP leases.

SEE ALSO
       dnsmasq(8)

AUTHOR
       This manual page was written by Simon Kelley <simon@thekelleys.org.uk>.





                                                                                                                                                                                              DHCP_RELEASE(1)
