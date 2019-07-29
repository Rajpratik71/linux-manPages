arpon(8)                                                      System Manager's Manual                                                     arpon(8)

NAME
       arpon - ARP handler inspection

SYNOPSIS
       arpon [ -npqfgiolcxSyDHevh ]

             [ -n Nice value ] [ -p Pid file ]
             [ -f Log file ]
             [ -i Iface ]
             [ -c Cache file ] [ -x Timeout ]
             [ -y Timeout ]

DESCRIPTION
       ArpON  (ARP  handler  inspection) is a portable handler daemon that make ARP protocol secure in order to avoid the Man In The Middle (MITM)
       attack through ARP Spoofing, ARP Cache Poisoning or ARP Poison Routing (APR) attacks. It blocks also  the  derived  attacks  by  it,  which
       Sniffing,  Hijacking, Injection, Filtering & co attacks for more complex derived attacks, as: DNS Spoofing, WEB Spoofing, Session Hijacking
       and SSL/TLS Hijacking & co attacks.

       This is possible using three kinds of anti ARP Spoofing tecniques: the first is based on SARPI or "Static  ARP  Inspection"  in  statically
       configured networks without DHCP; the second on DARPI or "Dynamic ARP Inspection" in dynamically configured networks having DHCP; the third
       on HARPI or "Hybrid ARP Inspection" in "hybrid" networks, that is in statically and dynamically (DHCP) configured networks together.

       ArpON is therefore a proactive Point-to-Point, Point-to-Multipoint and Multipoint based solution that requires a daemon in  every  host  of
       the connection for authenticate each host through an authentication of type cooperative between the hosts and that doesn't modify the clas‐
       sic ARP standard base protocol by IETF, but rather sets precise policies by using SARPI for static networks, DARPI for dynamic networks and
       HARPI for hybrid networks thus making today's standardized protocol working and secure from any foreign intrusion.

FEATURES
       - Support for interfaces: Ethernet, Wireless
       - Manages the network interface with: Unplug iface, Boot OS, Hibernation OS, Suspension OS
       - Proactive based solution for connections: Point-to-Point, Point-to-Multipoint, Multipoint
       - Type of authentication for host: Cooperative between the hosts
       - Support for networks: Statically, Dynamically (DHCP), Hybrid network that is statically and dynamically
       - Retro compatible with: classic ARP standard base protocol by IETF
       - Support of Gratuitous ARP request and reply for: Failover Cluster, Cluster with load-balancing, High-Availability (HA) Cluster
       - Blocks the Man In The Middle (MITM) attack through: ARP Spoofing, ARP Cache Poisoning, ARP Poison Routing (APR)
       -  Three kinds of anti ARP Spoofing tecniques: SARPI or Static ARP Inspection, DARPI or Dynamic ARP Inspection, HARPI or Hybrid ARP Inspec‐
       tion
       - Blocks the derived attacks: Sniffing, Hijacking, Injection, Filtering & co attacks
       - Blocks the complex derived attacks: DNS Spoofing, WEB Spoofing, Session Hijacking, SSL/TLS Hijacking & co attacks
       - Tested against: Ettercap, Cain & Abel, DSniff, Yersinia, scapy, netcut, Metasploit, arpspoof, sslsniff, sslstrip & co tools

OPTIONS
       TASK MODE

       -n (--nice) <Nice Value>
              Sets PID's CPU priority (Default: 0 nice).

       -p (--pid-file) <Pid file>
              Sets the pid file (Default /var/run/arpon.pid).

       -q (--quiet)
              Works in background task.

       LOG MODE

       -f (--log-file) <Log file>
              Sets the log file (Default: /var/log/arpon.log).

       -g (--log)
              Works in logging mode.

       DEVICE MANAGER

       ArpON is an ARP handler and it is able to handle network devices automatically (default) or manually, to print a list of up network  inter‐
       faces of the system.

       It  identifies  the interface's datalink layer you are using but it supports only Ethernet/Wireless as datalink. It sets the netowrk inter‐
       face and check running, online ready and it deletes the PROMISCUE flag. The online ready checks unplug (virtual and physical), boot, hiber‐
       nation and suspension OS' features for Ethernet/Wireless card. It handles these features and reset the network interface automatically when
       it will ready.

       -i (--iface) <Iface>
              Sets your device manually.

       -o (--iface-auto)
              Sets device automatically.

       -l (--iface-list)
              Prints all supported devices.

       STATIC ARP INSPECTION

       SARPI detects and blocks Man In The Middle (MITM) attack through ARP Spoofing, ARP Cache Poisoning, ARP Poison Routing (APR) attacks and it
       is  countermeasure  against  these  attacks and the derived attacks by it, which Sniffing, Hijacking, Injection, Filtering & co attacks for
       more complex derived attacks, as: DNS Spoofing, WEB Spoofing, Session Hijacking and SSL/TLS Hijacking & co attacks.

       This solution is therefore a Point-to-Point, Point-to-Multipoint and Multipoint based solution that requires a daemon in every host of  the
       connection for authenticate each host through an authentication of type cooperative between the hosts.

       It manages a list with static entries, making it an optimal choice in those statically configured networks without DHCP.

       Finally,  it's  possible  to  use SARPI as a daemon, using the "TASK  MODE" and  "LOG  MODE"  feature of ArpON.  It supports daemon exit by
       SIGINT, SIGTERM, SIGQUIT and daemon reboot by SIGHUP and SIGCONT POSIX signals.

       -c (--sarpi-cache) <Cache file>
              Sets SARPI entries from file (Default: /etc/arpon.sarpi).

       -x (--sarpi-timeout) <Timeout>
              Sets SARPI Cache refresh timeout (Default: 5 minuts).

       -S (--sarpi)
              Manages ARP Cache statically.

       DYNAMIC ARP INSPECTION

       DARPI detects and blocks Man In The Middle (MITM) attack through ARP Spoofing, ARP Cache Poisoning, ARP Poison Routing (APR) attacks and it
       is  countermeasure  against  these  attacks and the derived attacks by it, which Sniffing, Hijacking, Injection, Filtering & co attacks for
       more complex derived attacks, as: DNS Spoofing, WEB Spoofing, Session Hijacking and SSL/TLS Hijacking & co attacks.

       This solution is therefore a Point-to-Point, Point-to-Multipoint and Multipoint based solution that requires a daemon in every host of  the
       connection for authenticate each host through an authentication of type cooperative between the hosts.

       It manages uniquely a list with dynamic entries. Therefore it's an optimal solution in dynamically configured networks having DHCP.

       Finally,  it's  possible  to  use DARPI as a daemon, using the "TASK  MODE" and  "LOG  MODE"  feature of ArpON.  It supports daemon exit by
       SIGINT, SIGTERM, SIGQUIT and daemon reboot by SIGHUP and SIGCONT POSIX signals.

       -y (--darpi-timeout) <Timeout>
              Sets DARPI entries response max timeout (Default: 5 seconds).

       -D (--darpi)
              Manages ARP Cache dynamically.

       HYBRID ARP INSPECTION

       HARPI detects and blocks Man In The Middle (MITM) attack through ARP Spoofing, ARP Cache Poisoning, ARP Poison Routing (APR) attacks and it
       is  countermeasure  against  these  attacks and the derived attacks by it, which Sniffing, Hijacking, Injection, Filtering & co attacks for
       more complex derived attacks, as: DNS Spoofing, WEB Spoofing, Session Hijacking and SSL/TLS Hijacking & co attacks.

       This solution is therefore a Point-to-Point, Point-to-Multipoint and Multipoint based solution that requires a daemon in every host of  the
       connection for authenticate each host through an authentication of type cooperative between the hosts.

       It  manages  two  lists  simultaneously:  a list with static entries and a list with dynamic entries. Therefore it's an optimal solution in
       statically and dynamically (DHCP) configured networks together.

       Finally, it's possible to use DARPI as a daemon, using the "TASK  MODE" and  "LOG  MODE"  feature of ArpON.  It  supports  daemon  exit  by
       SIGINT, SIGTERM, SIGQUIT and daemon reboot by SIGHUP and SIGCONT POSIX signals.

       -c (--sarpi-cache) <Cache file>
              Sets HARPI entries from file (Default: /etc/arpon.sarpi).

       -x (--sarpi-timeout) <Timeout>
              Sets HARPI Cache refresh timeout (Default: 5 minuts).

       -y (--darpi-timeout) <Timeout>
              Sets HARPI entries response max timeout (Default: 5 seconds).

       -H (--harpi)
              Manage ARP Cache statically and dynamically.

       MISC FEATURES

       Other.

       -e (--license)
              Prints license page.

       -v (--version)
              Prints version number.

       -h (--help)
              Prints help summary page.

EXAMPLES
       You  remember  that  ArpON is a proactive Point-to-Point, Point-to-Multipoint and Multipoint based solution that requires a daemon in every
       host of the connection for authenticate each host through an authentication of type cooperative between the hosts.

       - SARPI "Static ARP Inspection":

         Example of /etc/arpon.sarpi:

           # Example of arpon.sarpi
           #
           192.168.1.1     0:25:53:29:f6:69
           172.16.159.1    0:50:56:c0:0:8
           #

         With 1 minut of SARPI cache refresh timeout:

               riemann:build root# arpon -i en1 -x 1 -S

               17:04:43 WAIT LINK on en1...
               17:04:47 SARPI on
                        DATE = <10/14/2014>
                        DEV = <en1>
                        HW = <0:23:6c:7f:28:e7>
                        IP = <192.168.1.4>
                        CACHE = </etc/arpon.sarpi>
               17:04:47 ARP cache, REFRESH
                        src HW = <0:25:53:29:f6:69>
                        src IP = <192.168.1.1>
               17:05:04 ARP cache, IGNORE
                        src HW = <0:11:d8:70:ef:1f>
                        src IP = <192.168.1.75>
               17:05:47 ARP cache, UPDATE
                        src HW = <0:25:53:29:f6:69>
                        src IP = <192.168.1.1>
                        src HW = <0:50:56:c0:0:8>
                        src IP = <172.16.159.1>
               ...

       - DARPI "Dynamic ARP Inspection":

         With 1 second of DARPI entries response max timeout:

               riemann:build root# arpon -i en1 -y 1 -D

               17:10:24 WAIT LINK on en1...
               17:10:27 DARPI on
                        DATE = <10/14/2014>
                        DEV = <en1>
                        HW = <0:23:6c:7f:28:e7>
                        IP = <192.168.1.4>
               17:10:27 ARP cache, DENY
                        src HW = <0:11:d8:70:ef:1f>
                        src IP = <192.168.1.1>
               17:10:27 ARP cache, ACCEPT
                        src HW = <0:25:53:29:f6:69>
                        src IP = <192.168.1.1>
               17:10:31 ARP cache, ACCEPT
                        src HW = <0:11:d8:70:ef:1f>
                        src IP = <192.168.1.75>
               ...

       - HARPI  "Hybrid ARP Inspection":

         Example of /etc/arpon.sarpi:

           # Example of arpon.sarpi
           #
           192.168.1.1   0:25:53:29:f6:69
           172.16.159.1  0:50:56:c0:0:8
           #

         With 6 minuts of SARPI Cache refresh timeout and 1 second of DARPI entries response max timeout:

               riemann:build root# arpon -i en1 -x 6 -y 1 -H

               17:14:05 WAIT LINK on en1...
               17:14:07 HARPI on
                        DATE = <10/14/2014>
                        DEV = <en1>
                        HW = <0:23:6c:7f:28:e7>
                        IP = <192.168.1.4>
                        CACHE = </etc/arpon.sarpi>
               17:14:07 ARP cache, ACCEPT
                        src HW = <0:11:d8:70:ef:1f>
                        src IP = <192.168.1.75>
               17:14:18 ARP cache, DENY
                        src HW = <0:11:d8:70:ef:1f>
                        src IP = <192.168.1.151>
               17:14:18 ARP cache, ACCEPT
                        src HW = <0:1b:63:c9:b2:96>
                        src IP = <192.168.1.151>
               17:15:06 ARP cache, REFRESH
                        src HW = <0:25:53:29:f6:69>
                        src IP = <192.168.1.1>
               17:20:07 ARP cache, UPDATE
                        src HW = <0:25:53:29:f6:69>
                        src IP = <192.168.1.1>
                        src HW = <0:50:56:c0:0:8>
                        src IP = <172.16.159.1>
               ...

AUTHOR
       ArpON was writen by:

               Andrea Di Pasquale <spikey.it@gmail.com>

       The current version is available via http:

        http://arpon.sourceforge.net

BUGS
       Please send problems, bugs, questions, desirable enhancements, patch, source code contributions, etc. to:

               spikey.it@gmail.com

                                                                  14 October 2014                                                         arpon(8)
