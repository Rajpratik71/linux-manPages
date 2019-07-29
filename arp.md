ARP(8)                                                                                    Linux Programmer's Manual                                                                                    ARP(8)



NAME
       arp - manipulate the system ARP cache

SYNOPSIS
       arp [-vn] [-H type] [-i if] -a [hostname]

       arp [-v] [-i if] -d hostname [pub]

       arp [-v] [-H type] [-i if] -s hostname hw_addr [temp]

       arp [-v] [-H type] [-i if] -s hostname hw_addr [netmask nm] pub

       arp [-v] [-H type] [-i if] -Ds hostname ifa [netmask nm] pub

       arp [-vnD] [-H type] [-i if] -f [filename]


DESCRIPTION
       Arp manipulates the kernel's ARP cache in various ways.  The primary options are clearing an address mapping entry and manually setting up one.  For debugging purposes, the arp program also allows a
       complete dump of the ARP cache.

OPTIONS
       -v, --verbose
              Tell the user what is going on by being verbose.

       -n, --numeric
              shows numerical addresses instead of trying to determine symbolic host, port or user names.

       -H type, --hw-type type
              When setting or reading the ARP cache, this optional parameter tells arp which class of entries it should check for.  The default value of this parameter is ether (i.e. hardware code 0x01 for
              IEEE 802.3 10Mbps Ethernet).  Other values might include network technologies such as ARCnet (arcnet) , PROnet (pronet) , AX.25 (ax25) and NET/ROM (netrom).

       -a [hostname], --display [hostname]
              Shows the entries of the specified hosts.  If the hostname parameter is not used, all entries will be displayed.

       -d hostname, --delete hostname
              Remove any entry for the specified host.  This can be used if the indicated host is brought down, for example.

       -D, --use-device
              Use the interface ifa's hardware address.

       -i If, --device If
              Select  an  interface.  When  dumping the ARP cache only entries matching the specified interface will be printed. When setting a permanent or temp ARP entry this interface will be associated
              with the entry; if this option is not used, the kernel will guess based on the routing table. For pub entries the specified interface is the interface on which ARP requests will be answered.
              NOTE: This has to be different from the interface to which the IP datagrams will be routed.

       -s hostname hw_addr, --set hostname
              Manually create an ARP address mapping entry for host hostname with hardware address set to hw_addr class, but for most classes one can assume that the usual presentation can  be  used.   For
              the  Ethernet  class,  this  is 6 bytes in hexadecimal, separated by colons. When adding proxy arp entries (that is those with the publish flag set a netmask may be specified to proxy arp for
              entire subnets. This is not good practice, but is supported by older kernels because it can be useful. If the temp flag is not supplied entries will be permanent stored into the ARP cache.
              NOTE: As of kernel 2.2.0 it is no longer possible to set an ARP entry for an entire subnet. Linux instead does automagic proxy arp when a route exists and it is  forwarding.  See  arp(7)  for
              details.

       -f filename, --file filename
              Similar to the -s option, only this time the address info is taken from file filename set up.  The name of the data file is very often /etc/ethers, but this is not official. If no filename is
              specified /etc/ethers is used as default.

              The format of the file is simple; it only contains ASCII text lines with a hostname, and a hardware address separated by whitespace. Additionally the pub, temp and netmask flags can be used.

       In all places where a hostname is expected, one can also enter an IP address in dotted-decimal notation.

       As a special case for compatibility the order of the hostname and the hardware address can be exchanged.

       Each complete entry in the ARP cache will be marked with the C flag. Permanent entries are marked with M and published entries have the P flag.

FILES
       /proc/net/arp,
       /etc/networks
       /etc/hosts
       /etc/ethers

SEE ALSO
       rarp(8), route(8), ifconfig(8), netstat(8)

AUTHORS
       Fred N. van Kempen, <waltje@uwalt.nl.mugnet.org> with a lot of improvements from net-tools Maintainer Bernd Eckenfels <net-tools@lina.inka.de>.



net-tools                                                                                         5 Jan 1999                                                                                           ARP(8)
