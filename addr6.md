ADDR6(1)                                                      General Commands Manual                                                     ADDR6(1)

NAME
       addr6 - An IPv6 address analysis and manipulation tool

SYNOPSIS
       addr6  [-a  IPV6_ADDR -i]  [-d]  [-d]  [-q] [-s] [-j PREFIX] [-b TYPE] [-k SCOPE] [-w UNICAST_TYPE] [-g IID_TYPE] [-J PREFIX] [-B TYPE] [-K
       SCOPE] [-W UNICAST_TYPE] [-G IID_TYPE] [-v] [-h]

DESCRIPTION
       addr6 is an IPv6 address analysis tool tool. It can employed identify the address type/scope, and infer the type of Interface  ID  employed
       by an IPv6 address. Additionally, addr6 can also produce statistics about a set of IPv6 addresses.

       addr6  can filter lists of IPv6 addresses based on a number of criteria (address type, address scope, prefixes, duplicate addresses, etc.).
       There are two types of filters: "block filters" and "accept filters". If any "block filter" is specified, and IPv6 addresses  matching  any
       of  those  filters  will  be  discarded.  If  any "accept filter" is specified, any IPv6 address matching that filter will be accepted (and
       printed on stdout).

OPTIONS
       addr6 takes its parameters as command-line options. Each of the options can be specified with a short name (one character preceded with the
       hyphen character, as e.g. "-i") or with a long name (a string preceded with two hyphen characters, as e.g. "--stdin").

       -a IPV6_ADDRESS, --address IPV6_ADDRESS

              This  option  ca  be  employed  to specify a single IPv6 address that is meant to be processed by the tool. This option is typically
              employed in conjunction with the '-d' tool, to decode the IPv6 address in question.

       -i, --stdin

              This option request the tool to read IPv6 addresses from standard input (stdin), until an EOF (End-Of-File) condition is found.

       -j PREFIX, --accept PREFIX

              Accept IPv6 addresses belonging to the specified IPv6 prefix (PREFIX/LEN).

       -b TYPE, --accept-type TYPE

              Accept IPv6 addresses belonging to the specified address type. Valid address types are:

                * unicast
                * unspec
                * multicast

       -k SCOPE, --accept-scope SCOPE

              Accept IPv6 addresses belonging to the specified address scope. Valid address scopes are:

                * reserved
                * interface (or "interface-local)
                * link (or "link-local")
                * admin (or "admin-local")
                * site (or "site-local")
                * admin (or "admin-local")
                * organization (or "organization-local")
                * global
                * unassigned
                * unspecified

       -w UNICAST_TYPE, --accept-utype UNICAST_TYPE

              Accept IPv6 addresses belonging to the specified unicast type. Valid unicast address types are:

                * loopback
                * ipv4-compat
                * ipv4-mapped
                * link-local
                * site-local
                * unique-local
                * 6to4
                * teredo
                * global

       -g IID_TYPE, --accept-iid IID_TYPE

              Accept unicast IPv6 addresses with an Interface ID of the specified type. Valid Interface ID types are:

                * ieee
                * isatap
                * ipv4-32
                * ipv4-64
                * ipv4-all
                * embed-port
                * embed-port-rev
                * embed-port-all
                * low-byte
                * byte-pattern
                * random

       -J PREFIX, --block PREFIX

              Block IPv6 addresses belonging to the specified IPv6 prefix (PREFIX/LEN).

       -B TYPE, --block-type TYPE

              Block IPv6 addresses belonging to the specified address type. Valid address types are:

                * unicast
                * unspec
                * multicast

       -K SCOPE, --block-scope SCOPE

              Block IPv6 addresses belonging to the specified address scope. Valid address scopes are:

                * reserved
                * interface (or "interface-local)
                * link (or "link-local")
                * admin (or "admin-local")
                * site (or "site-local")
                * admin (or "admin-local")
                * organization (or "organization-local")
                * global
                * unassigned
                * unspecified

       -W UNICAST_TYPE, --block-utype UNICAST_TYPE

              Block IPv6 addresses belonging to the specified unicast type. Valid unicast address types are:

                * loopback
                * ipv4-compat
                * ipv4-mapped
                * link-local
                * site-local
                * unique-local
                * 6to4
                * teredo
                * global

       -G IPV6_ADDRESS, --block-iid IID_TYPE

              Block unicast IPv6 addresses with an Interface ID of the specified type. Valid Interface ID types are:

                * ieee
                * isatap
                * ipv4-32
                * ipv4-64
                * ipv4-all
                * embed-port
                * embed-port-rev
                * embed-port-all
                * low-byte
                * byte-pattern
                * random

       -q, --print-unique

              This option causes the tool to eliminate duplicate addresses from the list of IPv6 addresses read from standard input (stdin).  That
              is,  when  reading  a  list of addresses from stdin, only the first "copy" of each address will be processed by the tool (with later
              ones being simply ignored).

       -c, --print-canonic

              This option request the tool to print the IPv6 address specfied with the '-a' option (or a list of addresses read froom stdin if the
              '-i'  option  was  set) in its canonic form. This is useful to before comparing textual representations of IPv6 addresses, since the
              same address can usually be written in multiple different ways.

       -d, --print-decode

              This option request the tool to decode the IPv6 address specfied with the '-a' option (or a list of addresses read  froom  stdin  if
              the  '-i'  option  was  set).  The  current  version of the tool supports only decode type, in which information is printed for each
              address with the following syntax:

                      AddressType=AddressSubtype=Scope=IIDTYpe=IIDSUbtype

              This simple syntax is meant to be easy for scripting purposes. Future versions of the tool will incorporate a human-friendly mode.

       -s, --print-stats

              This option requests the tool to produce address statistics from the list of IPv6 addresses read from standard  input.  This  option
              should be used in conjunction with the '-i' option, such that multiple addresses can be given as input to addr6.

              addr6  will  always  print the total number of IPv6 addresses that have been examined, and the percentage of unicast, multicast, and
              unspecified (::) addresses. If at least one unicast address is identified, unicast-specific statistics will be printed. In the  same
              way, if at least one multicast address is identified, then multicast-specific statistics will be printed.

              Unicast-specific statistics include:

                1) Number and percentage of each unicast address type (global
                   unicast, link-local unicast, 6to4, Teredo, etc.).

                2) Number and percentage of each of the different Interface
                   ID types (IEEE-based, low-byte, etc.).

              Only  those unicast address types for which there are multiple possible types of Interface-IDs will be considered for the Interface-
              ID assessment. Namely,

                * 6to4
                * Global Unicast
                * Link-local Unicast
                * Site-local unicast addresses (deprecated)
                * Unique local unicast addresses

              Unicast address types such as 'Teredo' are not considered by this analysis, since they have a single type of Interface-ID, as speci‐
              fied by the corresponding specifications.

              Multicast-specific statistics include:

                1) Number of addresses and percentage of each multicast
                   address type (Permanent, Embedded-RP, etc).

                2) Number addresses and percentage of each of the multicast
                   address scope different Interface ID types (Link, Interfa-
                   ce, Global, etc.)

       -v, --verbose

              This option selects the "verbosity" of the tool. If this option is left unspecified, only minimum information is printed.

       -h, --help

              Print help information for the addr6 tool.

EXAMPLES
       The following sections illustrate typical use cases of the addr6 tool.

       Example #1

       $ cat addresslist.txt | addr6 -i -q

       addr6  will read IPv6 addresses from stdin ('-i' option), and will only print the first instance of each address ('-q' option), thus effec‐
       tively removing any duplicates from the list.

           Note: In this particular scenario, the address list results
           from the command 'cat addresslist.txt', that has its output
           redirected to the standard input of the addr6 tool.

       Example #2

       $ addr6 -a fc00::1

       Decode the IPv6 address specified with the '-a' option. Note that while the '-d' option was not set, this is the default  behavior  of  the
       tool (unless overridden y another option).

       Example #3

       $ cat addresslist.txt | addr6 -i -q -s

       addr6 will read IPv6 addresses from stdin ('-i' option), will ignore duplicate addresses ('-q' option), and will print statistics about the
       processed IPv6 addresses.

           Note: In this particular scenario, the address list results
           from the command 'cat addresslist.txt', that has its output
           redirected to the standard input of the addr6 tool.

       Example #4

       $ cat addresslist.txt | addr6 -i -q -d

       addr6 will read IPv6 addresses from stdin ('-i' option), will ignore duplicate addresses ('-q' option), and will decode each of the remain‐
       ing addresses.

           Note: In this particular scenario, the address list results
           from the command 'cat addresslist.txt', that has its output
           redirected to the standard input of the addr6 tool.

       Example #5

       $ cat addresslist.txt | addr6 -i -j 2001:db8::/16

       addr6  will  read IPv6 addresses from stdin ('-i' option), will discard any addresses that do not belong to the prefix 2001:db8::/16 (i.e.,
       it will "accept" addresses belonging to such prefix).

           Note: In this particular scenario, the address list results
           from the command 'cat addresslist.txt', that has its output
           redirected to the standard input of the addr6 tool.

SEE ALSO
       ipv6toolkit.conf(5)

       draft-ietf-opsec-ipv6-host-scanning (available at: <http://tools.ietf.org/html/draft-ietf-opsec-ipv6-host-scanning>) for  a  discussion  of
       different IPv6 address patterns.

AUTHOR
       The   addr6   tool  and  the  corresponding  manual  pages  were  produced  by  Fernando  Gont  <fgont@si6networks.com>  for  SI6  Networks
       <http://www.si6networks.com>.

COPYRIGHT
       Copyright (c) 2011-2013 Fernando Gont.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or
       any  later version published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.  A
       copy of the license is available at <http://www.gnu.org/licenses/fdl.html>.

                                                                                                                                          ADDR6(1)
