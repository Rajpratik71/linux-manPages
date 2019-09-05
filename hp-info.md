hp-info(1)                                                                                   User Manuals                                                                                   hp-info(1)

NAME
       hp-info - Device Information Utility

DESCRIPTION
       Query a printer for static model information, dynamic status information, and CUPS printer queue settings.

SYNOPSIS
       hp-info [DEVICE_URI|PRINTER_NAME] [MODE] [OPTIONS]

PRINTER|DEVICE-URI
       To specify a device-URI:
              -d<device-uri> or --device=<device-uri>

       To specify a CUPS printer:
              -p<printer> or --printer=<printer>

MODE
       Run in interactive mode:
              -i or --interactive

OPTIONS
       Set the logging level:
              -l<level> or --logging=<level> <level>: none, info*, error, warn, debug (*default)

       Run in debug mode:
              -g (same as option: -ldebug)

       This help information:
              -h or --help

       Device ID mode:
              --id (prints device ID only and exits.) (interactive (-i) mode only.)

       Allow device URIs of uninstalled printers:
              -x (interactive (-i) mode only.)

SEE ALSO
       hp-toolbox

AUTHOR
       HPLIP (HP Linux Imaging and Printing) is an HP developed solution for printing, scanning, and faxing with HP inkjet and laser based printers in Linux.

REPORTING BUGS
       The HPLIP Launchpad.net site https://launchpad.net/hplip is available to get help, report bugs, make suggestions, discuss the HPLIP project or otherwise contact the HPLIP Team.

COPYRIGHT
       Copyright (c) 2001-15 HP Development Company, L.P.

       This software comes with ABSOLUTELY NO WARRANTY.  This is free software, and you are welcome to distribute it under certain conditions. See COPYING file for more details.

Linux                                                                                             5.2                                                                                       hp-info(1)
