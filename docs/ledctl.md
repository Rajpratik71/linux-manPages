ledctl(8)                                                                         Intel(R) Enclosure LED Control Application                                                                        ledctl(8)



NAME
       ledctl - Intel(R) LED control application for a storage enclosures.

SYNOPSIS
       ledctl [OPTIONS] pattern_name=list_of_devices ...

DESCRIPTION
       The ledctl is an user space application designed to control LEDs associated with each slot in an enclosure or a drive bay. The LEDs of devices listed in list_of_devices are set to the given pattern
       pattern_name and all other LEDs are turned off.  User must have root privileges to use this application.

       There are two types of systems: 2-LEDs systems (Activity LED, Status LED) and 3-LEDs systems (Activity LED, Locate LED, Fail LED).  The ledctl application uses SGPIO and SES-2 protocol to control
       LEDs.  The program implements IBPI patterns of SFF-8489 specification for SGPIO.  Please note some enclosures do not stick close to SFF-8489 specification.  It might happen that enclosure's
       processor will accept an IBPI pattern but it will blink the LEDs at variance with SFF-8489 specification or it has limited number of patterns supported.

       LED management (AHCI) and SAF-TE protocols are not supported.

       The ledctl application has been verified to work with Intel(R) storage controllers (i.e. Intel(R) AHCI controller and Intel(R) SAS controller).  The application might work with storage controllers
       of other vendors (especially SCSI/SAS controllers). However, storage controllers of other vendors have not been tested.

       The ledmon application has the highest priority when accessing LEDs.  It means that some patterns set by ledctl may have no effect if ledmon is running (except Locate pattern).

       The ledctl application is a part of Intel(R) Enclosure LED Utilities.

   Pattern Names
       The ledctl application accepts the following names for pattern_name argument according to SFF-8489 specification.

       locate  Turns Locate LED associated with the given device(s) or empty slot(s) on.

       locate_off
               Turns only Locate LED off.

       normal  Turns Status LED, Failure LED and Locate LED off.

       off     Turns only Status LED and Failure LED off.

       ica or degraded
               Visualizes "In a Critical Array" pattern.

       rebuild Visualizes "Rebuild" pattern.

       ifa or failed_array
               Visualizes "In a Failed Array" pattern.

       hotspare
               Visualizes "Hotspare" pattern.

       pfa     Visualizes "Predicted Failure Analysis" pattern.

       failure or disk_failed
               Visualizes "Failure" pattern.

       ses_abort
               SES-2 R/R ABORD

       ses_rebuild
               SES-2 REBUILD/REMAP

       ses_ifa SES-2 IN FAILED ARRAY

       ses_ica SES-2 IN CRIT ARRAY

       ses_cons_check
               SES-2 CONS CHECK

       ses_hotspare
               SES-2 HOT SPARE

       ses_rsvd_dev
               SES-2 RSVD DEVICE

       ses_ok  SES-2 OK

       ses_ident
               SES-2 IDENT

       ses_rm  SES-2 REMOVE

       ses_insert
               SES-2 INSERT

       ses_missing
               SES-2 MISSING

       ses_dnr SES-2 DO NOT REMOVE

       ses_active
               SES-2 ACTIVE

       ses_enable_bb
               SES-2 ENABLE BYP B

       ses_enable_ba
               SES-2 ENABLE BYP A

       ses_devoff
               SES-2 DEVICE OFF

       ses_fault
               SES-2 FAULT

       ses_prdfail
               SES-2 PRDFAIL

   Patterns Translation
       When non SES-2 pattern is send to device in enclosure automatic translation is being done.

       locate  locate is translated to ses_ident

       locate_off
               locate_off is translated to ~ses_ident

       normal or off
               normal or off is translated to ses_ok

       ica or degraded
               ica or degraded is translated to ses_ica

       rebuild rebuild is translated to ses_rebuild

       ifa or failed_array
               ifa or failed_array is translated to ses_ifa

       hotspare
               hotspare is translated to ses_hotspare

       pfa     pfa is translated to ses_prdfail

       failure or disk_failed
               failure or disk_failed is translated to ses_fault

   List of Devices
       The application accepts a list of devices in two formats. The first format is a list with comma separated elements. The second format is a list in curly braces and elements are separated by space.
       See examples section bellow for details.

       A device is a path to file in /dev directory or in /sys/block directory.  It may identify a block device, a RAID device or a container device.  In case of a RAID device or a container device a state
       will be set for all block devices associated, respectively.

       The LEDs of devices listed in list_of_devices are set to the given pattern pattern_name and all other LEDs are turned off (unless --listed-only option is given).

OPTIONS
       -l or --log=path
               Sets a path to local log file. If this option is specified the global log file /var/log/ledctl.log is not used.

       -h or --help
               Prints this text out and exits.

       -v or --version
               Displays version of ledctl and information about the license and exits.

       -L or --list-controllers
               Prints information (system path and type) of all controllers detected by ledmon and exits.

       -x or --listed-only
               With this option ledctl will change state only on devices listed in CLI. The rest of devices will not be touched.

FILES
       /var/log/ledctl.log
               Global log file, used by all instances of ledctl application. To force logging to user defined file use -l option switch.

EXAMPLES
       The following example illustrates how to locate a single block device.

           ledctl locate=/dev/sda

       The following example illustrates how to turn Locate LED off for the same block device.

           ledctl locate_off=/dev/sda

       The following example illustrates how to locate disks of a RAID device and how to set rebuild pattern for two block devices at the same time. This example uses both formats of device list.

            ledctl locate=/dev/md127 rebuild={ /sys/block/sd[a-b] }

       The following example illustrates how to turn Status LED and Failure LED off for the given device(s).

            ledctl off={ /dev/sda /dev/sdb }

       The following example illustrates how to locate a three block devices. This example uses the first format of device list.

            ledctl locate=/dev/sda,/dev/sdb,/dev/sdc

LICENSE
       Copyright (c) 2009-2017 Intel Corporation.

       This program is distributed under the terms of the GNU General Public License as published by the Free Software Foundation. See the built-in help for details on the License and the lack of warranty.

SEE ALSO
       ledmon(8), ledmon.conf(5)

AUTHOR
       This manual page was written by Artur Wojcik <artur.wojcik@intel.com>. It may be used by others.



LEDCTL Version 0.90                                                                             February 2018                                                                                       ledctl(8)
