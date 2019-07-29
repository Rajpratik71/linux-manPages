tinydns-data(8)                                               System Manager's Manual                                              tinydns-data(8)

NAME
       tinydns-data - data tool for tinydns

DESCRIPTION
       This is a reference page.  For tutorial information, see the instructions for
       running a DNS server (http://cr.yp.to/djbdns/run-server.html).

       tinydns-data  reads local DNS information from a file named data in the current directory.  It creates data.cdb in a binary format designed
       for fast access by tinydns(8).  It may also create some other files with names beginning with data.

       tinydns-data updates data.cdb atomically, so you can use it safely while tinydns(8) is running.  If anything goes wrong with  the  creation
       of data.cdb, tinydns-data stops and leaves the old data.cdb in place.

Data format
       The DNS information in data is a series of lines.  There are several types of lines, as shown below.

       Each  line starts with a special character and continues with a series of colon-separated fields.  In some cases the fields may be omitted;
       however, all colons must be included except at the end of the line.  Spaces and tabs at the end of a line are  ignored.   Blank  lines  are
       ignored.

       Each  line contains a ttl (``time to live'') specifying the number of seconds that the line's DNS records may be cached.  Beware that cache
       times below 300 seconds will be treated as 300 by some clients, and NS cache times below 2 seconds can cause lookup failures.  You may omit
       ttl; tinydns-data will use default cache times, carefully selected to work well in normal situations.

       You  may  include  a  timestamp  on each line.  If ttl is nonzero (or omitted), the timestamp is a starting time for the information in the
       line; the line will be ignored before that time.  If ttl is zero, the timestamp is an ending time (``time to die'') for the information  in
       the  line;  tinydns(8)  dynamically  adjusts  ttl so that the line's DNS records are not cached for more than a few seconds past the ending
       time.  A timestamp is an external TAI64 timestamp, printed as 16 lowercase hexadecimal characters.  For example, the lines

       +www.heaven.af.mil:1.2.3.4:0:4000000038af1379 +www.heaven.af.mil:1.2.3.7::4000000038af1379

       specify that www.heaven.af.mil will have address 1.2.3.4 until time 4000000038af1379 (2000-02-19 22:04:31 UTC) and will then switch  to  IP
       address 1.2.3.7.

       For  versions  1.04  and  above:  You  may  include a client location on each line.  The line is ignored for clients outside that location.
       Client locations are specified by % lines:

       %lo:ipprefix

       means that IP addresses starting with ipprefix are in location lo.  lo is a sequence of one or two ASCII letters.  A client is in only  one
       location; longer prefixes override shorter prefixes.  For example,

         %in:192.168
         %ex
         +jupiter.heaven.af.mil:192.168.1.2:::in
         +jupiter.heaven.af.mil:1.2.3.4:::ex

       specifies that jupiter.heaven.af.mil has address 192.168.1.2 for clients in the 192.168.*  network and address 1.2.3.4 for everyone else.

Common data lines
       .fqdn:ip:x:ttl:timestamp:lo

       Name server for our domain fqdn.

       tinydns-data creates

              an NS (``name server'') record showing x.ns.fqdn as a name server for fqdn;

              an A (``address'') record showing ip as the IP address of x.ns.fqdn; and

              an  SOA  (``start  of  authority'')  record for fqdn listing x.ns.fqdn as the primary name server and hostmaster@fqdn as the contact
              address.

       You may have several name servers for one domain, with a different x for each server.

       tinydns(8) will return only one SOA record per domain.

       If x contains a dot then tinydns-data will use x as the server name rather than x.ns.fqdn.  This feature is provided only for compatibility
       reasons; names not ending with fqdn will force clients to contact parent servers much more often than they otherwise would, and will reduce
       the overall reliability of DNS.  You should omit ip if x has IP addresses assigned elsewhere in data; in this case, tinydns-data will  omit
       the A record.

       Examples:

         .panic.mil:1.8.7.55:a

       creates  an  NS  record  showing  a.ns.panic.mil  as  a  name  server  for  panic.mil,  an  A  record showing 1.8.7.55 as the IP address of
       a.ns.panic.mil, and an SOA record for panic.mil.

         .panic.mil:1.8.7.56:dns2.panic.mil

       creates an NS record showing dns2.panic.mil as a  name  server  for  panic.mil,  an  A  record  showing  1.8.7.56  as  the  IP  address  of
       dns2.panic.mil, and an SOA record for panic.mil.

         .panic.mil::a.ns.heaven.af.mil

       creates an NS record showing a.ns.heaven.af.mil as a name server for panic.mil, and an SOA record for panic.mil.

       &fqdn:ip:x:ttl:timestamp:lo

       Name server for domain fqdn.

       tinydns-data creates

              an NS record showing x.ns.fqdn as a name server for fqdn and

              an A record showing ip as the IP address of x.ns.fqdn.

       If x contains a dot then it is treated specially; see above.

       You may have several name servers for one domain, with a different x for each server.

       Normally & is used for domains delegated by this server to child servers, while .  is used for domains delegated to this server.

       Examples:

         &serious.panic.mil:1.8.248.6:a

       creates  an  NS  record  showing a.ns.serious.panic.mil as a name server for serious.panic.mil, and an A record showing 1.8.248.6 as the IP
       address of a.ns.serious.panic.mil.

         &serious.panic.mil:1.8.248.7:ns7.panic.mil

       creates an NS record showing ns7.panic.mil as a name server for serious.panic.mil, and an A record showing 1.8.248.7 as the IP  address  of
       ns7.panic.mil.

       =fqdn:ip:ttl:timestamp:lo

       Host fqdn with IP address ip.

       tinydns-data creates

              an A record showing ip as the IP address of fqdn and

              a PTR (``pointer'') record showing fqdn as the name of d.c.b.a.in-addr.arpa if ip is a.b.c.d.

       Remember  to  specify  name servers for some suffix of fqdn; otherwise tinydns(8) will not respond to queries about fqdn.  The same comment
       applies to other records described below.  Similarly, remember to specify name servers for some suffix  of  d.c.b.a.in-addr.arpa,  if  that
       domain has been delegated to you.

       Example:

         =button.panic.mil:1.8.7.108

       creates  an  A  record  showing  1.8.7.108  as the IP address of button.panic.mil, and a PTR record showing button.panic.mil as the name of
       108.7.8.1.in-addr.arpa.

       +fqdn:ip:ttl:timestamp:lo

       Alias fqdn with IP address ip.  This is just like =fqdn:ip:ttl except that tinydns-data does not create the PTR record.

       For versions 1.04 and above: tinydns(8) returns addresses (from + or = or @ or .  or & lines) in a random order in the answer section.   If
       there are more than 8 records, it returns a random set of 8.

       Example:

         +button.panic.mil:1.8.7.109

       creates an A record showing 1.8.7.109 as another IP address for button.panic.mil.

       @fqdn:ip:x:dist:ttl:timestamp:lo

       Mail exchanger for fqdn.

       tinydns-data creates

              an MX (``mail exchanger'') record showing x.mx.fqdn as a mail exchanger for fqdn at distance dist and

              an A record showing ip as the IP address of x.mx.fqdn.

       You may omit dist; the default distance is 0.

       If x contains a dot then it is treated specially; see above.

       You  may  create  several  MX  records  for  fqdn, with a different x for each server.  Make sure to arrange for the SMTP server on each IP
       address to accept mail for fqdn.

       Example:

         @panic.mil:1.8.7.88:mail.panic.mil

       creates an MX record showing mail.panic.mil as a mail exchanger for panic.mil at distance 0, and an A record showing  1.8.7.88  as  the  IP
       address of mail.panic.mil.

       #comment

       Comment line. The line is ignored.

Uncommon data lines
       -fqdn:s:ttl:timestamp:lo

       For versions 1.04 and above: This type of line is used by programs that automatically edit + lines in data to temporarily exclude addresses
       of overloaded or dead machines.  The line is ignored.

       'fqdn:s:ttl:timestamp:lo

       TXT (``text'') record for fqdn.  tinydns-data creates a TXT record for fqdn containing the string s.  You  may  use  octal   nnn  codes  to
       include arbitrary bytes inside s; for example,  072 is a colon.

       ^fqdn:p:ttl:timestamp:lo

       PTR record for fqdn.  tinydns-data creates a PTR record for fqdn pointing to the domain name p.

       Cfqdn:p:ttl:timestamp:lo

       CNAME (``canonical name'') record for fqdn.  tinydns-data creates a CNAME record for fqdn pointing to the domain name p.

       Don't  use Cfqdn if there are any other records for fqdn Don't use Cfqdn for common aliases; use +fqdn instead.  Remember the wise words of
       Inigo Montoya: ``You keep using CNAME records.  I do not think they mean what you think they mean.''

       Zfqdn:mname:rname:ser:ref:ret:exp:min:ttl:timestamp:lo

       SOA record for fqdn showing mname as the primary name server, rname (with the first .  converted to @) as the contact address, ser  as  the
       serial  number,  ref  as the refresh time, ret as the retry time, exp as the expire time, and min as the minimum time.  ser, ref, ret, exp,
       and min may be omitted; they default to, respectively, the modification time of the data file, 16384 seconds, 2048  seconds,  1048576  sec‐
       onds, and 2560 seconds.

       :fqdn:n:rdata:ttl:timestamp:lo

       Generic  record  for  fqdn.   tinydns-data creates a record of type n for fqdn showing rdata.  n must be an integer between 1 and 65535; it
       must not be 2 (NS), 5 (CNAME), 6 (SOA), 12 (PTR), 15 (MX), or 252 (AXFR).  The proper format of rdata depends on n.  You may use octal  nnn
       codes to include arbitrary bytes inside rdata.

Wildcards
       tinydns supports wildcards of the form *.fqdn.  Information for *.fqdn is provided for every name ending with .fqdn, except names that have
       their own records and names that are covered by more specific wildcards.

       For example, the lines

         +pink.floyd.u.heaven.af.mil:1.2.3.4
         +*.u.heaven.af.mil:1.2.3.200

       have the same effect as

         +pink.floyd.u.heaven.af.mil:1.2.3.4
         +joe.u.heaven.af.mil:1.2.3.200
         +bill.u.heaven.af.mil:1.2.3.200
         +floyd.u.heaven.af.mil:1.2.3.200
         +ishtar.u.heaven.af.mil:1.2.3.200
         +joe.bob.u.heaven.af.mil:1.2.3.200
         +sally.floyd.u.heaven.af.mil:1.2.3.200
         +post.pink.floyd.u.heaven.af.mil:1.2.3.200

       and so on.

       As another example, the lines

         +pink.floyd.u.heaven.af.mil:1.2.3.4
         @*.u.heaven.af.mil::mail.heaven.af.mil

       have the same effect as

         +pink.floyd.u.heaven.af.mil:1.2.3.4
         @joe.u.heaven.af.mil::mail.heaven.af.mil
         @bill.u.heaven.af.mil::mail.heaven.af.mil
         @floyd.u.heaven.af.mil::mail.heaven.af.mil
         @ishtar.u.heaven.af.mil::mail.heaven.af.mil
         @joe.bob.u.heaven.af.mil::mail.heaven.af.mil
         @sally.floyd.u.heaven.af.mil::mail.heaven.af.mil
         @post.pink.floyd.u.heaven.af.mil::mail.heaven.af.mil

       and so on.  Notice that the wildcard does not apply to pink.floyd.u.heaven.af.mil, because that name has its own records.

A typical data file:
         =lion.heaven.af.mil:1.2.3.4
         @heaven.af.mil:1.2.3.4
         @3.2.1.in-addr.arpa:1.2.3.4

         =tiger.heaven.af.mil:1.2.3.5
         .heaven.af.mil:1.2.3.5:a
         .3.2.1.in-addr.arpa:1.2.3.5:a

         =bear.heaven.af.mil:1.2.3.6
         .heaven.af.mil:1.2.3.6:b
         .3.2.1.in-addr.arpa:1.2.3.6:b

         =cheetah.heaven.af.mil:1.2.3.248
         =panther.heaven.af.mil:1.2.3.249

       Here is the same information in BIND zone-file format with the two zones merged:

         heaven.af.mil. 2560 IN SOA a.ns.heaven.af.mil. hostmaster.heaven.af.mil. ...
         heaven.af.mil. 259200 IN NS a.ns.heaven.af.mil.
         heaven.af.mil. 259200 IN NS b.ns.heaven.af.mil.
         heaven.af.mil. 86400 IN MX mx.heaven.af.mil.

         3.2.1.in-addr.arpa. 2560 IN SOA a.ns.3.2.1.in-addr.arpa. hostmaster.3.2.1.in-addr.arpa. ...
         3.2.1.in-addr.arpa. 259200 IN NS a.ns.3.2.1.in-addr.arpa.
         3.2.1.in-addr.arpa. 259200 IN NS b.ns.3.2.1.in-addr.arpa.
         3.2.1.in-addr.arpa. 86400 IN MX mx.3.2.1.in-addr.arpa.

         4.3.2.1.in-addr.arpa. 86400 IN PTR lion.heaven.af.mil.
         lion.heaven.af.mil. 86400 IN A 1.2.3.4
         mx.heaven.af.mil. 86400 IN A 1.2.3.4
         mx.3.2.1.in-addr.arpa. 86400 IN A 1.2.3.4

         5.3.2.1.in-addr.arpa. 86400 IN PTR tiger.heaven.af.mil.
         tiger.heaven.af.mil. 86400 IN A 1.2.3.5
         a.ns.heaven.af.mil. 259200 IN A 1.2.3.5
         a.ns.3.2.1.in-addr.arpa. 259200 IN A 1.2.3.5

         6.3.2.1.in-addr.arpa. 86400 IN PTR bear.heaven.af.mil.
         bear.heaven.af.mil. 86400 IN A 1.2.3.6
         b.ns.heaven.af.mil. 259200 IN A 1.2.3.6
         b.ns.3.2.1.in-addr.arpa. 259200 IN A 1.2.3.6

         248.3.2.1.in-addr.arpa. 86400 IN PTR cheetah.heaven.af.mil.
         cheetah.heaven.af.mil. 86400 IN A 1.2.3.248

         249.3.2.1.in-addr.arpa. 86400 IN PTR panther.heaven.af.mil.
         panther.heaven.af.mil. 86400 IN A 1.2.3.249

Design notes
       The data format is very easy for programs to edit, and reasonably easy for humans to edit, unlike the traditional zone-file format.

       tinydns-data could support a name wherever an IP address is required; it would look up the name in DNS and use the resulting address.  This
       would reliably track changes in offsite IP addresses if the database were rebuilt periodically.

SEE ALSO
       tinydns(8)

       http://cr.yp.to/djbdns.html

                                                                                                                                   tinydns-data(8)
