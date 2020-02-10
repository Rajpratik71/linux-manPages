PPPOE-DISCOVERY(8)                                                                       System Manager's Manual                                                                       PPPOE-DISCOVERY(8)

NAME
       pppoe-discovery - perform PPPoE discovery

SYNOPSIS
       pppoe-discovery [ options ]
       pppoe-discovery { -V | -h }

DESCRIPTION
       pppoe-discovery  performs  the  same discovery process as pppoe, but does not initiate a session.  It sends a PADI packet and then prints the names of access concentrators in each PADO packet it
       receives.

OPTIONS
       -I interface
              The -I option specifies the Ethernet interface to use.  Under Linux, it is typically eth0 or eth1.  The interface should be “up” before you start pppoe-discovery, but should not  be  con‐
              figured to have an IP address.  The default interface is eth0.

       -D file_name
              The -D option causes every packet to be dumped to the specified file_name.  This is intended for debugging only.

       -U
              Causes  pppoe-discovery  to  use  the  Host-Uniq tag in its discovery packets.  This lets you run multiple instances of pppoe-discovery and/or pppoe without having their discovery packets
              interfere with one another.  You must supply this option to all instances that you intend to run simultaneously.

       -S service_name
              Specifies the desired service name.  pppoe-discovery will only accept access concentrators which can provide the specified service.  In most cases, you should  not  specify  this  option.
              Use it only if you know that there are multiple access concentrators or know that you need a specific service name.

       -C ac_name
              Specifies  the  desired  access concentrator name.  pppoe-discovery will only accept the specified access concentrator.  In most cases, you should not specify this option.  Use it only if
              you know that there are multiple access concentrators.  If both the -S and -C options are specified, they must both match.

       -A
              This option is accepted for compatibility with pppoe, but has no effect.

       -V | -h
              Either of these options causes pppoe-discovery to print its version number and usage information, then exit.

AUTHORS
       pppoe-discovery was written by Marco d'Itri <md@linux.it>, based on pppoe by David F. Skoll <dfs@roaringpenguin.com>.

SEE ALSO
       pppoe(8), pppoe-sniff(8)

                                                                                             22 January 2006                                                                           PPPOE-DISCOVERY(8)
