netdiscover(8)                                                     User Commands                                                    netdiscover(8)

NAME
       netdiscover - an active/passive arp reconnaissance tool.

SYNOPSIS
       netdiscover [-i device] [-r range | -l file | -p] [-s time] [-n node] [-c count] [-f] [-d] [-S] [-P] [-L]

DESCRIPTION
       netdiscover  is  an  active/passive  arp  reconnaissance tool, initially developed to gain information about wireless networks without dhcp
       servers in wardriving scenarios. It can also be used on switched networks. Built on top of libnet and  libpcap,  it  can  passively  detect
       online hosts or search for them by sending arp requests.

       Furthermore, it can be used to inspect your network's arp traffic, or find network addresses using auto scan mode, which will scan for com‐
       mon local networks.

OPTIONS
       -i device
              The network interface to sniff and inject packets. If no interface is specified, first available will be used.

       -r range
              Scan a given range instead of auto scan. Valid range values area for example: 192.168.0.0/24, 192.168.0.0/16 or 192.168.0.0/8.

       -l file Scan ranges contained on the given file, it must
              contain one range per line.

       -p     Enable passive mode. In passive mode, netdiscover does not send anything, but does only sniff.

       -s time
              Sleep given time in milliseconds between each arp request injection. (default 1)

       -c count
              Number of times to send each arp request. Useful for networks with packet loss, so it will scan given times for each host.

       -n node
              Last ip octet of the source ip used for scanning. You can change it if the default host is already used. (allowed range: 2  to  253,
              default 66)

       -S     Enable  sleep time suppression between each request. If set, netdiscover will sleep after having scanned 255 hosts instead of sleep‐
              ing after each one. This mode was used in netdiscover 0.3 beta4 and before. Avoid this option in networks with packet  loss,  or  in
              wireless networks with low signal level. (also called hardcore mode)

       -f     Enable  fast  mode  scan.  This will only scan for .1, .100 and .254 on each network. This mode is useful while searching for ranges
              being used. After you found such range you can make a specific range scan to find online boxes.

       -d     Ignore configuration files at home dir, this will use defaults ranges and ips for autoscan and fast mode. See below for  information
              about configuration files.

       -P     Produces  output  suitable to be redirected into a file or be parsed by another program, instead of using interactive mode. Enabling
              this option, netdiscover will stop after scanning given ranges.

       -L     When using -P, continue program execution after the active scan phase to capture ARP packets passively.

USAGE
       If passive mode (-p), scan list (-l) or scan range (-r) options arent enabled, netdiscover will scan for common lan addresses.

       Screen control keys

       h      Show help screen

       j      Scroll down (or down arrow)

       k      Scroll up (or up arrow)

       a      Show arp replies list

       r      Show arp requests list

       q      Close help screen or end application

CONFIG FILES
       There are 2 configuration files that netdiscover will look for, each time it is executed, if file doesn't exist it will use default values.
       You can use the -d switch to disable reading and loading configuration files.

       ~/.netdiscover/ranges
              This  file  contains  a list of ranges (one per line) used for auto scan mode instead of default ranges. By default netdiscover will
              use a list of common ranges used on local networks.

              Example:
               192.168.21.0/24
               172.26.0.0/16
               10.0.0.0/8

       ~/.netdiscover/fastips
              List containing the last octect of the ips to be scanned on each subnet, when using fast mode, by default (1,100,154).

              Example:
               1
               10
               25
               254

AUTHOR
       netdiscover was written by Jaime Penalba Estebanez.

       This manual page was originally written by Nicolas Weyland, for the Debian project. This man page has been merged into netdiscover project,
       and modified from the original.

netdiscover                                                        November 2009                                                    netdiscover(8)
