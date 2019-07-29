hp-check(1)                                                                                  User Manuals                                                                                  hp-check(1)

NAME
       hp-check - Dependency/Version Check Utility

DESCRIPTION
       Checks dependency versions,permissions of HPLIP. (Run as 'python ./check.py' from the HPLIP tarball before installation.)

SYNOPSIS
       hp-check [OPTIONS]

OPTIONS
       Compile-time check:
              -c or --compile

       Run-time check:
              -r or --run or --runtime

       Compile and run-time checks:
              -b or --both (default)

       Set the logging level:
              -l<level> or --logging=<level> <level>: none, info*, error, warn, debug (*default)

       Run in debug mode:
              -g (same as option: -ldebug)

       Output plain text only:
              -t

       This help information:
              -h or --help

NOTES
       1. For checking for the proper build environment for the HPLIP supplied tarball (.tar.gz or .run),

       use the --compile or --both switches.

       2. For checking for the proper runtime environment for a distro supplied package (.deb, .rpm, etc),

       use the --runtime switch.

AUTHOR
       HPLIP (HP Linux Imaging and Printing) is an HP developed solution for printing, scanning, and faxing with HP inkjet and laser based printers in Linux.

REPORTING BUGS
       The HPLIP Launchpad.net site https://launchpad.net/hplip is available to get help, report bugs, make suggestions, discuss the HPLIP project or otherwise contact the HPLIP Team.

COPYRIGHT
       Copyright (c) 2001-15 HP Development Company, L.P.

       This software comes with ABSOLUTELY NO WARRANTY.  This is free software, and you are welcome to distribute it under certain conditions. See COPYING file for more details.

Linux                                                                                            15.1                                                                                      hp-check(1)
