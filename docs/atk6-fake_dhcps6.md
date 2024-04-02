THC-IPv6(8)                                                   System Manager's Manual                                                  THC-IPv6(8)

NAME
       The Hacker Choice's IPv6 Attack Toolkit (aka thc-ipv6)

SYNOPSIS
       tool [options] ...

       DESCRIPTION
              This  manual  page  briefly  documents  each  of the attack-toolkit6 tools. Not all options are listed here, to see the full list of
              options of each tool please invoke them with -h.

              Note that on Debian (if you read this on Debian) command names are prefixed with atk6- , so for example the tool  alive6  should  be
              invoked as atk6-alive6.  This is a Debian-only modification.

       address6 <mac-address/ipv4-address/ipv6-address> [ipv6-prefix]
              Converts  a  mac or ipv4 address to an ipv6 address (link local if no prefix is given as 2nd option) or, when given an ipv6 address,
              prints the mac or ipv4 address. Prints all possible variations. Returns -1 on errors or the number of variations found.

       alive6 <interface> [unicast-or-multicast-address [remote-router]]
              Shows alive addresses in the segment. If you specify a remote router, the packets are sent with a routing header prefixed  by  frag‐
              mentation.

       covert_send6 <interface> <target> <file> [port]
              Sends the content of FILE covertly to the target.

       covert_send6d <interface> <file>
              Writes received covertly content to FILE.

       denial6 <interface> <destination> <test-case-number>
              Performs various denial of service attacks on a target.

       detect_sniffer6 <interface> [target-ip]
              Tests if systems on the local LAN are sniffing. Works against Windows, Linux, OS/X and *BSD systems.

       dnssecwalk [-e46] <dns-server> <domain>
              Performs DNSSEC NSEC walking.

       dos_mld <interface>
              This  tools prevents new ipv6 interfaces to come up, by sending answers to duplicate ip6 checks (DAD). This results in a DOS for new
              ipv6 devices.

       dos-new-ip6 <interface>
              This tools prevents new ipv6 interfaces to come up, by sending answers to duplicate ip6 checks (DAD). This results in a DOS for  new
              ipv6 devices.

       detect-new-ip6 <interface> [scriptname]
              This  tools  detects new ipv6 addresses joining the local network.  If scriptname is supplied, it is executed with the detected IPv6
              address as option.

       dnsdict6 [-t THREADS] <domain> [dictionary-file]
              Enumerates a domain for DNS entries, it uses a dictionary file if supplied or a built-in list otherwise.

       dnsrevenum6 <dns-server> <ipv6-address>
              Performs a fast reverse DNS enumeration.

       dump_router6 <interface>
              Dumps all local routers and their information.

       dump_dhcp6 <interface>
              Dumps all DHCPv6 servers and their information

       exploit6 <interface> <destination> [test-case-number]
              Performs exploits of various CVE known IPv6 vulnerabilities on the destination.

       extract_hosts6 <file>
              Prints the host parts of ipv6 addresses in file.

       extract_networks6 <interface>
              Prints the networks found in file.

       fake_advertise6 <interface> <ip-address> [target-address [own-mac-address]]
              Advertise ipv6 address on the network (with own mac if not defined) sending it to the all-nodes multicast address if no target spec‐
              ified.

       fake_dhcps6 <interface> <network-address/prefix-length> <dns-server>
              Fake DHCPv6 server. Used to configure an address and set a DNS server.

       fake_dns6d <interface> <ipv6-address>
              Fake DNS server that serves the same IPv6 address to any lookup request.

       fake_dnsupdate6 <dns-server> <fqdn> <ipv6-address>
              Send false DNS update requests.

       fake_mipv6 <interface> <home-address> <home-agent-address> <care-of-address>
              If  the  mobile  IPv6  home-agent  is mis-configured to accept MIPV6 updates without IPSEC, this will redirect all packets for home-
              address to care-of-address.

       fake_mld6 <interface> <multicast-address> [[target-address] [[ttl] [[own-ip] [own-mac-address]]]]
              Advertise yourself in a multicast group of your choice.

       fake_mld26  [-l]  <interface>  <add|delete|query>  [multicast-address  [target-address  [ttl  [own-ip  [own-mac-address   [destination-mac-
       address]]]]]]
              This uses the MLDv2 protocol. Only a subset of what the protocol is able to do is possible to implement via a command line.

       fake_mldrouter6 [-l] <interface> <advertise|solicitate|terminate> [own-ip [own-mac-address]]
              Announce, delete or solicitate MLD router - yourself or others.

       fake_pim6 [-t ttl] [-s src6] [-d dst6] <interface> {<hello> [dr_priority]|{join|prune} <neighbor6> <multicast6> <target6>}
              The hello command takes optionally the DR priority (default: 0).

       fake_router6 <interface> <router-ip-link-local
              network-address/prefix-length>  <mtu>  [mac-address]  Announce yourself as a router and try to become the default router.  If a non-
              existing mac-address is supplied, this results in a DOS.

       fake_router26 <interface>
              Like fake_router6 with more options available.

       fake_solicitate6 <interface> <solicited-ip>
              Solicits IPv6 address on the network, sending it to the all-nodes multicast address.

       firewall6 [-u] <interface> <destination> <port> [test-case-no]
              Performs various ACL bypass attempts to check implementations.  Defaults to TCP ports, option -u switches  to  UDP.   For  all  test
              cases to work, ICMPv6 ping to the destination must be allowed.

       flood_advertise6 <interface>
              Flood the local network with neighbor advertisements.

       flood_dhcpc6 <interface> [domain-name]
              DHCP  client flooder. Use to deplete the IP address pool a DHCP6 server is offering. Note: if the pool is very large, this is rather
              senseless.

       flood_mld6 <interface>
              Flood the local network with MLD reports.

       flood_mld26 <interface>
              Flood the local network with MLDv2 reports.

       flood_mldrouter6 <interface>
              Flood the local network with MLD router advertisements.

       flood_redir6 [-HFD] interface [target] [oldrouter [newrouter]]
              Flood a target with ICMPv6 redirects

       flood_router6 <interface>
              Flood the local network with router advertisements.

       flood_router26 <interface>
              Similar to flood_router6 but with more options available.

       flood_rs6 [-sS] interface [target]
              Flood a network with ICMPv6 router solicitation messages

       flood_solicitate6 <interface> [target-ip]
              Flood the network with neighbor solicitations.

       four2six [-FHD] [-s src6] interface ipv6-to-ipv4-gateway ipv4-src ipv4-dst [port]
              Send (spoofed) packets over a 4to6 tunnel (IPv4 packets over IPv6 networks)

       fragmentation6 <interface> <target-ip>
              Performs fragment firewall and implementation checks, including denial-of-service.

       fuzz_ip6 [-x] [-t number | -T number] [-p number] [-IFSDHRJ] [-1|-2|-3|-4|-5|-6|-7] <interface> <unicast-or-multicast-address> [address-in-
       data-pkt]
              Fuzzes an icmp6 packet.

       fuzz_dhcpc6 [-1|-2|-3|-4|-5|-6|-7|-8|-9|-A|-B|-C|-D|-m] [-f mac] [-l link] [-v ipv6] [-x xid] [-c client] [-o options] interface
              Fuzzes messages sent to a DHCPv6 client.

       fuzz_dhcps6 [-t number | -T number] [-e number | -T number] [-p number] [-md] [-1|-2|-3|-4|-5|-6|-7|-8] interface [domain-name]
              Fuzzes  a  DHCPv6 server on specified packet types.  implementation6 <interface> <destination> [test-case-number] Performs some ipv6
              implementation checks, can be used to test firewalls too.

       implementation6d <interface>
              Identifies test packets by the implementation6 tool, useful to check what packets passed a firewall.

       inject_alive6 [-ap] <interface>
              This tool answers to keep-alive requests on PPPoE and 6in4 tunnels; for PPPoE0t also  sends  keep-alive  requests.   Note  that  the
              appropriate  environment  variable THC_IPV6_{PPPOE|6IN4} must be set.  Option -a will actively send alive requests every 15 seconds.
              Option -p will not send replies to alive requests.

       inverse_lookup6 <interface> <mac-address>
              Performs an inverse address query, to get the IPv6 addresses that are assigned to a MAC address. Note that only few systems  support
              this yet.

       kill_router6 <interface> <target-ip>
              Announce  that  target  router  is going down to delete it from the routing tables. If you supply a '*' as target-ip, this tool will
              sniff the network for RAs and immediately send the kill packet.

       ndpexhaust26 <interface> [-acpPTUrR] [-s sourceip6] <target-network>
              Flood the target /64 network with ICMPv6 TooBig error messages.  This tool version is manyfold more effective than ndpexhaust6.   -a
              add  a hop-by-hop header with router alert.  -c      do not calculate the checksum to save time.  -p      send ICMPv6 Echo Requests.
              -P      send ICMPv6 Echo Reply.  -T      send ICMPv6  Time-to-live-exceeded.   -U       send  ICMPv6  Unreachable  (no  route).   -r
              randomize the source from your /64 prefix.  -R      randomize the source fully.  -s sourceip6  use this as source ipv6 address.

       ndpexhaust6 <interface> <target-network>
              Randomly pings IPs in target network.

       node_query6 <interface> <target-ip>
              Sends an ICMPv6 node query request to the target and dumps the replies.

       parasite6 <interface> [fake-mac]
              This  is  an  "ARP  spoofer"  for  IPv6, redirecting all local traffic to your own system (or nirvana if fake-mac does not exist) by
              answering falsely to Neighbor Solicitation requests, specifying FAKE-MAC results in a local DOS.

       passive_discovery6 <interface> [scriptname]
              Passively sniffs the network and dump all client's IPv6 addresses detected. If  scriptname  is  supplied,  it  is  called  with  the
              detected IPv6 address as first and the interface as second parameters.

       randicmp6 <interface> <target-ip>
              Sends all ICMPv6 type and code combinations to target.

       redir6 <interface> <src-ip> <target-ip> <original-router> <new-router> [new-router-mac]
              Implant  a  route  into  src-ip, which redirects all traffic to target-ip to new-ip. You must know the router which would handle the
              route.  If the new-router-mac does not exist, this results in a DOS.

       redirsniff6 <interface> <victim-ip> <destination-ip> <original-router> [<new-router> [new-router-mac]]
              Implant a route into victim-ip, which redirects all traffic to destination-ip to new-router. You must know the  router  which  would
              handle the route.  If the new-router and new-router-mac does not exist, this results in a DoS.

       rsmurf6 <interface> <victim-ip>
              Smurfs  the  local  network of the victim. Note: this depends on an implementation error, currently only verified on Linux (fixed in
              current versions).  Evil: "ff02::1" as victim will DOS your local LAN completely.

       smurf6 <interface> <victim-ip> [multicast-network-address]
              Smurf the target with ICMPv6 echo replies. Target of echo request is the local all-nodes multicast address if not specified.

       sendpees6 <interface> <key_length> <prefix> <victim-ip>
              Send SEND neighbor solicitation messages and make target to verify a lota CGA and RSA signatures.

       sendpeesmp6 <interface> <key_length> <prefix> <victim-ip>
              Multithreaded version of sendpees6.

       trace6 [-d] <interface> targetaddress [port]
              A basic but very fast traceroute6 program.

       thcping6 <interface> <src6> <dst6> <srcmac> <dstmac> <data>
              Craft your special ICMPv6 echo request packet.

       thcsyn6 [-AcDrRS] [-p port] [-s source-ip6] <interface> <target> <port>
              Flood the target port with TCP-SYN packets. If you supply "x" as port, it is randomized.

       toobig6 <interface> <target-ip> <existing-ip> <mtu>
              Implants the specified mtu on the target

SEE ALSO
       nmap(1), amap(1), dsniff(8).

AUTHOR
       thc-ipv6 was written by van Hauser <vh@thc.org> / THC

       The homepage for this toolkit is: https://github.com/vanhauser-thc/thc-ipv6

       This manual page was written by Maykel Moya <mmoya@mmoya.org> and Arturo Borrero Gonzalez <arturo@debian.org>, for the Debian project  (but
       may be used by others). It's based on previous work by Michael Gebetsroither <gebi@grml.org>.

Summer 2015                                                       ATTACK-TOOLKIT6                                                      THC-IPv6(8)
