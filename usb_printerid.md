usb_printerid(1)                        General Commands Manual                       usb_printerid(1)

NAME
       usb_printerid - prints the ID of the printer on a USB port

SYNOPSIS
       usb_printerid [options] /dev/usb/lpNNN

DESCRIPTION
       usb_printerid  prints  the  identification of the printer on a USB port using the ioctl control
       LPIOC_GET_DEVICE_ID.

EXAMPLES
       Print the USB info before and after downloading the firmware.

       # usb_printerid /dev/usb/lp0
       GET_DEVICE_ID string:
       MFG:Hewlett-Packard;MDL:HP LaserJet 1020;CMD:ACL;CLS:PRINTER;\
       DES:HP LaserJet 1020;

       # cp /lib/firmware/hp/sihp1020.dl /dev/usb/lp0

       # usb_printerid /dev/usb/lp0
       GET_DEVICE_ID string:
       MFG:Hewlett-Packard;MDL:HP LaserJet 1020;CMD:ACL;CLS:PRINTER;\
       DES:HP LaserJet 1020;FWVER:20050309;

FILES
       /usr/bin/usb_printerid, /lib/firmware/hp/*

SEE ALSO
       arm2hpdl(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2zjs.rkkda.com/

