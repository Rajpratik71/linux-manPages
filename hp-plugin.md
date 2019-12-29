hp-plugin(1)                                 User Manuals                                 hp-plugin(1)

NAME
       hp-plugin - Plugin Download and Install Utility

DESCRIPTION
       HP Proprietary Plugin Download and Install Utility

SYNOPSIS
       hp-plugin [MODE] [OPTIONS]

MODE
       Run in graphical UI mode:
              -u or --gui (Default)

       Run in interactive mode:
              -i or --interactive

       Installation for required printer mode:
              --required (Qt4 only)

       Installation for optional printer mode:
              --optional (Qt4 only)

       Set the language:
              --loc=<lang>  or  --lang=<lang>. Use --loc=? or --lang=? to see a list of available lan‐
              guage codes.

OPTIONS
       Specify the path to the plugin file:
              -p <path> or --path=<path> or --plugin=<path>

       Set the logging level:
              -l<level> or --logging=<level> <level>: none, info*, error, warn, debug (*default)

       Run in debug mode:
              -g (same as option: -ldebug)

       This help information:
              -h or --help

SEE ALSO
       hp-setup hp-firmware

AUTHOR
       HPLIP (HP Linux Imaging and Printing) is an HP developed solution for printing,  scanning,  and
       faxing with HP inkjet and laser based printers in Linux.

REPORTING BUGS
       The HPLIP Launchpad.net site https://launchpad.net/hplip is available to get help, report bugs,
       make suggestions, discuss the HPLIP project or otherwise contact the HPLIP Team.

COPYRIGHT
       Copyright (c) 2001-18 HP Development Company, L.P.

       This software comes with ABSOLUTELY NO WARRANTY.  This is free software, and you are welcome to
       distribute it under certain conditions. See COPYING file for more details.

Linux                                             2.1                                     hp-plugin(1)
