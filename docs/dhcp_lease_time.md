DHCP_LEASE_TIME(1)                                                                         General Commands Manual                                                                         DHCP_LEASE_TIME(1)



NAME
       dhcp_lease_time - Query remaining time of a lease on a the local dnsmasq DHCP server.

SYNOPSIS
       dhcp_lease_time <address>

DESCRIPTION
       Send a DHCPINFORM message to a dnsmasq server running on the local host and print (to stdout) the time remaining in any lease for the given address. The time is given as string printed to stdout.

       If an error occurs or no lease exists for the given address, nothing is sent to stdout a message is sent to stderr and a non-zero error code is returned.

       Requires dnsmasq 2.67 or later and may not work with other DHCP servers.

       The address argument is a dotted-quad IP addresses and mandatory.

LIMITATIONS
       Only works with IPv4 addresses and DHCP leases.

SEE ALSO
       dnsmasq(8)

AUTHOR
       This manual page was written by Simon Kelley <simon@thekelleys.org.uk>.





                                                                                                                                                                                           DHCP_LEASE_TIME(1)
