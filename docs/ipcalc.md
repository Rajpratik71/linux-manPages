IPCALC(1)                                                                                  General Commands Manual                                                                                  IPCALC(1)



NAME
       ipcalc - perform simple manipulation of IP addresses

SYNOPSIS
       ipcalc [OPTION]... <IP address>[/prefix] [netmask]


DESCRIPTION
       ipcalc  provides  a  simple way to calculate IP information for a host.  The various options specify what information ipcalc should display on standard out. Multiple options may be specified.  An IP
       address to operate on must always be specified.  Most operations also require a netmask or a CIDR prefix as well.


OPTIONS
       -c, --check
              Validate the IP address under the specified family.  If no address family is specified, IPv4 is assumed.


       -4, --ipv4
              Specify IPv4 address family (default).


       -6, --ipv6
              Specify IPv6 address family.


       -b, --broadcast
              Display the broadcast address for the given IP address and netmask.


       -h, --hostname
              Display the hostname for the given IP address.


       -m, --netmask
              Calculate the netmask for the given IP address. It assumes that the IP address is in a complete class A, B, or C network. Many networks do not use the default netmasks, in  which  case
              an inappropriate value will be returned.


       -p, --prefix
              Show the prefix for the given mask/IP address.


       -n, --network
              Display the network address for the given IP address and netmask.


       -s, --silent
              Don't ever display error messages.


AUTHORS
       Erik Troan <ewt@redhat.com>
       Preston Brown <pbrown@redhat.com>


       IPv6 supported wedged in by David Cantrell <dcantrell@redhat.com>

REPORTING BUGS
       Report bugs at http://bugzilla.redhat.com/

COPYRIGHT
       Copyright © 1997-2008 Red Hat, Inc.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



Red Hat, Inc.                                                                                   April 30 2001                                                                                       IPCALC(1)
