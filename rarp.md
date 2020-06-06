RARP(8)                                                                                 Linux Programmer's Manual                                                                                 RARP(8)

NAME
       rarp - manipulate the system RARP table

SYNOPSIS
       rarp [-V] [--version] [-h] [--help]
       rarp -a
       rarp [-v] -d hostname ...
       rarp [-v] [-t type] -s hostname hw_addr

NOTE
       This program is obsolete.  From version 2.3, the Linux kernel no longer contains RARP support.  For a replacement RARP daemon, see ftp://ftp.dementia.org/pub/net-tools

DESCRIPTION
       Rarp  manipulates  the kernel's RARP table in various ways.  The primary options are clearing an address mapping entry and manually setting up one.  For debugging purposes, the rarp program also
       allows a complete dump of the RARP table.

OPTIONS
       -V     Display the version of RARP in use.

       -v     Tell the user what is going on by being verbose.

       -t type
              When setting or reading the RARP table, this optional parameter tells rarp which class of entries it should check for.  The default value of this parameter is ether  (i.e.  hardware  code
              0x01 for IEEE 802.3 10Mbps Ethernet .  Other values might include network technologies such as AX.25 (ax25) and NET/ROM (netrom).

       -a

       --list Lists the entries in the RARP table.

       -d hostname

       --delete hostname
              Remove all RARP entries for the specified host.

       -s hostname hw_addr

       --set hostname hw_addr
              Create  a  RARP  address mapping entry for host hostname with hardware address set to hw_addr.  The format of the hardware address is dependent on the hardware class, but for most classes
              one can assume that the usual presentation can be used.  For the Ethernet class, this is 6 bytes in hexadecimal, separated by colons.

WARNING
       Some systems (notably older Suns) assume that the host replying to a RARP query can also provide other remote boot services. Therefore never gratuitously add rarp entries unless you wish to meet
       the wrath of the network administrator.

FILES
       /proc/net/rarp,

SEE ALSO
       arp(8), route(8), ifconfig(8), netstat(8)

AUTHORS
       Ross D. Martin, <martin@trcsun3.eas.asu.edu>
       Fred N. van Kempen, <waltje@uwalt.nl.mugnet.org>
       Phil Blundell, <Philip.Blundell@pobox.com>

net-tools                                                                                     4 August 1997                                                                                       RARP(8)
