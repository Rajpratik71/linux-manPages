hp-firmware(1)                                                                               User Manuals                                                                               hp-firmware(1)

NAME
       hp-firmware - Firmware Download Utility

DESCRIPTION
       Download firmware to a device that requires downloaded firmware to function. (Note: Most printers do not require the use of this utility).

SYNOPSIS
       hp-firmware [DEVICE_URI|PRINTER_NAME] [MODE] [OPTIONS]

PRINTER|DEVICE-URI
       To specify a device-URI:
              -d<device-uri> or --device=<device-uri>

       To specify a CUPS printer:
              -p<printer> or --printer=<printer>

MODE
       Run in interactive mode:
              -i or --interactive

       Run in non-interactive mode:
              -n or --non-interactive

OPTIONS
       Set the logging level:
              -l<level> or --logging=<level> <level>: none, info*, error, warn, debug (*default)

       Run in debug mode:
              -g (same as option: -ldebug)

       This help information:
              -h or --help

       Use USB IDs to specify printer:
              -s bbb:ddd, where bbb is the USB bus ID and ddd is the USB device ID. The ':' and all leading zeroes must be present.

       Seconds to delay before download:
              -y<secs> or --delay=<secs> (float value, e.g. 0.5)

SEE ALSO
       hp-plugin hp-toolbox

AUTHOR
       HPLIP (HP Linux Imaging and Printing) is an HP developed solution for printing, scanning, and faxing with HP inkjet and laser based printers in Linux.

REPORTING BUGS
       The HPLIP Launchpad.net site https://launchpad.net/hplip is available to get help, report bugs, make suggestions, discuss the HPLIP project or otherwise contact the HPLIP Team.

COPYRIGHT
       Copyright (c) 2001-15 HP Development Company, L.P.

       This software comes with ABSOLUTELY NO WARRANTY.  This is free software, and you are welcome to distribute it under certain conditions. See COPYING file for more details.

Linux                                                                                             2.4                                                                                   hp-firmware(1)
