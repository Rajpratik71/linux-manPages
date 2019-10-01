IPRINIT(8)                                                                                 System Manager's Manual                                                                                 IPRINIT(8)



NAME
       iprinit - IBM Power RAID adapter/device initialization utility

SYNOPSIS
       iprinit

       iprinit --debug --daemon --use-polling --use-uevents

DESCRIPTION
       iprinit  is  used to setup IBM Power RAID adapters and devices for optimal performance. It will enable U320 scsi speeds if it is determined the disk enclosure supports it. It will also enable tagged
       command queuing.  Any scsi bus attributes, such as bus width, or disk attributes, such as queue depth, that have been setup by iprconfig will be loaded as well.  It is desired that this be called in
       the boot process, using the init.d script provided.

OPTIONS
       --version
              Print the version number of iprinit

       --debug
              Enable additional error logging. Enabling this will result in additional errors logging to /var/log/messages.

       --daemon
              Run as a daemon to handle adapters and devices being hotplugged.

       --use-polling
              Do not use netlink/uevent notification, but rather poll for adapter and device configuration changes.

       --use-uevents
              Use  netlink/uevent  notification  rather  than  polling for adapter and device configuration changes. If not specified, polling will be used until the first uevent notification appears, then
              netlink will be used.

AUTHOR
       Brian King (brking@us.ibm.com)



                                                                                                February 2005                                                                                      IPRINIT(8)
