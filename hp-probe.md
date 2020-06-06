hp-probe(1)                                                                                    User Manuals                                                                                   hp-probe(1)

NAME
       hp-probe - Printer Discovery Utility

DESCRIPTION
       Discover HPLIP supported USB, parallel, and network attached printers.

SYNOPSIS
       hp-probe [OPTIONS]

OPTIONS
       Bus to probe:
              -b<bus> or --bus=<bus> <bus>: cups, usb*, net, bt, fw, par (*default) (Note: bt and fw not supported in this release.)

       Set Time to Live (TTL):
              -t<ttl> or --ttl=<ttl> (Default is 4).

       Set timeout:
              -o<timeout in secs.> or --timeout=<timeout is secs.>

       Filter by functionality:
              -e<filter list> or --filter=<filter list> <filter list>: comma separated list of one or more of: scan, pcard, fax, copy, or none*. (*none is the default)

       Search:
              -s<search re> or --search=<search re> <search re> must be a valid regular expression (not case sensitive)

       Network discovery method:
              -m<method> or --method=<method>: <method> is 'slp'* or 'mdns'.

       Set the logging level:
              -l<level> or --logging=<level> <level>: none, info*, error, warn, debug (*default)

       Run in debug mode:
              -g (same as option: -ldebug)

       This help information:
              -h or --help

EXAMPLES
       Find all devices on the network:
              hp-probe -bnet

       Find all devices on USB that support scanning:
              hp-probe -busb -escan

       Find all networked devices that contain the name 'lnx' and that support photo cards or scanning:
              hp-probe -bnet -slnx -escan,pcard

       Find all devices that have queues installed in CUPS:
              hp-probe -bcups

       Find all devices on the USB bus:
              hp-probe

AUTHOR
       HPLIP (HP Linux Imaging and Printing) is an HP developed solution for printing, scanning, and faxing with HP inkjet and laser based printers in Linux.

REPORTING BUGS
       The HPLIP Launchpad.net site https://launchpad.net/hplip is available to get help, report bugs, make suggestions, discuss the HPLIP project or otherwise contact the HPLIP Team.

COPYRIGHT
       Copyright (c) 2001-15 HP Development Company, L.P.

       This software comes with ABSOLUTELY NO WARRANTY.  This is free software, and you are welcome to distribute it under certain conditions. See COPYING file for more details.

Linux                                                                                              4.1                                                                                        hp-probe(1)
