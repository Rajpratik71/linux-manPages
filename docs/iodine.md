IODINE(8)                                                     System Manager's Manual                                                    IODINE(8)

NAME
       iodine, iodined - tunnel IPv4 over DNS

SYNOPSIS
       iodine [-v]

       iodine [-h]

       iodine [-4] [-6] [-f] [-r] [-u user ] [-P password ] [-m fragsize ] [-t chrootdir ] [-d device ] [-R rdomain ] [-m fragsize ] [-M namelen ]
       [-z context ] [-F pidfile ] [-T dnstype ] [-O downenc ] [-L 0|1 ] [-I interval ] [ nameserver ] topdomain

       iodined [-v]

       iodined [-h]

       iodined [-c] [-s] [-f] [-D] [-u user ] [-t chrootdir ] [-d device ] [-m mtu ] [-l listen_ip ] [-p port ] [-n ( auto | external_ip )  ]  [-b
       dnsport ] [-P password ] [-z context ] [-F pidfile ] [-i max_idle_time ] tunnel_ip [ /netmask ] topdomain

DESCRIPTION
       iodine  lets  you  tunnel  IPv4  data  through  a DNS server. This can be useful in situations where Internet access is firewalled, but DNS
       queries are allowed. It needs a TUN/TAP device to operate. The bandwidth is asymmetrical, with a measured maximum of  680  kbit/s  upstream
       and  2.3  Mbit/s  downstream in a wired LAN test network.  Realistic sustained throughput on a Wifi network using a carrier-grade DNS cache
       has been measured at some 50 kbit/s upstream and over 200 kbit/s downstream.  iodine is the client application, iodined is the server.

       Note: server and client are required to speak the exact same protocol. In most cases, this means running the same iodine version.  Unfortu‐
       nately, implementing backward and forward protocol compatibility is usually not feasible.

OPTIONS
   Common Options:
       -v     Print version info and exit.

       -h     Print usage info and exit.

       -f     Keep running in foreground.

       -u user
              Drop privileges and run as user 'user' after setting up tunnel.

       -t chrootdir
              Chroot to 'chrootdir' after setting up tunnel.

       -d device
              Use the TUN device 'device' instead of the normal one, which is dnsX on Linux and otherwise tunX.

       -P password
              Use 'password' to authenticate. If not used, stdin will be used as input. Only the first 32 characters will be used.

       -z context
              Apply SELinux 'context' after initialization.

       -F pidfile
              Create 'pidfile' and write process id in it.

   Client Options:
       -4     Force IPv4 DNS queries

       -6     Force IPv6 DNS queries

       -r     Skip  raw  UDP  mode.  If  not  used,  iodine will try getting the public IP address of the iodined host and test if it is reachable
              directly. If it is, traffic will be sent to the server instead of the DNS relay.

       -R rdomain
              Use OpenBSD routing domain 'rdomain' for the DNS connection.

       -m fragsize
              Force maximum downstream fragment size. Not setting this will cause the client to automatically probe  the  maximum  accepted  down‐
              stream fragment size.

       -M namelen
              Maximum  length  of upstream hostnames, default 255.  Usable range ca. 100 to 255.  Use this option to scale back upstream bandwidth
              in favor of downstream bandwidth.  Also useful for DNS servers that perform unreliably when using full-length hostnames,  noticeable
              when fragment size autoprobe returns very different results each time.

       -T dnstype
              DNS  request  type  override.   By default, autodetection will probe for working DNS request types, and will select the request type
              that is expected to provide the most bandwidth.  However, it may turn out that a DNS relay imposes limits  that  skew  the  picture,
              which  may lead to an "unexpected" DNS request type providing more bandwidth.  In that case, use this option to override the autode‐
              tection.  In (expected) decreasing bandwidth order, the supported DNS request types are: NULL, PRIVATE, TXT, SRV, MX,  CNAME  and  A
              (returning  CNAME).   Note  that  SRV, MX and A may/will cause additional lookups by "smart" caching nameservers to get an actual IP
              address, which may either slow down or fail completely. The PRIVATE type uses value 65399 (in the 'private use' range) and  requires
              servers implementing RFC 3597.

       -O downenc
              Force downstream encoding type for all query type responses except NULL.  Default is autodetected, but may not spot all problems for
              the more advanced codecs.  Use this option to override the autodetection.  Base32 is the lowest-grade codec and should always  work;
              this  is  used  when autodetection fails.  Base64 provides more bandwidth, but may not work on all nameservers.  Base64u is equal to
              Base64 except in using underscore ('_') instead of plus sign ('+'), possibly working where Base64 does not.  Base128 uses high  byte
              values  (mostly  accented  letters in iso8859-1), which might work with some nameservers.  For TXT queries, Raw will provide maximum
              performance, but this will only work if the nameserver path is fully 8-bit-clean for responses  that  are  assumed  to  be  "legible
              text".

       -L 0|1 Lazy-mode switch.  -L1 (default): Use lazy mode for improved performance and decreased latency.  A very small minority of DNS relays
              appears to be unable to handle the lazy mode traffic pattern, resulting in no or very little data coming through.  The iodine client
              will  detect this and try to switch back to legacy mode, but this may not always work.  In these situations use -L0 to force running
              in legacy mode (implies -I1).

       -I interval
              Maximum interval between requests (pings) so that intermediate DNS servers will not time out. Default is 4 in lazy mode, which  will
              work  fine  in most cases. When too many SERVFAIL errors occur, iodine will automatically reduce this to 1.  To get absolute minimum
              DNS traffic, increase well above 4, but not so high that SERVFAIL errors start to occur.  There are some DNS relays with very  small
              timeouts,  notably  dnsadvantage.com (ultradns), that will give SERVFAIL errors even with -I1; data will still get trough, and these
              errors can be ignored.  Maximum useful value is 59, since iodined will close a client's connection after 60 seconds of inactivity.

   Server Options:
       -c     Disable checking the client IP address on all incoming requests.  By default, requests originating from  non-matching  IP  addresses
              will be rejected, however this will cause problems when requests are routed via a cluster of DNS servers.

       -s     Don't try to configure IP address or MTU.  This should only be used if you have already configured the device that will be used.

       -D     Increase  debug level. Level 1 prints info about each RX/TX packet.  Implies the -f option.  On level 2 (-DD) or higher, DNS queries
              will be printed literally.  When using Base128 upstream encoding, this is best viewed as  ISO  Latin-1  text  instead  of  (illegal)
              UTF-8.  This is easily done with : "LC_ALL=C luit iodined -DD ..."  (see luit(1)).

       -m mtu Set  'mtu'  as  mtu size for the tun device.  This will be sent to the client on login, and the client will use the same mtu for its
              tun device.  Default 1130.  Note that the DNS traffic will be automatically fragmented when needed.

       -l listen_ip
              Make the server listen only on 'listen_ip' for incoming requests.  By default, incoming requests are accepted from all interfaces.

       -p port
              Make the server listen on 'port' instead of 53 for traffic.  If 'listen_ip' does not include localhost, this 'port' can be the  same
              as 'dnsport'.  Note: You must make sure the dns requests are forwarded to this port yourself.

       -n auto|external_ip
              The  IP  address  to  return  in NS responses. Default is to return the address used as destination in the query.  If external_ip is
              'auto', iodined will use externalip.net web service to retrieve the external IP of the host and use that for NS responses.

       -b dnsport
              If this port is specified, all incoming requests not inside the tunnel domain will be forwarded to this port  on  localhost,  to  be
              handled  by  a real dns.  If 'listen_ip' does not include localhost, this 'dnsport' can be the same as 'port'.  Note: The forwarding
              is not fully transparent, and not advised for use in production environments.

       -i max_idle_time
              Make the server stop itself after max_idle_time seconds if no traffic have been received.  This should be combined with  systemd  or
              upstart on demand activation for being effective.

   Client Arguments:
       nameserver
              The nameserver to use to relay the dns traffic. This can be any relaying nameserver or the server running iodined if reachable. This
              field can be given as an IPv4/IPv6 address or as a hostname. This argument is optional, and if not specified a  nameserver  will  be
              read from the /etc/resolv.conf file.

       topdomain
              The  dns  traffic  will be sent as queries for subdomains under ´topdomain'. This is normally a subdomain to a domain you own. Use a
              short domain name to get better throughput. If nameserver is the iodined server, then the topdomain can be chosen freely. This argu‐
              ment must be the same on both the client and the server.

   Server Arguments:
       tunnel_ip[/netmask]
              This is the server's ip address on the tun interface. The client will be given the next ip number in the range. It is recommended to
              use the 10.0.0.0 or 172.16.0.0 ranges. The default netmask is /27, can be overridden by specifying it here. Using a smaller  network
              will limit the number of concurrent users.

       topdomain
              The dns traffic is expected to arrive as queries for subdomains under 'topdomain'. This is normally a subdomain to a domain you own.
              Use a short domain name to get better throughput. This argument must be the same on both the client  and  the  server.  Queries  for
              domains other than 'topdomain' will be forwarded when the -b option is given, otherwise they will be dropped.

EXAMPLES
       See the README file for both a quick test scenario, and a detailed description of real-world deployment.

SECURITY
       Login  is  a  relatively  secure  challenge-response  MD5  hash,  with the password never passing the wire.  However, all other data is NOT
       encrypted in any way. The DNS traffic is also vulnerable to replay, injection and man-in-the-middle attacks,  especially  when  iodined  is
       used  with  the -c option. Use of ssh or vpn tunneling is strongly recommended.  On both server and client, use iptables, pf or other fire‐
       walls to block all traffic coming in from the tun interfaces, except to the used ssh or vpn ports.

ENVIRONMENT
   IODINE_PASS
       If the environment variable IODINE_PASS is set, iodine will use the value it is set to as password instead of asking for one. The -P option
       still has precedence.

   IODINED_PASS
       If  the  environment  variable  IODINED_PASS  is set, iodined will use the value it is set to as password instead of asking for one. The -P
       option still has precedence.

SEE ALSO
       The README file in the source distribution contains some more elaborate information.

BUGS
       File bugs at http://dev.kryo.se/iodine/

AUTHORS
       Erik Ekman <yarrick@kryo.se> and Bjorn Andersson <flex@kryo.se>. Major contributions by Anne Bezemer.

User Manuals                                                         JUN 2014                                                            IODINE(8)
