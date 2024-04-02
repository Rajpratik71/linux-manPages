IPRDUMP(8)                                                                                 System Manager's Manual                                                                                 IPRDUMP(8)



NAME
       iprdump - IBM Power RAID adapter dump utility

SYNOPSIS
       iprdump [-d directory]

       iprdump --version --debug --use-polling --use-uevents

DESCRIPTION
       iprdump  is used to gather information in the event of an adapter failure.  The dump data will by default be saved in the /var/log/ directory with the prefix iprdump.# where # will be the dump ID of
       the file. The ipr dump utility will make a log in the system error log when a dump is taken.  Iprdump should be started as a service daemon instead of run directly.  Nevertheless,  it  can  also  be
       started  at  any  time  and  will properly handle adapters being dynamically added and removed from the system. When it is run directly it will stay running forever in order to process any dump that
       might occur. You can start it with "iprdump --daemon" to force it into the background.

OPTIONS
       --version
              Print the version number of iprdump

       --debug
              Enable additional error logging. Enabling this will result in additional errors logging to /var/log/messages.

       -d <directory>
              Directory where dump data is to be stored.  Default is /var/log/.

       --use-polling
              Do not use netlink/uevent notification, but rather poll for adapter and device configuration changes.

       --use-uevents
              Use netlink/uevent notification rather than polling for adapter and device configuration changes. If not specified, polling will be used until the  first  uevent  notification  appears,  then
              netlink will be used.

       --daemon
              Force the daemon to be run in the background

AUTHOR
       Originally written by Michael Anderson <mjanders@us.ibm.com>. Rewritten for the 2.6 kernel by Brian King <brking@us.ibm.com>.



                                                                                                February 2005                                                                                      IPRDUMP(8)
