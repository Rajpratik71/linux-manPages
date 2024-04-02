DNSRECON(1)                                               dnsrecon - DNS Enumeration Tool                                              DNSRECON(1)

NAME
       dnsrecon - DNS Enumueration and Scanning Tool

SYNOPSIS
       dnsrecon <options>

OPTION
          -h, --help
          Show help message and exit

          -d, --domain      <domain>
          Domain to Target for enumeration.

          -r, --range       <range>
          IP Range for reverse look-up brute force in formats (first-last)
          or in (range/bitmask).

          -n, --name_server <name>
          Domain server to use, if none is given the SOA of the
          target will be used

          -D, --dictionary  <file>
          Dictionary file of sub-domain and hostnames to use for
          brute force.

          -f     Filter out of Brute Force Domain lookup records that resolve
                 to the wildcard defined IP Address when saving records.

          -t, --type        <types>

          Specify the type of enumeration to perform:
                 std      To Enumerate general record types, enumerates.
                          SOA, NS, A, AAAA, MX and SRV if AXRF on the
                          NS Servers fail.
                 rvl      To Reverse Look Up a given CIDR IP range.

                 brt      To Brute force Domains and Hosts using a given
                          dictionary.

                 srv      To Enumerate common SRV Records for a given
                          domain.

                 axfr     Test all NS Servers in a domain for misconfigured
                             zone transfers.

                 goo      Perform Google search for sub-domains and hosts.

                 snoop    To Perform a Cache Snooping against all NS
                          servers for a given domain, testing all with
                          file containing the domains, file given with -D
                          option.

                 tld      Will remove the TLD of given domain and test against
                          all TLD's registered in IANA

          zonewalk Will perform a DNSSEC Zone Walk using NSEC Records.
            -a          Perform AXFR with the standard enumeration.

            -s          Perform Reverse Look-up of ipv4 ranges in the
                        SPF Record of the targeted domain with the
                        standard enumeration.

            -g          Perform Google enumeration with the standard
                        enumeration.

            -w          Do deep whois record analysis and
                        reverse look-up of IP ranges found thru whois
                        when doing standard query.

            -z          Performs a DNSSEC Zone Walk with the standard
                        enumeration.

            --threads    <number>
                        Number of threads to use in Range Reverse Look-up,
                        Forward Look-up Brute force
                        and SRV Record Enumeration

            --lifetime  <number>
                        Time to wait for a server to response to a query.

            --db        <file>   SQLite 3 file to save found records.

            --xml       <file>   XML File to save found records.

            -c, --csv   <file>   Comma separated value file.

            -v          Show attempts in the bruteforce modes.

DESCRIPTION
       I  wrote  this  tool  back  in late 2006 and it has been my favorite tool for enumeration thru DNS, in great part because I wrote it and it
       gives the output in a way that I can manipulate it in my own style.  One of the features that I used the most and gave me excellent results
       is the SRV record enumeration.

       The script will perform the following:
         Standard  Record  Enumeration  for  a  given  domain  (A, NS, SOA and MX).  Top Leven Domain Expansion for a given domain.  Zone Transfer
         against all NS records of a given domain.  Reverse Lookup against a given IP Range given a start and end IP.

       SRV Record enumeration, enumerating:
                 _gc._tcp.
                 _kerberos._tcp.
                 _kerberos._udp.
                 _ldap._tcp.
                 _test._tcp.
                 _sips._tcp.
                 _sip._udp.
                 _sip._tcp.
                 _aix._tcp.
                 _aix._tcp.
                 _finger._tcp.
                 _ftp._tcp.
                 _http._tcp.
                 _nntp._tcp.
                 _telnet._tcp.
                 _whois._tcp.
                 _h323cs._tcp.
                 _h323cs._udp.
                 _h323be._tcp.
                 _h323be._udp.
                 _h323ls._tcp.
                 _h323ls._udp.

       Brute force hostnames and subdomains of a given target domain using a wordlist.

AUTHOR
       Carlos Perez, Carlos_Perez@darkoperator.com

COPYRIGHT
       Copyright (C) 2012 Carlos Perez

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as  published  by
       the Free Software Foundation; Applies version 2 of the License.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free  Software  Foundation,
       Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

0.8.1                                                             March 23, 2013                                                       DNSRECON(1)
