hp-query(1)                                                                                  User Manuals                                                                                  hp-query(1)

NAME
       hp-query - Model Query Utility

DESCRIPTION
       Query a printer model for static model information. Designed to be called from other processes.

SYNOPSIS
       hp-query [MODE] [OPTIONS]

MODE
       Run in non-interactive mode:
              -n or --non-interactive

OPTIONS
       Set the logging level:
              -l<level> or --logging=<level> <level>: none, info*, error, warn, debug (*default)

       Run in debug mode:
              -g (same as option: -ldebug)

       This help information:
              -h or --help

       Specify model by device URI:
              -d<device_uri> or --device=<device_uri>

       Specify normalized model name:
              -m<model_name> or --model=<model_name> (normalized models.dat format)

       Specify raw model name:
              -r<model_name> or --raw=<model_name> (raw model name from MDL: field of device ID)

       Specify key to query:
              -k<key> or --key=<key> (or, use -a/--all to return all keys)

       Query all keys:
              -a or --all (default separator is a LF)

       Specify the separator when multiple keys are queried:
              -s<sep> --sep=<sep> (character or 'tab', 'newline', 'cr', 'lf', 'crlf')(only valid when used with -a/--all)

       Suppress trailing linefeed:
              -x

SEE ALSO
       hp-info

AUTHOR
       HPLIP (HP Linux Imaging and Printing) is an HP developed solution for printing, scanning, and faxing with HP inkjet and laser based printers in Linux.

REPORTING BUGS
       The HPLIP Launchpad.net site https://launchpad.net/hplip is available to get help, report bugs, make suggestions, discuss the HPLIP project or otherwise contact the HPLIP Team.

COPYRIGHT
       Copyright (c) 2001-15 HP Development Company, L.P.

       This software comes with ABSOLUTELY NO WARRANTY.  This is free software, and you are welcome to distribute it under certain conditions. See COPYING file for more details.

Linux                                                                                             0.2                                                                                      hp-query(1)
