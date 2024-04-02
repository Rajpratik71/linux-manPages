hp-makeuri(1)                                                                                User Manuals                                                                                hp-makeuri(1)

NAME
       hp-makeuri - Device URI Creation Utility

DESCRIPTION
       Creates device URIs for local and network connected printers for use with CUPS.

SYNOPSIS
       hp-makeuri [OPTIONS] [SERIAL NO.|USB ID|IP|DEVNODE]

SERIAL NO.|USB ID|IP|DEVNODE
       USB IDs (usb only):
              "xxx:yyy" where xxx is the USB bus ID and yyy is the USB device ID. The ':' and all leading zeroes must be present.  (Use the 'lsusb' command to obtain this information. See Note 1.)

       IPs (network only):
              IPv4 address "a.b.c.d" or "hostname"

       DEVNODE (parallel only):
              "/dev/parportX", X=0,1,2,...

       SERIAL NO. (usb and parallel only):
              "serial no."

OPTIONS
       To specify the port on a multi-port JetDirect:
              -p<port> or --port=<port> (Valid values are 1*, 2, and 3. *default)

       Show the CUPS URI only (quiet mode):
              -c or --cups

       Show the SANE URI only (quiet mode):
              -s or --sane

       Show the HP Fax URI only (quiet mode):
              -f or --fax

       Set the logging level:
              -l<level> or --logging=<level> <level>: none, info*, error, warn, debug (*default)

       Run in debug mode:
              -g (same as option: -ldebug)

       This help information:
              -h or --help

EXAMPLES
       USB:   $ hp-makeuri 001:002

       Network:
              $ hp-makeuri 66.35.250.209

       Parallel:
              $ hp-makeuri /dev/parport0

       USB or parallel (using serial number):
              $ hp-makeuri US123456789

NOTES
       1. Example using 'lsusb' to obtain USB bus ID and USB device ID (example only, the values you obtain will differ) :

          $ lsusb

          Bus 003 Device 011: ID 03f0:c202 Hewlett-Packard

          $ hp-makeuri 003:011

          (Note: You may have to run 'lsusb' from /sbin or another location. Use '$ locate lsusb' to determine this.)

SEE ALSO
       hp-setup

AUTHOR
       HPLIP (HP Linux Imaging and Printing) is an HP developed solution for printing, scanning, and faxing with HP inkjet and laser based printers in Linux.

REPORTING BUGS
       The HPLIP Launchpad.net site https://launchpad.net/hplip is available to get help, report bugs, make suggestions, discuss the HPLIP project or otherwise contact the HPLIP Team.

COPYRIGHT
       Copyright (c) 2001-15 HP Development Company, L.P.

       This software comes with ABSOLUTELY NO WARRANTY.  This is free software, and you are welcome to distribute it under certain conditions. See COPYING file for more details.

Linux                                                                                             5.0                                                                                    hp-makeuri(1)
