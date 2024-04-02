dnscache(8)                                                   System Manager's Manual                                                  dnscache(8)

NAME
       dnscache - a DNS cache.

DESCRIPTION
       This is a reference page.  For tutorial information, see the instructions for
       workstations (http://cr.yp.to/djbdns/run-cache.html),
       home computers (http://cr.yp.to/djbdns/run-cache-home.html),
       external caches (http://cr.yp.to/djbdns/run-cache-x.html), or
       upgrading from BIND (http://cr.yp.to/djbdns/run-cache-bind-1.html).

       dnscache accepts recursive DNS queries from local clients such as web browsers and mail transfer agents.  It collects responses from remote
       DNS servers.  It caches the responses to save time later.

Configuration
       Normally dnscache is set up by the dnscache-conf(8) program.

       dnscache runs chrooted in the directory specified by the $ROOT environment variable, under the uid and gid specified by the $UID  and  $GID
       environment variables.

       dnscache  listens for incoming UDP packets and TCP connections addressed to port 53 of $IP.  Typically $IP is 127.0.0.1, but it can also be
       an externally accessible IP address.

       dnscache accepts a packet or connection from IP address 1.2.3.4 if it sees a file named ip/1.2.3.4 or ip/1.2.3 or ip/1.2 or ip/1.

       dnscache sends outgoing packets from high ports of $IPSEND.  Typically $IPSEND is 0.0.0.0, meaning the machine's primary IP address.

       dnscache reads a seed, up to 128 bytes, from standard input, and passes the seed to dns_random_init.

       dnscache reads a list of dotted-decimal root server IP addresses, one address per line, from servers/@.  It also scans the  servers  direc‐
       tory for server IP addresses for other domains.  If there are addresses listed in servers/moon.af.mil, for example, then dnscache will send
       queries for anything.moon.af.mil to those addresses, and will not cache records for anything.moon.af.mil from outside servers such  as  the
       root servers.

       Versions  1.03  and  above: If $FORWARDONLY is set, dnscache treats servers/@ as a list of IP addresses for other caches, not root servers.
       It forwards queries to those caches the same way that a client does, rather than contacting a chain of servers according to NS records.

Memory use
       dnscache uses a fixed-size table, under 256K, to keep track of as many as 200 simultaneous UDP queries and 20 simultaneous TCP connections.
       It also dynamically allocates memory, usually just a few bytes but occasionally much more, for each active query.  If it runs out of memory
       handling a query, it discards that query.

       dnscache asks the operating system to reserve a 128K buffer for bursts of incoming UDP queries.  In versions 1.03 and above, if a  new  UDP
       query  arrives  when  dnscache  is already handling 200 simultaneous UDP queries, dnscache drops the oldest query.  If a new TCP connection
       arrives when dnscache is already handling 20 simultaneous TCP connections, dnscache drops the oldest connection.

       dnscache uses a fixed-size cache, as controlled by the $CACHESIZE environment variable.  Roughly 5% of the cache is used for a hash  table.
       The rest is used for cache entries (including 8-byte Y2038-compliant expiration times):

       o      A sets.  22 bytes plus 4 bytes per address plus the length of the owner name.

       o      NS sets or PTR sets or CNAME sets.  22 bytes plus the length of the owner name and all the data names.

       o      MX sets.  22 bytes plus 2 bytes per MX plus the length of all the names.

       o      Other record sets.  22 bytes plus 2 bytes per record plus the length of all the data strings plus the length of the owner name.

       o      Nonexistent domain or server failure.  22 bytes plus the length of the owner name.

       Sets larger than 8192 bytes are not cached.

       dnscache does not exit when it runs out of space in its cache; it simply removes the oldest entries to make more space.

Resolution and caching policies
       dnscache  relies  on  a configured list of root name servers.  In contrast, BIND starts from a ``hint file'' listing name servers, and asks
       those name servers where the root name servers are.

       dnscache does not cache (or pass along) records outside the server's bailiwick; those records could be poisoned.  Records for foo.dom,  for
       example, are accepted only from the root servers, the dom servers, and the foo.dom servers.

       dnscache  does  not bypass its cache to obtain glue from the additional section of a response.  In particular, it will not use glue outside
       the server's bailiwick, or glue with TTL 0, or glue that violates other caching policies.

       dnscache caches records for at most a week.  It interprets TTLs above 2147483647 as 0.

       dnscache does not cache SOA records.  However, it does use SOA TTLs to determine cache times (up to an hour) for zero-record responses  and
       nonexistent domains.

Responses to DNS clients
       dnscache's  responses  are  generally  much smaller than BIND's responses.  They do not include authority records (NS records of the source
       name servers and SOA records for negative answers) or additional records (A records relevant to NS or MX records).  When the answer section
       is truncated by UDP length limits, it is eliminated entirely.

       dnscache  tries to prevent local users from snooping on other local users.  It discards non-recursive queries; it discards inverse queries;
       and it discards zone-transfer requests.  If $HIDETTL is set, dnscache always uses a TTL of 0 in its responses.  In  versions  before  1.03,
       dnscache always uses a TTL of 0 in its responses.

       According to RFC 1035, the AA bit ``specifies that the responding name server is an authority for the domain name in question section.''

       dnscache is not an authority for any domain names.

       dnscache  never  sets the AA bit (except in NXDOMAIN responses, as required by RFC 2308, to work around a common client bug).  In contrast,
       BIND often sets AA for positive responses even when it is not an authority for the domain name.  (This appears to have been fixed  in  BIND
       9.)

Repeated IP addresses
       If  a server sends dnscache a repeated IP address, dnscache passes the repeated IP address along to the client.  The server's behavior vio‐
       lates RFC 2181, section 5.5, but there are reasonable uses of repeated IP addresses for load balancing, so dnscache does not go out of  its
       way to remove repetitions when they occur.

       A widespread BIND server bug (apparently fixed in BIND 9.1) can unintentionally produce repeated IP addresses.  Here is an example from one
       of the BIND company's servers (now fixed):

         % dnsq a ns-ext.vix.com ns-ext.vix.com
         1 ns-ext.vix.com:
         117 bytes, 1+1+2+2 records, response, authoritative, noerror
         query: 1 ns-ext.vix.com
         answer: ns-ext.vix.com 3600 A 204.152.184.64
         authority: vix.com 3600 NS ns-ext.vix.com
         authority: vix.com 3600 NS ns1.gnac.com
         additional: ns-ext.vix.com 3600 A 204.152.184.64
         additional: ns1.gnac.com 130768 A 209.182.195.77

       This BIND bug is the most common reason for users to see repeated IP addresses from dnscache.

Special names
       dnscache handles localhost internally, giving it an A record of 127.0.0.1.

       dnscache handles 1.0.0.127.in-addr.arpa internally, giving it a PTR record of localhost.

       dnscache handles dotted-decimal domain names internally, giving (e.g.) the domain name 192.48.96.2 an A record of 192.48.96.2.

SEE ALSO
       dnscache-conf(8)

       http://cr.yp.to/djbdns.html

                                                                                                                                       dnscache(8)
