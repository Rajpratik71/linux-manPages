IPRUPDATE(8)                                                                               System Manager's Manual                                                                               IPRUPDATE(8)



NAME
       iprupdate - IBM Power RAID adapter/device microcode update utility

SYNOPSIS
       iprupdate

       iprupdate --debug --check_only --daemon --use-polling --use-uevents

DESCRIPTION
       iprupdate  is  used to update the microcode on IBM storage adapters and the disk units attached to them to a minimum supported level. It can be run at any time while the ipr device driver is loaded.
       The utility will check the microcode revision level of each storage adapter/disk unit on  the  system  and  compare  it  to  the  microcode  revision  level  that  is  installed  in  /etc/microcode,
       /usr/lib/microcode, and /lib/firmware.  If the microcode level on the adapter/device is below the minimum supported level and the level of the latest image is newer, the microcode will be updated to
       the latest level available. It is desired that this be called in the boot process.

OPTIONS
       --version
              Print the version number of iprupdate

       --debug
              Enable additional error logging. Enabling this will result in additional errors logging to /var/log/messages.

       --check_only
              Check if any adapters or disk units are below their minimum supported level.

       --daemon
              Run as a daemon to handle adapters and devices being hotplugged.

       --use-polling
              Do not use netlink/uevent notification, but rather poll for adapter and device configuration changes.

       --use-uevents
              Use netlink/uevent notification rather than polling for adapter and device configuration changes. If not specified, polling will be used until the  first  uevent  notification  appears,  then
              netlink will be used.

AUTHOR
       Brian King (brking@us.ibm.com)



                                                                                                February 2005                                                                                    IPRUPDATE(8)
