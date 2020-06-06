hp-config_usb_printer(1)                                                                       User Manuals                                                                      hp-config_usb_printer(1)

NAME
       hp-config_usb_printer - HP device config using USB

DESCRIPTION
       Udev invokes this tool. Tool detects the plugin, Smart Install (C/DVD-ROM) issues and notifies to logged-in user. Tool also downloads firmware to the device.

SYNOPSIS
       hp-config_usb_printer [OPTIONS] [USB bus:device]

OPTIONS
       Set the logging level:
              -l<level> or --logging=<level> <level>: none, info*, error, warn, debug (*default)

       Run in debug mode:
              -g (same as option: -ldebug)

       This help information:
              -h or --help

USB BUSDEVICE
       USB bus:device :
              "xxx:yyy" where 'xxx' is the USB bus and 'yyy' is the USB device. (Note: The ':' and all leading zeros must be present.)  Use the 'lsusb' command to obtain this information.

EXAMPLES
       USB, IDs specified:
              $hp-config_usb_printer 001:002

NOTES
       1. Using 'lsusb' to obtain USB IDs: (example)

          $ lsusb

                Bus 003 Device 011: ID 03f0:c202 Hewlett-Packard

          $ hp-config_usb_printer 003:011

          (Note: You may have to run 'lsusb' from /sbin or another location. Use '$ locate lsusb' to determine this.)

AUTHOR
       HPLIP (HP Linux Imaging and Printing) is an HP developed solution for printing, scanning, and faxing with HP inkjet and laser based printers in Linux.

REPORTING BUGS
       The HPLIP Launchpad.net site https://launchpad.net/hplip is available to get help, report bugs, make suggestions, discuss the HPLIP project or otherwise contact the HPLIP Team.

COPYRIGHT
       Copyright (c) 2001-15 HP Development Company, L.P.

       This software comes with ABSOLUTELY NO WARRANTY.  This is free software, and you are welcome to distribute it under certain conditions. See COPYING file for more details.

Linux                                                                                              1.2                                                                           hp-config_usb_printer(1)
