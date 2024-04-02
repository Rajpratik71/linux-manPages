dnstrace(1)                                                   General Commands Manual                                                  dnstrace(1)

NAME
       dnstrace - dns lookup tool

SYNOPSIS
       dnstrace t fqdn r

DESCRIPTION
       dnstrace  searches  for  all  DNS servers that can affect the resolution of records of type t under the domain name fqdn, starting from the
       root server r.  You can list more than one root server.

       dnstrace uses the standard DNS resolution algorithm, but follows all possible paths in the algorithm.  It prints all responses it  receives
       from  DNS  servers;  it  also  prints warnings about slow servers, dead servers, misdelegated (``lame'') servers, and misformatted packets.
       dnstrace is similar in spirit to DOC and dnswalk but is much more effective than those tools at debugging resolution problems.

       In versions 1.03 and above: You can pipe dnstrace through dnstracesort(1) for human-friendly output.  dnstrace can take a long time to run,
       so standard procedure is to save its output in a file:

         dnstrace any www.aol.com a.root-servers.net > AOL &

       Then you can run dnstracesort(1) to see the results so far:

         dnstracesort < AOL | less

       The dnstracesort(1) output uses ul codes for boldface and underline; these codes are displayed properly by less(1).

       Beware that, as of January 2001, dnstrace produces more than 5 megabytes of output for the complete trace of cr.yp.to starting from all the
       root servers.  It ends up sending more than 6000 queries to more than 200 different servers.

SEE ALSO
       dnsip(1), dnsipq(1), dnsmx(1), dnstxt(1), dnsqr(1), dnsq(1), dnsname(1), less(1), tinydns-get(1)

       http://cr.yp.to/djbdns.html

                                                                                                                                       dnstrace(1)
