update-usbids(8)                                                Linux USB Utilities                                               update-usbids(8)

NAME
       update-usbids - download new version of the USB ID list

SYNOPSIS
       update-usbids

DESCRIPTION
       update-usbids fetches the current version of the usb.ids file from the primary distribution site and installs it.

       This  utility  requires either wget or lynx to be installed. If gzip or bzip2 are available, it automatically downloads the compressed ver‐
       sion of the list.

OPTIONS
       -q     Be quiet and do not report anything except errors.

FILES
       /var/lib/usbutils/usb.ids.gz
              Here we install the new list.

SEE ALSO
       lsusb(8).

AUTHOR
       Thomas Sailer, <sailer@ife.ee.ethz.ch>.

usbutils-007                                                       09 June 2013                                                   update-usbids(8)
