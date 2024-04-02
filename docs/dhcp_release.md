DHCP_RELEASE(1)                                                                            General Commands Manual                                                                            DHCP_RELEASE(1)



NAME
       dhcp_release - Release a DHCP lease on a the local dnsmasq DHCP server.

SYNOPSIS
       dhcp_release <interface> <address> <MAC address> <client_id>

DESCRIPTION
       A utility which forces the DHCP server running on this machine to release a DHCP lease.

       Send a DHCPRELEASE message via the specified interface to tell the local DHCP server to delete a particular lease.

       The interface argument is the interface in which a DHCP request _would_ be received if it was coming from the client, rather than being faked up here.

       The address argument is a dotted-quad IP addresses and mandatory.

       The MAC address is colon separated hex, and is mandatory. It may be prefixed by an address-type byte followed by -, eg

       10-11:22:33:44:55:66

       but if the address-type byte is missing it is assumed to be 1, the type for ethernet. This encoding is the one used in dnsmasq lease files.

       The client-id is optional. If it is "*" then it treated as being missing.

NOTES
       MUST be run as root - will fail otherwise.

LIMITATIONS
       Only usable on IPv4 DHCP leases.

SEE ALSO
       dnsmasq(8)

AUTHOR
       This manual page was written by Simon Kelley <simon@thekelleys.org.uk>.





                                                                                                                                                                                              DHCP_RELEASE(1)
