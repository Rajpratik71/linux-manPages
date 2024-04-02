hp-setup(1)                                                                                  User Manuals                                                                                  hp-setup(1)

NAME
       hp-setup - Printer/Fax Setup Utility

DESCRIPTION
       Installs HPLIP printers and faxes in the CUPS spooler. Tries to automatically determine the correct PPD file to use. Allows the printing of a testpage. Performs basic fax parameter setup.

SYNOPSIS
       hp-setup [MODE] [OPTIONS] [SERIAL NO.|USB bus:device|IP|DEVNODE]

MODE
       Run in graphical UI mode:
              -u or --gui (Default)

       Run in interactive mode:
              -i or --interactive

OPTIONS
       Automatic mode:
              -a or --auto (-i mode only)

       To specify the port on a multi-port JetDirect:
              --port=<port> (Valid values are 1*, 2, and 3. *default)

       No testpage in automatic mode:
              -x (-i mode only)

       To specify a CUPS printer queue name:
              -p<printer> or --printer=<printer> (-i mode only)

       To specify a CUPS fax queue name:
              -f<fax> or --fax=<fax> (-i mode only)

       Type of queue(s) to install:
              -t<typelist> or --type=<typelist>. <typelist>: print*, fax* (*default) (-i mode only)

       To specify the device URI to install:
              -d<device> or --device=<device> (--qt4 mode only)

       Remove printers or faxes instead of setting-up:
              -r or --rm or --remove

       Set the language:
              --loc=<lang> or --lang=<lang>. Use --loc=? or --lang=? to see a list of available language codes.

       Set the logging level:
              -l<level> or --logging=<level> <level>: none, info*, error, warn, debug (*default)

       Run in debug mode:
              -g (same as option: -ldebug)

       This help information:
              -h or --help

SERIAL NO.|USB ID|IP|DEVNODE
       USB bus:device (usb only):
              "xxx:yyy" where 'xxx' is the USB bus and 'yyy' is the USB device. (Note: The ':' and all leading zeros must be present.)  Use the 'lsusb' command to obtain this information.

       IPs (network only):
              IPv4 address "a.b.c.d" or "hostname"

       DEVNODE (parallel only):
              "/dev/parportX", X=0,1,2,...

       SERIAL NO. (usb and parallel only):
              "serial no."

EXAMPLES
       Setup using GUI mode:
              $ hp-setup

       Setup using GUI mode, specifying usb:
              $ hp-setup -b usb

       Setup using GUI mode, specifying an IP:
              $ hp-setup 192.168.0.101

       One USB printer attached, automatic:
              $ hp-setup -i -a

       USB, IDs specified:
              $ hp-setup -i 001:002

       Network:
              $ hp-setup -i 66.35.250.209

       Network, Jetdirect port 2:
              $ hp-setup -i --port=2 66.35.250.209

       Parallel:
              $ hp-setup -i /dev/parport0

       USB or parallel, using serial number:
              $ hp-setup -i US12345678A

       USB, automatic:
              $ hp-setup -i --auto 001:002

       Parallel, automatic, no testpage:
              $ hp-setup -i -a -x /dev/parport0

       Parallel, choose device:
              $ hp-setup -i -b par

NOTES
       1. If no serial number, USB ID, IP, or device node is specified, the USB and parallel busses will be probed for devices.

       2. Using 'lsusb' to obtain USB IDs: (example)

          $ lsusb

                Bus 003 Device 011: ID 03f0:c202 Hewlett-Packard

          $ hp-setup --auto 003:011

          (Note: You may have to run 'lsusb' from /sbin or another location. Use '$ locate lsusb' to determine this.)

       3. Parameters -a, -f, -p, or -t are not valid in GUI (-u) mode.

SEE ALSO
       hp-makeuri hp-probe

AUTHOR
       HPLIP (HP Linux Imaging and Printing) is an HP developed solution for printing, scanning, and faxing with HP inkjet and laser based printers in Linux.

REPORTING BUGS
       The HPLIP Launchpad.net site https://launchpad.net/hplip is available to get help, report bugs, make suggestions, discuss the HPLIP project or otherwise contact the HPLIP Team.

COPYRIGHT
       Copyright (c) 2001-15 HP Development Company, L.P.

       This software comes with ABSOLUTELY NO WARRANTY.  This is free software, and you are welcome to distribute it under certain conditions. See COPYING file for more details.

Linux                                                                                             9.0                                                                                      hp-setup(1)
