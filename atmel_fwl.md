ATMEL_FWL(8)                                                                     System Manager's Manual                                                                     ATMEL_FWL(8)

NAME
       atmel_fwl - Load firmware into Atmel at76c50x wireless networking chips.

SYNOPSIS
       atmel_fwl <interface> /path/to/firmware

DESCRIPTION
       atmel_fwl loads firmware images for Atmel at76c50x series wireless networking chips into the Linux driver for same.

       Note  that  this utility is not normally necessary, since the driver will automatically load the correct firmware image via the hotplug system. Atmel_fwl is provided for applica‐
       tions where use of the hotplug system may not be desirable.

       atmel_fwl should be run after the interface has been created (after card insertion, in the case of PCMCIA cards) but before it is brought up by running ifconfig.

NOTES
       Note that there are two versions of many of the firmware images, the second one with the suffix "-wpa". These are later releases from Atmel which support WPA  privacy.  They  are
       only  usable  by  versions of the driver greater than 0.9. Be sure not to use the "-wpa" one unless your in-kernel driver code is version 0.9 or better. Sadly, as of version 0.9,
       the in-kernel driver does not actually support the setting of WPA passphrases.

       The firmware images are usually installed in /usr/lib/hotplug/firmware.

       The status of the driver, including its firmware loading, is available in /proc/driver/atmel

FILES
       /usr/lib/hotplug/firmware

       /proc/driver/atmel

SEE ALSO
       iwconfig(8), ifconfig(8),

AUTHOR
       This manual page was written by Simon Kelley <simon@thekelleys.org.uk>.

                                                                                                                                                                             ATMEL_FWL(8)
