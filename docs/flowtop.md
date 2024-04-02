FLOWTOP(8)                                                      netsniff-ng toolkit                                                     FLOWTOP(8)

NAME
       flowtop - top-like netfilter TCP/UDP/SCTP/DCCP/ICMP(v6) flow tracking

SYNOPSIS
       flowtop { [options] }

DESCRIPTION
       flowtop  is  a top-like connection tracking tool that can run on an end host or small home router. It is able to present TCP, UDP/UDP-lite,
       SCTP, DCCP, and ICMP(v6) flows that have been collected by the kernel's netfilter connection tracking framework, thus no  packet  capturing
       in user space needs to be done.

       flowtop  is  able  to give you a quick overview of current connections on your local system, e.g. for debugging purposes or to answer ques‐
       tions like:

           * If you access website X, what other connections are being opened in
             the background that I'm not aware of?
           * What connections are active that pass one's router?
           * I have this proprietary binary Y, to where does it connect?
           * To which countries am I sending data?
           * Are there any suspicious background connections on my machine?
           * How many active connections does binary Y have?
           * How long are connections active already?
           * At which rate am I sending/receiving data?

       The following information will be presented in flowtop's output:

           * Application name and PID when run on local machine
           * Reverse DNS for source and destination
           * Geo-location information (country, city)
           * Used protocols (IPv4, IPv6, TCP, UDP, SCTP, ICMP, ...)
           * Flow port's service name heuristic
           * Transport protocol state machine information
           * Byte/packet counters (if they are enabled)
           * Connection duration (if timestamping is enabled)
           * Flow send/receive rate (if byte/packet counters are enabled)

       In order for flowtop to work, netfilter must be active and running on your machine, thus kernel-side connection tracking is active. If net‐
       filter is not running, you can activate it with iptables(8):

           iptables -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT

           iptables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT

       or by loading the following kernel modules:

           modprobe nf_conntrack_ipv4

           modprobe nf_conntrack_ipv6

       To dump byte/packet counters flowtop enables the sysctl(8) parameter “net.netfilter.nf_conntrack_acct” via:

           echo 1 > /proc/sys/net/netfilter/nf_conntrack_acct

       and  resets  it  to the previously set value on exit. These counters will only be active on connections which were created after accounting
       was enabled. Thus, to have these counters be active all the time the parameter should be enabled after the system is up.  To  automatically
       enable it, sysctl.conf(8) or sysctl.d(8) might be used.

       To calculate the connection duration flowtop enables the sysctl(8) parameter “net.netfilter.nf_conntrack_timestamp” via:

           echo 1 > /proc/sys/net/netfilter/nf_conntrack_timestamp

       and resets it to the previously set value on exit.

       flowtop's intention is just to get a quick look over your active connections.  If you want logging support, have a look at netfilter's con‐
       ntrack(8) tools instead.

OPTIONS
   -4, --ipv4
       Display IPv4 flows. That is the default when flowtop is started without any arguments.

   -6, --ipv6
       Display IPv6 flows. That is the default when flowtop is started without any arguments.

   -T, --tcp
       Display TCP flows. That is the default when flowtop is started without any arguments.

   -U, --udp
       Display UDP and UDP-lite flows.

   -D, --dccp
       Display DCCP flows.

   -I, --icmp
       Display ICMP version 4 and version 6 flows.

   -S, --sctp
       Display SCTP flows.

   -n, --no-dns
       Don't perform hostname lookup. Only numeric addresses will be shown for flow endpoints.

   -G, --no-geoip
       Don't perform GeoIP lookup. No geographical information will be shown for flow endpoints.

   -s, --show-src
       Also show source information of the flow, not only destination information.

   -b, --bits
       Show flow rates in bits per second instead of bytes per second.

   -u, --update
       The built-in database update mechanism will be invoked to get Maxmind's latest database. To configure search locations for  databases,  the
       file /etc/netsniff-ng/geoip.conf contains possible addresses. Thus, to save bandwidth or for mirroring Maxmind's databases (to bypass their
       traffic limit policy), different hosts or IP addresses can be placed into geoip.conf, separated by a newline.

   -t <time>, --interval <time>
       Flow info refresh interval in seconds, default is 1s.

   -v, --version
       Show version information and exit.

   -h, --help
       Show user help and exit.

USAGE EXAMPLE
   flowtop
       Default ncurses output for flowtop that tracks IPv4, IPv6 flows for TCP.

   flowtop -46UTDISs
       This example enables the maximum display options for flowtop.

CONFIG FILES
       Files under /etc/netsniff-ng/ can be modified to extend flowtop's service resolution and lookup information.

           * tcp.conf - TCP port/services map
           * udp.conf - UDP port/services map
           * geoip.conf - GeoIP database mirrors

BUGS
       With a fairly high rate of connection tracking updates, flowtop can become unresponsive for short periods  of  time  while  scrolling.  The
       right  fix  would  be to replace flowtop's connection management backend with a better design with respect to the locking approach. This is
       still on the "todo" list.

LEGAL
       flowtop is licensed under the GNU GPL version 2.0.

HISTORY
       flowtop was originally written for the netsniff-ng toolkit by Daniel Borkmann. It is currently maintained by Tobias Klauser  <tklauser@dis‐
       tanz.ch> and Daniel Borkmann <dborkma@tik.ee.ethz.ch>.

SEE ALSO
       netsniff-ng(8),  trafgen(8),  mausezahn(8),  ifpps(8),  bpfc(8),  astraceroute(8),  curvetun(8),  iptables(8),  sysctl(8),  sysctl.conf(8),
       sysctl.d(8)

AUTHOR
       Manpage was written by Daniel Borkmann.

COLOPHON
       This page is part of the Linux netsniff-ng toolkit project. A description of the project, and information  about  reporting  bugs,  can  be
       found at http://netsniff-ng.org/.

Linux                                                              03 March 2013                                                        FLOWTOP(8)
