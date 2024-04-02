DNSWALK(1)                                                    General Commands Manual                                                   DNSWALK(1)

NAME
       dnswalk - A DNS database debugger

SYNOPSIS
       dnswalk [ -adilrfFm ] domain.

DESCRIPTION
       dnswalk  is a DNS debugger.  It performs zone transfers of specified domains, and checks the database in numerous ways for internal consis‐
       tency, as well as for correctness according to accepted practices with the Domain Name System.

       The domain name specified on the command line MUST end with a '.'.  You can specify a forward domain, such as  dnswalk  podunk.edu.   or  a
       reverse domain, such as dnswalk 3.2.1.in-addr.arpa.

OPTIONS
       -r     Recursively descend sub-domains of the specified domain.  Use with care.
       -a     Turn on warning of duplicate A records.  (see below)
       -d     Print debugging and 'status' information to stderr.  (Use only if redirecting stdout)  See DIAGNOSTICS section.
       -m     Perform checks only if the zone has been modified since the previous run.
       -F     perform  "fascist"  checking.   When checking an A record, compare the PTR name for each IP address with the forward name and report
              mismatches.  (see below)  I recommend you try this option at least once to see what sorts of errors pop  up  -  you  might  be  sur‐
              prised!.
       -i     Suppress check for invalid characters in a domain name.  (see below)
       -l     Perform  "lame  delegation"  checking.   For  every  NS  record, check to see that the listed host is indeed returning authoritative
              answers for this domain.
       ERRORS
              The following the list of error messages that dnswalk will return if it sees a potential problem with the database.  Duplicate  mes‐
              sages will be suppressed automatically for each zone.  Error messages are prefixed by a keyword indiciating the message type: "WARN"
              (possible data problem), "FAIL" (failure to access data), or "BAD" (invalid data).  dnswalk exits with a return code  equal  to  the
              number of "BAD" errors.
       X PTR Y: unknown host
              X  is  a  PTR record to Y, but Y is not a valid host (no A record).  These are often left over from when someone deleted a host from
              the DNS and forgot to delete the PTR record.
       X PTR Y: A record not found
              X is a PTR record to Y, but the IP address associated with the PTR record is not listed as an address for Y.  There should be  an  A
              record for every valid IP address for a host.  Many Internet services will not talk to you if you have mismatched PTR records.
       X PTR Y: CNAME (to Z)
              X is a PTR record to Y, but Y is a CNAME to Z.  PTR records MUST point to the canonical name of a host, not an alias.
       X CNAME Y: unknown host
              X is aliased to Y, but Y is not a valid host (no A record).
       X CNAME Y: CNAME (to Z)
              X is aliased to Y, but Y is aliased to Z.  CNAMEs should not be chained.
       X MX Y: unknown host
              X is an MX to Y, but Y is not a valid host (no A record).
       X MX Y: CNAME (to Z)
              X is an MX to Y, but Y is an alias for Z.  MX records must point to the canonical name, not an alias.
       X A Y: no PTR record
              X  has  an  IP  address  Y, but there is no PTR record to map the IP address Y back to a hostname (usually X). Many Internet servers
              (such as anonymous FTP servers) will not talk to addresses that don't have PTR records.
       warning: X has only one authoritative nameserver
              Zones must have at least one authoritative nameserver, in case one is down or unreachable.  Make sure the parent and  child  domains
              list all authoritative nameservers for a zone.
       Cannot check X: no available nameservers!
              The   X   zone   was  delegated with NS records but all the nameservers for the zone are either unavailable or say that they have no
              data for the zone (are lame).  Verify that  the X zone isn't a typo, and if so make sure that all the listed nameservers are config‐
              ured to answer with data for the zone.
       X: invalid character(s) in name
              Allowable characters in a domain name are the ASCII letters a through Z the digits 0 through 9, and the "-" character.  A "." may be
              used only as a domain separator.  (checking can be suppressed with -i )
       X: domain occurred twice, forgot trailing '.'?
              A sanity check which looks for "dom.ain.dom.ain." in a name.  This is often caused by forgetting to put a trailing '.' on the end of
              a name.
       (with -a switch)
       X: possible duplicate A record (glue of Z?)
              A  duplicate  A records is listed for X.  NOTE: this is most often caused by the practice of always putting A records for all secon‐
              daries after NS glue records.  While this is not an error, it is usually redundant and makes changing IP addresses later more diffi‐
              cult,  since  they  occur  more than one time in the file (and in multiple files).  You may get spurious errors, mostly because of a
              quirk in BIND releases before 4.9.x that reports cached glue A records in a zone transfer even though they don't exist in the origi‐
              nal zone file.
       (with -F switch)
       X A Y: points to Z
              X has Y for an IP address, but the PTR record associated with Y returns "Z" as the name associated with that host.  This is not nec‐
              essarily an error (for example if you have an A record for your domain name), but can be useful to check for A records  which  point
              to the wrong host, or PTR records that point to the wrong host.
       Cannot find address for nameserver X
              This  error  is generated if the address for a delegated nameserver X cannot be resolved.  This could be a lame delegation (due to a
              typo in delegation), or a temporary DNS error.
       (with -l switch)
       X NS Y: lame NS delegation
              Y is a listed nameserver for zone X, but Y is not returning authoritative data for zone X.  This is usually the result of a lack  of
              communication  on the part of the respective hostmasters.  Lame delegations are not fatal problems except in severe cases, they just
              tend to create significant increases in DNS traffic.  NS records for the parent and child domains should  be  consistent,  and  each
              server listed in the NS record MUST be able to answer with authoritative data, either by being a primary or secondary for the zone.
       Cannot get SOA record for X from Y (lame?)
              This  error  is generated if dnswalk cannot get the SOA record for zone X from the nameserver Y.  This could mean a lame delegation,
              or simply that the host is temporarily unreachable.
SEE ALSO
       RFC 1034 - "DOMAIN NAMES - CONCEPTS AND FACILITIES"
       RFC 1035 - "DOMAIN NAMES - IMPLEMENTATION AND SPECIFICATION"
       RFC 1123 - "Requirements for Internet Hosts -- Application and Support"
       Paul Albitz, Cricket Liu: "DNS and BIND" O'Reilly & Associates.
DIAGNOSTICS
       When invoked with the -d option, dnswalk will print status information to stderr.  It consists of information  about  what  zone  is  being
       checked, and a single letter corresponding to the resource record checked, and any errors.
       a      A record
       c      CNAME record
       p      PTR record
       m      MX record
       s      SOA record
       !      An error occurred
       .      A previous error in the zone was repeated, but suppressed.
BUGS
       dnswalk will make the directory tree before it has a chance to find out that you gave it a bogus domain name.
       When checking lots of hosts and lots of options, it is very slow.  Running dnswalk on a machine with a local nameserver helps considerably.
       Perl's  gethostby{name,addr}()  routine  doesn't  seem  to consistently return an error whenever it is unable to resolve an address.  Argh.
       This will mean lots of "no PTR record" and "host unknown" errors if a server is unavailable, or for some reason the lookup fails.  You  may
       get strange error messages if your perl was compiled without support for herror().
AUTHOR
       David Barr <barr@cis.ohio-state.edu>

                                                                                                                                        DNSWALK(1)
