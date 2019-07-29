lsusb(8)                                                        Linux USB Utilities                                                       lsusb(8)

NAME
       lsusb - list USB devices

SYNOPSIS
       lsusb [ options ]

DESCRIPTION
       lsusb is a utility for displaying information about USB buses in the system and the devices connected to them.

OPTIONS
       -v, --verbose
              Tells lsusb to be verbose and display detailed information about the devices shown.  This includes configuration descriptors for the
              device's current speed.  Class descriptors will be shown, when available, for USB device classes including hub, audio, HID, communi‐
              cations, and chipcard.

       -s [[bus]:][devnum]
              Show only devices in specified bus and/or devnum.  Both ID's are given in decimal and may be omitted.

       -d [vendor]:[product]
              Show only devices with the specified vendor and product ID.  Both ID's are given in hexadecimal.

       -D device
              Do  not  scan  the /dev/bus/usb directory, instead display only information about the device whose device file is given.  The device
              file should be something like /dev/bus/usb/001/001.  This option displays detailed information like the v option; you must  be  root
              to do this.

       -t     Tells lsusb to dump the physical USB device hierarchy as a tree. This overrides the v option.

       -V, --version
              Print  version information on standard output, then exit successfully.

RETURN VALUE
       If the specified device is not found, a non-zero exit code is returned.

FILES
       /var/lib/usbutils/usb.ids
              A list of all known USB ID's (vendors, products, classes, subclasses and protocols).

SEE ALSO
       lspci(8), usbview(8).

AUTHOR
       Thomas Sailer, <sailer@ife.ee.ethz.ch>.

usbutils-007                                                        6 May 2009                                                            lsusb(8)
