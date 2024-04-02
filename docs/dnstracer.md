DNSTRACER(8)                                                  General Commands Manual                                                 DNSTRACER(8)

NAME
       dnstracer - trace a chain of DNS servers to the source

SYNOPSIS
       dnstracer [options] name

DESCRIPTION
       dnstracer determines where a given Domain Name Server (DNS) gets its information from, and follows the chain of DNS servers back to the
       servers which know the data.

       Options are:

       -c      Disable local caching.

       -C      Enable negative caching.

       -o      Enable overview of received answers at the end.

       -q queryclass
               Change the query-class, default is A. You can either specify a number of the type (if you're brave) or one of the following
               strings: a, aaaa, a6, soa, cname, hinfo, mx, ns, txt and ptr.

       -r retries
               Number of retries for DNS requests, default 3.

       -s server
               DNS server to use for the initial request, default is acquired from the system. If a dot is specified (.), A.ROOT-SERVERS.NET will
               be used.

       -v      Be verbose on what sent or received.

       -4      Use only IPv4 servers, don't query IPv6 servers (only available when IPv6 support hasn't been disabled)

       -S sourceaddress
               Use this as source-address for the outgoing packets.

HOW IT WORKS
       It sends the specified name-server a non-recursive request for the name.

       Non-recursive means: if the name-server knows it, it will return the data requested. If the name-server doesn't know it, it will return
       pointers to name-servers that are authoritative for the domain part in the name or it will return the addresses of the root name-servers.

       If the name server does returns an authoritative answer for the name, the next server is queried. If it returns an non-authoritative answer
       for the name, the name servers in the authority records will be queried.

       The program stops if all name-servers are queried.

       Make sure the server you're querying doesn't do forwarding towards other servers, as dnstracer is not able to detect this for you.

       It detects so called lame servers, which are name-servers which has been told to have information about a certain domain, but don't have
       this information.

EXAMPLES
       Search for the A record of www.mavetju.org on your local nameserver:

       dnstracer www.mavetju.org

       Search for the MX record of mavetju.org on the root-nameservers:

       dnstracer "-s" . "-q" mx mavetju.org

       Search for the PTR record (hostname) of 212.204.230.141:

       dnstracer "-q" ptr 141.230.204.212.in-addr.arpa

       And for IPv6 addresses:

       dnstracer "-q" ptr "-s" . "-o" 2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.4.0.2.0.0.0.0.8.b.0.e.f.f.3.ip6.int

SEE ALSO
       ntptrace(8), traceroute(8), dig(1)

AUTHOR
       Edwin Groothuis, edwin@mavetju.org (http://www.mavetju.org)

       See http://www.mavetju.org/contacts.php for mailing-lists.

February 10, 2008                                                February 10, 2008                                                    DNSTRACER(8)
