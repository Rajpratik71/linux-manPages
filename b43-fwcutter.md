B43-FWCUTTER(1)                                                                       User Commands                                                                       B43-FWCUTTER(1)

NAME
       b43-fwcutter - Utility for extracting Broadcom 43xx firmware

SYNOPSIS
       b43-fwcutter [OPTION] [DRIVER]

DESCRIPTION
       b43-fwcutter  can extract the firmware for your Broadcom 43xx hardware from different closed source drivers. The b43 driver depends on these firmware files and can't work without
       them.

       Currently b43-fwcutter supports Apple MacOS X, Microsoft Windows and Linux drivers, but keep in mind that b43-fwcutter doesn't support all driver versions.

       Example:

              b43-fwcutter bcmwl5.sys

       to cut the firmware out of bcmwl5.sys

OPTIONS
       -l|--list
              List supported driver versions

       -i|--identify
              Only identify the driver file (don't extract)

       -w|--target-dir DIR
              Extract and write firmware to DIR

       -a|--alt-iv
              Extract alternative initvals (only 3.10.x.x)

       -v|--version
              Print b43-fwcutter version

       -h|--help
              Print help information

AUTHORS
       b43 development team, http://wireless.kernel.org/en/users/Drivers/b43

b43-fwcutter                                                                               2014                                                                           B43-FWCUTTER(1)
