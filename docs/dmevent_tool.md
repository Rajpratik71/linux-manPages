DMEVENT_TOOL(8)                                                                                                                                                                               DMEVENT_TOOL(8)



NAME
       dmevent_tool - A utility used to load a DSO into dmeventd and (un)register devices with it for monitoring

SYNOPSIS
       dmevent_tool -[Vhmru] {RAID device name} {DSO Name}


DESCRIPTION
       dmevent_tool is a userspace utility used to register/unregister DSOs with the daemon dmeventd.

       If used with the -m command line parameter users can display all of the actively dmeventd monitored devices.



OPTIONS
       -V      Show version of dmevent_tool


       -{h/?}  Show this help information


       -m[r|u] List all currently active device mapper devices
               and their current status with dmeventd
               for registered (-r)/unregistered (-m) devices
                   Syntax: dmevent_tool -m[u|r]


       -a[r|u] Same as -m, but for devices with UUID only!
                   Syntax: dmevent_tool -a[u|r]


       -r      Register a device with dmeventd
                   Syntax: dmevent_tool -r <device name> <path to DSO library>
                   Example: dmevent_tool -r isw_abcdeh_Volume0 libdmraid-events.so


       -u      Unregister a device with dmeventd
                   Syntax: dmevent_tool -u <device name> [<path to DSO library>]
                   Example: dmevent_tool -u isw_abcdefgh_Volume0


EXAMPLES
       dmevent_tool -m is used to display all of the actively monitored devices
           dmevent_tool -m
           Device Name: isw_defeaigdde_Volume0_dmraid00
               Registered DSO:                   libdmraid-events.so
               UUID:                             isw_defeaigdde_Volume0_dmraid00
               status:                           Active
               major device #:                   253
               minor device #:                   0
               read only device:                 No
               number of recorded kernel events: 0
               SATA drives in this volume group: /dev/sdb /dev/sdc

       dmevent_tool -r is used to register a volume group device with dmeventd
           dmevent_tool -r isw_defeaigdde_Volume0_dmraid00 libdmraid-events.so


       dmevent_tool -u is used to unregister a volume group from dmeventd
           dmevent_tool -u isw_defeaigdde_Volume0_dmraid00


DIAGNOSTICS
       dmevent_tool returns an exit code of 0 for success or 1 for error.


AUTHOR
       Brian Wood <brian.j.wood@intel.com>



Brian Wood                                                                                        1.0.0.rc3                                                                                   DMEVENT_TOOL(8)
