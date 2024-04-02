NETMASK(1)                                                         Debian Linux                                                         NETMASK(1)

NAME
       netmask - a netmask generation and conversion program

SYNOPSIS
       netmask [ options ] spec [ spec ... ]

DESCRIPTION
       This  program  accepts  and  produces a variety of common network address and netmask formats.  Not only can it convert address and netmask
       notations, but it will optimize the masks to generate the smallest list of rules.  This is very handy if you've ever configured a  firewall
       or  router  and  some  nasty  network  administrator  before  you  decided that base 10 numbers were good places to start and end groups of
       machines.

OPTIONS
       -h, --help
              Print a summary of the options

       -v, --version
              Print the version number

       -d, --debug
              Print status/progress information

       -s, --standard
              Output address/netmask pairs

       -c, --cidr
              Output CIDR format address lists

       -i, --cisco
              Output Cisco style address lists

       -r, --range
              Output ip address ranges

       -x, --hex
              Output address/netmask pairs in hex

       -o, --octal
              Output address/netmask pairs in octal

       -b, --binary
              Output address/netmask pairs in binary

       -n, --nodns
              Disable DNS lookups for addresses

DEFINITIONS
       A spec is an address specification, it can look like:

       address
              One address.

       address1:address2
              All addresses from address1 to address2.

       address1:+address2
              All addresses from address1 to address1+address2.

       address/mask
              A group starting at address spanning mask.

       An address is an internet network address, it can look like:

       ftp.gnu.org
              An internet hostname.

       209.81.8.252
              A standard dotted quad internet address notation.

       100    A decimal number (100 in this case).

       0100   An octal number preceded by "0" (64 in this case).

       0x100  A hexadecimal number preceded by "0x" (256 in this case).

       A mask is a network mask, it can look like:

       255.255.224.0
              A dotted quad netmask (netmask will complain if it is not a valid netmask).

       0.0.31.255
              A Cisco style inverse netmask (with the same checks).

       8      The number of bits set to one from the left (CIDR notation).

       010    The number of bits set to one from the left in octal.

       0x10   The number of bits set to one from the left in hexadecimal.

AUTHOR
       netmask was written by Robert Stone.  Some algorithm design and optimization was provided by Tom Lear.  This manual  page  was  written  by
       Robert Stone.

BUGS
       Let me know if you find any.  This man page is a bit more simplistic than I'd like, but I've forgotten most of the groff I once knew.

SEE ALSO
       ipchains(1), ipfwadm(8), netstat(8), route(8), routed(8), gated(8), tcpd(8)

Debian Project                                                      15 May 1999                                                         NETMASK(1)
