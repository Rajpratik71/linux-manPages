subnetcalc(1)                        BSD General Commands Manual                        subnetcalc(1)

NAME
     subnetcalc — IPv4/IPv6 Subnet Calculator

SYNOPSIS
     subnetcalc [Address] [Netmask/Prefix] [-n] [-uniquelocal] [-uniquelocalhq] [-nocolour|-nocolor]

DESCRIPTION
     subnetcalc is an IPv4/IPv6 subnet address calculator. For given IPv4 or IPv6 address and netmask
     or prefix length, it calculates network address, broadcast address, maximum number of hosts and
     host address range. Also, it prints the addresses in binary format for better understandability.
     Furthermore, it prints useful information on specific address types (e.g. type, scope, interface
     ID, etc.).

ARGUMENTS
     The following arguments have to be provided:

     Address
             The IP address. If a hostname is provided here, it is tried to resolve the address by a
             DNS server and the first returned address is used. Internationalized Domain Names (IDN)
             are supported.

     Netmask/Prefix
             The netmask or prefix length (0-32 for IPv4; 0-128 for IPv6).

     -n      Skip trying a reverse DNS lookup.

     -uniquelocal
             Given an IPv6 address, the first 48 bits of the address are replaced by a randomly cho‐
             sen IPv6 Unique Local prefix in fc00::/7 (see also RFC 4193). Under Linux, /dev/urandom
             is used for random number generation.

     -uniquelocalhq
             Like -uniquelocal, but using /dev/random instead on Linux systems for highest-quality
             random number generation. On other systems, this option is equal to -uniquelocal. Note,
             that reading from /dev/random may take some time. You can speed up this process by
             delivering random input e.g. by pressing keys or moving the mouse.

     -nocolour|-nocolor
             Turns colourised output off.

EXAMPLES
     subnetcalc 132.252.250.0 255.255.255.0

     subnetcalc 132.252.250.0/255.255.255.0 -nocolor

     subnetcalc 132.252.250.0 24

     subnetcalc 132.252.250.0/24 -nocolour

     subnetcalc fec0:2345:6789:1111:221:6aff:fe0b:2674 56

     subnetcalc 2a00:1450:8007::69 64

     subnetcalc ff08::1:2:3

     subnetcalc 131.220.6.5/24

     subnetcalc 132.252.181.87 -n

     subnetcalc www.iem.uni-due.de 24

     subnetcalc www.six.heise.de

     subnetcalc fd00:: 64 -uniquelocal

     subnetcalc fd00::9876:256:7bff:fe1b:3255 56 -uniquelocalhq

     subnetcalc düsseldorf.de 28

     subnetcalc www.köln.de

     subnetcalc räksmörgås.josefsson.org 24

AUTHORS
     Thomas Dreibholz
     https://www.uni-due.de/~be0001/subnetcalc
     mailto://dreibh@iem.uni-due.de

subnetcalc                                  July 24, 2014                                  subnetcalc
