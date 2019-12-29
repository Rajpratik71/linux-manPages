hp-clean(1)                                  User Manuals                                  hp-clean(1)

NAME
       hp-clean - Printer Printhead Cleaning Utility

DESCRIPTION
       Printhead cleaning utility for HPLIP supported inkjet printers.

SYNOPSIS
       hp-clean [DEVICE_URI|PRINTER_NAME] [MODE] [OPTIONS]

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

SEE ALSO
       hp-align hp-clean hp-linefeedcal hp-pqdiag

AUTHOR
       HPLIP  (HP  Linux Imaging and Printing) is an HP developed solution for printing, scanning, and
       faxing with HP inkjet and laser based printers in Linux.

REPORTING BUGS
       The HPLIP Launchpad.net site https://launchpad.net/hplip is available to get help, report bugs,
       make suggestions, discuss the HPLIP project or otherwise contact the HPLIP Team.

COPYRIGHT
       Copyright (c) 2001-18 HP Development Company, L.P.

       This software comes with ABSOLUTELY NO WARRANTY.  This is free software, and you are welcome to
       distribute it under certain conditions. See COPYING file for more details.

Linux                                             4.0                                      hp-clean(1)
