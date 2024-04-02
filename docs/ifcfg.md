IFCFG(8)                                                                                            Linux                                                                                            IFCFG(8)



NAME
       ifcfg - simplistic script which replaces ifconfig IP management

SYNOPSIS
       ifcfg [ DEVICE ] [ command ] ADDRESS [ PEER ]



DESCRIPTION
       This manual page documents briefly the ifcfg command.

       This is a simplistic script replacing one option of ifconfig , namely, IP address management. It not only adds addresses, but also carries out Duplicate Address Detection RFC-DHCP, sends unsolicited
       ARP to update the caches of other hosts sharing the interface, adds some control routes and restarts Router Discovery when it is necessary.


IFCONFIG - COMMAND SYNTAX
       DEVICE - it may have alias, suffix, separated by colon.


       command
              - add, delete or stop.


       ADDRESS
              - optionally followed by prefix length.


       peer   - optional peer address for pointpoint interfaces.


NOTES
       This script is not suitable for use with IPv6.


SEE ALSO
       IP Command reference ip-cref.ps



iproute2                                                                                      September 24 2009                                                                                      IFCFG(8)
