IPRCONFIG(8)                                                                               System Manager's Manual                                                                               IPRCONFIG(8)



NAME
       iprconfig - IBM Power RAID storage adapter configuration/recovery utility

SYNOPSIS
       iprconfig [-e editor] [-k dir] [-c command]

       iprconfig --version --debug --force

DESCRIPTION
       iprconfig is used to configure IBM Power RAID storage adapters, display information about them, and to perform adapter and disk unit recovery.  The menu options are:

       1. Display hardware status.
       This  option can be used to display various information regarding the IBM Power RAID adapters attached to the system and the disk units controlled by them. For each adapter and disk unit, their /dev
       name, physical location, description, vendor/product ID, and hardware status will be available. Beside each resource is an OPT field. By entering a 1 beside any resource, detailed information  about
       that resource can be obtained. For an adapter resource, this will display the adapter firmware version and the physical location amongst other things.

       2. Work with Disk Arrays
       This option will present a second menu containing disk array related commands.

       Display disk array status is used to display the status of disk arrays on the system.

       Create a disk array is used to create a disk array.

       Delete a disk array is used to delete disk arrays. Selecting this option will provide you with a list of disk arrays which can be deleted.

       Add a device to a disk array is used to include devices of similar capacity into an existing disk array. This function is currently only supported for RAID 5 and RAID 6 disk arrays.

       Format  device  for  advanced function is used to format disks to 522 bytes/sector so that they may be used in a disk array. Only disks which are not formatted for advanced function or are formatted
       for advanced function but are not known to be zeroed will be available for selection for this function.

       Format device for JBOD function (512) is used to format disks to 512 bytes/sector so that they may be used as standalone disks. Only disks which are not formatted for JBOD function or are  formatted
       for JBOD function and are in the Format Required state will be available for this function.

       Work with hot spares is used to create a hot spare which designates a device as a dedicated hot spare.  It is also used to delete a hot spare which unconfigures a previously configured hot spare.

       Work  with asymmetric access is used to select which path of a disk array will be the primary path in a dual controller environment.  Asymmetric Access must be enabled on the adapter first.  Not all
       adapters support asymmetric access and adapters that do provide support may require updated microcode.

       Force RAID Consistency Check is used to force a consistency check on a RAID array. All ipr adapters continually perform background consistency checking when idle. This option can be used to force  a
       consistency check to be performed.

       Migrate  disk array protection is used to change the RAID protection level for an array to another supported level.  In some cases, this will require adding more disks to the array.  In other cases,
       disks will be freed.

       3. Work with disk unit recovery is used to perform the following disk unit recovery actions:

       Concurrent add device is used to concurrently add a new disk to a running system. This feature is only supported with SES (SCSI Enclosure Services) packaging.

       Concurrent remove device is used to concurrently remove a disk from a running system.  This feature is only supported with SES (SCSI Enclosure Services) packaging.

       Initialize and format disk unit is used to issue a SCSI format command to attached devices. A format unit command has special meaning to the adapter and is used as a service action for certain error
       conditions.  Formatting  a  disk unit will lose all data on that drive. If the disk is attached to an ipr adapter that does not support RAID, the drive will be formatted to 512 bytes/sector.  If the
       disk is attached to an ipr RAID adapter, the block size will not be changed. To change the block size, use the format menu options under the disk arrays menu.

       Reclaim IOA cache storage is used to repair cache error conditions.  ATTENTION: Use this option with care. This is used to discard data from the cache and may result in data  loss.  This  option  is
       designed to be used by authorized IBM hardware customer engineers.

       Rebuild  disk unit data is generally used following concurrent maintenance. Select this option after a failing array member device has been replaced to reconstruct the device as an active array mem‐
       ber.

       Work with resources containing cache battery packs is used to display information regarding rechargeable cache battery packs and to force rechargeable cache battery packs into an error state so that
       they can be replaced prior to failure.  ATTENTION: Once an error has been forced on a rechargeable cache battery pack write caching will be disabled until the battery pack is replaced.

       4. Work with SCSI bus configuration is used to change configurable SCSI bus attributes, such as maximum SCSI bus speed, SCSI initiator ID, etc.

       5. Work with driver configuration is used to change driver configurable attributes, such as log_level.

       6. Work with disk configuration is used to change configurable disk attributes, such as queue depth.

       7.  Work with adapter configuration is used to change configurable adapter attributes, such as dual adapter settings.  Refer to the following command line options: primary, secondary, query-ha-mode,
       set-ha-mode, set-ioa-asymmetric-access and set-array-asymmetric-access for more information regarding these settings.

       8. Download microcode is used to download microcode to ipr adapters and attached SCSI disks.

       9. Analyze Log is an option available to analyze /var/log/messages* files. By default it will use vi as the editor to open the concatenated error log files.  This can be changed by using option 6 on
       the  Kernel Messages Log menu. Selecting option 1 on the Kernel Messages Log menu will display only the most recent errors logged by the ipr device driver and may be useful to filter out some of the
       clutter. Option 2 will display all recorded errors logged by the ipr device driver. Option 3 will display all kernel messages. Option 4 will display errors logged by the iprconfig utility. This  may
       be useful for debugging problems. Option 5 can be used to change where the tool looks to find the kernel messages files. The default is to look in /var/log.

OPTIONS
       -e editor
              Default editor for viewing error logs. The default editor is vi, but can be changed with this parameter.

       -k directory
              Kernel messages root directory. Root directory to look for kernel messages.  Default is /var/log.

       -c command
              Command line, non-interactive commands. Currently supported commands include:

              show-config
                     Show ipr configuration.

              show-alt-config
                     Show alternate ipr configuration information.

              show-ioas
                     Show all ipr adapters.

              show-arrays
                     Show all ipr arrays.

              show-battery-info [IOA]
                     Show cache battery information for specified IOA. Example:
                     iprconfig -c show-battery-info sg5

              show-details [device]
                     Show device details for specified device. Example:
                     iprconfig -c show-details sda

              show-hot-spares
                     Show all configured hot spares.

              show-af-disks
                     Show disks formatted for Advanced Function that are not configured in an array or as a hot spare.

              show-all-af-disks
                     Show all disks formatted for Advanced Function

              show-jbod-disks
                     Show all disks formatted for JBOD Function.

              show-slots
                     Show all disks slots available on the system.

              status [device]
                     Show  the  status  of  the  specified  device. This is the same status as which shows up in the last column of the Display hardware status menu. Can specify either a /dev/sdX name or a
                     /dev/sgX name. Example:
                     iprconfig -c status /dev/sda

              alt-status [device]
                     Show the status of the specified device. This is the same status as above with the exception of when a long running command is executing to the device, in which case the  percent  com‐
                     plete for the long running command is printed.

              query-raid-create [IOA]
                     Show all devices attached to the specified IOA that are candidates for being used in a RAID array. Example:
                     iprconfig -c query-raid-create sg5

              query-raid-delete [IOA]
                     Show all RAID arrays attached to the specified IOA that can be deleted.
                     iprconfig -c query-raid-delete sg5

              query-hot-spare-create [IOA]
                     Show all devices attached to the specified IOA that are candidates for being hot spares.

              query-hot-spare-delete [IOA]
                     Show all hot spares attached to the specified IOA that can be deleted.

              query-raid-consistency-check
                     Show all RAID arrays that are candidates for a RAID consistency check.

              query-format-for-jbod
                     Show all disks that can be reformatted for JBOD function.

              query-reclaim
                     Show all IOAs that may need a reclaim cache storage.

              query-arrays-raid-include
                     Show all RAID arrays that can have disks included in them to increase their capacity.

              query-devices-raid-include [array]
                     Show all disks that can be added to the specified array to increase its capacity.

              query-supported-raid-levels [IOA]
                     Show all RAID levels supported by the specified adapter.

              query-include-allowed [IOA] [raid level]
                     Some  RAID  levels allow for adding additional disks to existing disk arrays to increase their capacity. Prints "yes" to stdout if the specified RAID level supports this function, else
                     prints "no".

              query-max-devices-in-array [IOA] [raid level]
                     Print the maximum number of devices allowed in a RAID array of the specified RAID level for the specified RAID adapter.

              query-min-devices-in-array [IOA] [raid level]
                     Print the minimum number of devices allowed in a RAID array of the specified RAID level for the specified RAID adapter.

              query-min-mult-in-array [IOA] [raid level]
                     Print the minimum multiple of devices required in a RAID array of the specified RAID level for the specified RAID adapter.

              query-supp-stripe-sizes [IOA] [raid level]
                     Print all supported stripe sizes supported for RAID arrays of the specified RAID level on the specified RAID adapter. Stripe sizes are printed in units of KB.

              query-recommended-stripe-size [IOA] [raid level]
                     Print the default/recommended stripe size for RAID arrays of the specified RAID level on the specified RAID adapter. Stripe size is in units of KB.

              query-recovery-format
                     Show all disks that can be formatted for error recovery purposes.

              query-raid-rebuild
                     Show all disks in RAID arrays that can be rebuilt.

              query-format-for-raid
                     Show all disks that can be formatted such that they can be used in a RAID array or as a hot spare.

              query-ucode-level [device]
                     Show the microcode level that is currently loaded on the specified device.  Note: The device specified may be the sg device associated with an IOA, in which case  the  IOA's  microcode
                     level will be shown.

              ssd-report [device]
                     Display information about Read Intensive SSD devices in the system.

              show-ucode-levels
                     Show  the microcode level that is currently loaded for every device and adapter in the system. If newer microcode is available on the filesystem than what is loaded on the device, an *
                     chararacter will be displayed next to the device.

              query-format-timeout [device]
                     Show the current format timeout to be used when formatting the specified disk.  This value is only applicable when the device is currently in Advanced Function format.

              query-qdepth [device]
                     Show the queue depth currently being used for the specified disk.

              query-tcq-enable [device]
                     Print 1 to stdout if tagged queuing is enabled for the specified device, else print 0 to stdout.

              query-log-level [IOA]
                     Print the current log level being used for the specified IOA. Can be a number from 0 to n.

              query-add-device
                     Show all empty disk slots that can have a disk concurrently added.

              query-remove-device
                     Show all disk slots which are either empty or have disks in them which can be concurrently removed from the running system.

              query-initiator-id [IOA] [busno]
                     Show the current SCSI initiator ID used by the IOA for the specified SCSI bus.

              query-bus-speed [IOA] [busno]
                     Show the current maximum SCSI bus speed allowed on the specified SCSI bus.

              query-bus-width [IOA] [busno]
                     Show the current SCSI bus width in units of bits for the specified SCSI bus.

              query-path-status [IOA]
                     Show the current dual path state for the SAS devices attached specified IOA.

              query-path-details [device]
                     Show the current dual path details for the specified SAS device.

              query-arrays-raid-migrate
                     Show the arrays that can be migrated to a different protection level.

              query-devices-raid-migrate [array]
                     Show the AF disks that are candidates to be used in a migration for a given array.

              query-raid-levels-raid-migrate [array]
                     Show the protection levels to which the given array can be migrated.

              query-stripe-sizes-raid-migrate [array] [raid level]
                     Given an array and a protection level, show the valid stripe sizes to which the array can be migrated.

              query-devices-min-max-raid-migrate [array] [raid level]
                     Show the number of devices that will be removed for a migration to a protection level that requires fewer devices.  Or, show the minmum number of devices required, the  maximum  number
                     of devices allowed and the multiple of the number of devices required for a migration that requires more devices.

              query-ioas-asymmetric-access
                     Show the IOAs that support asymmetric access.

              query-arrays-asymmetric-access
                     Show the disk arrays that are candidates for setting their asymmetric access mode to Optimized or Non-Optimized.

              query-ioa-asymmetric-access-mode [IOA]
                     Show the current asymmetric access mode for the given IOA.

              query-array-asymmetric-access-mode [array]
                     Show the current asymmetric access mode for the given disk array.

              query-ioa-caching [IOA]
                     Show whether or not the user requested caching mode for the given IOA is set to default or disabled.

              query-array-label [label]
                     Show the device name of the array with the specified label. Label must have been specified when creating the RAID array. See raid-create command.

              query-array-rebuild-rate [IOA]
                     Show the array rebuild rate for the given IOA.

              query-array-rebuild-verify [IOA]
                     Show whether array rebuild verification is enabled for the given IOA.

              query-array [location]
                     Show the device name of the array of which one of the disks in the array has the specified platform location code.

              query-device [location]
                     Show the device name of the disk that has the specified platform location code.

              query-location [device]
                     The  device  specified can be either the device name of a disk or the device name of a single disk RAID 0 array. If the specified device name is a disk, the platform location code will
                     be displayed. If the specified device name is a single device RAID 0 array, the platform location of the disk which is a member of the specified array will be displayed.

              query-write-cache-policy [device]
                     Show the current write cache policy for [device].

              raid-create [-r raid_level] [-s stripe_size_in_kb] [-l label] [--skip-format] [-c cache_policy] [devices...]
                     Create a RAID array. RAID level can be any supported RAID level for the given adapter, such as 0, 10, 5, 6. Currently supported  stripe  sizes  in  kb  include  16,  64,  and  256.  If
                     raid_level  is  not  specified, it will default to RAID 5. If stripe size is not specified, it will default to the recommended stripe size for the selected RAID level.  Available cache
                     policies are the same that can be passed to set-write-cache-policy command.  If none is specified, write back is assumed.  Devices are  specified  with  their  full  name,  either  the
                     /dev/sd name or the /dev/sg name is acceptable. On some RAID adapters, a label can also be specified. Example array creation:
                     iprconfig -c raid-create -r 5 -s 64 /dev/sda /dev/sdb /dev/sdc
                     This would create a RAID 5 array with a 64k stripe size using the specified devices.

              raid-delete [RAID device]
                     Delete the specified RAID array. Specify either the /dev/sd name or the /dev/sg name. Only 1 array can be deleted with a single command. Example:
                     iprconfig -c raid-delete /dev/sda
                     This would delete the disk array represented by /dev/sda

              raid-include [array] [disk] ... [disk]
                     Add the specified devices to the specified disk array to increase its capacity.  Example:
                     iprconfig -c raid-include sda sg6 sg7

              raid-migrate -r raid_level [-s stripe_size_in_kb] array [disk] ... [disk]
                     Migrate an existing RAID array to a new RAID protection level.  Optionally, a new stripe size can be given.  In some cases one or more new disks must be added for the migration to suc‐
                     ceed.  Example:
                     iprconfig -c raid-migrate -r 10 -s 64 sda sg5 sg6

              format-for-raid [disk] ... [disk]
                     Format the specified disks for Advanced Function so they can be used in a RAID array or as a hot spare.

              format-for-jbod [disk] ... [disk]
                     Format the specified disks for JBOD Function so they can be used as standalone disks.

              recovery-format [disk] ... [disk]
                     Format the specified disks as directed by the reference guide for error recovery purposes.

              hot-spare-create [disk]
                     Create a hot spare using the specified Advanced Function disk.

              hot-spare-delete [disk]
                     Delete the specified hot spare.

              disrupt-device [disk]
                     Force the specified Advanced Function device failed.

              reclaim-cache [IOA]
                     Reclaim the specified IOA's write cache.  ATTENTION: Use this option with care. This is used to discard data from the cache and may result in data loss. This option is designed  to  be
                     used by authorized IBM hardware customer engineers.

              reclaim-unknown-cache [IOA]
                     Reclaim  the  specified  IOA's write cache and allow unknown data loss.  ATTENTION: Use this option with care. This is used to discard data from the cache and WILL result in data loss.
                     This option is designed to be used by authorized IBM hardware customer engineers.

              raid-consistency-check [array]
                     Force a full RAID consistency check on the specified array. This command will return before the RAID consistency check has completed. Use the status command to check the status of  the
                     command.

              raid-rebuild [disk]
                     Following a disk replacement for a failed disk in a RAID array, use this command to rebuild the failed disk's data onto the new disk and return the disk array to the Active state.

              update-ucode [device] [microcode file]
                     Update  the  microcode  on  the  specified  device (IOA or disk) with the specified microcode file.  ATTENTION: Limited checking of the microcode image is done. Make sure the specified
                     microcode file is the correct file for the specified device.

              update-all-ucodes
                     Update the microcode of every device with the latest version found in the system.

              set-format-timeout [disk] [timeout in hours]
                     Set the format timeout to be used when formatting the specified disk.

              set-qdepth [device] [queue depth]
                     Set the queue depth for the specified device or disk array.

              set-tcq-enable [device] [0 = disable, 1 = enable]
                     Enable/disable tagged command queueing for the specified device.

              set-log-level [IOA] [log level]
                     Set the error logging verbosity to use for the specified IOA.  Default is 2.

              set-write-cache-policy [device] [writeback|writethrough]
                     Set the write cache policy for [device]. Available policies are writeback and writethrough.  This command supports JBOD disk (write cache) and Volume Sets (vset write cache).  Example:
                     iprconfig -c set-write-cache-policy sdp writeback

              identify-disk [disk] [0 = turn off identify LED, 1 = turn on identify LED]
                     Turn on/off the disk identify LED for the specified disk. This function may or may not be available depending on the hardware packaging.

              identify-slot [location] [0 = turn off identify LED, 1 = turn on identify LED]
                     Turn on/off the disk identify LED for the specified location. This function may or may not be available depending on the hardware packaging. Example:
                     iprconfig -c identify-slot 0000:d8:01.0/0:1:1: 1

              remove-disk [disk] [0 = turn off identify LED, 1 = turn on identify LED]
                     Turn on/off the disk remove identify LED for the specified device. When 1 is specified as the second argument, the specified disk is set to the remove state. When in  this  state,  the
                     disk  may  be  removed. Once the disk has been physically removed, iprconfig must be invoked again with the second argument set to 0. This turns off the slot identifier light and logi‐
                     cally removes the disk from the host operating system.

              remove-slot [location] [0 = turn off identify LED, 1 = turn on identify LED]
                     Turn on/off the disk remove identify LED for the specified location. When 1 is specified as the second argument, the specified location is set to the remove state. When in this  state,
                     the disk may be removed. Once the disk has been physically removed, iprconfig must be invoked again with the second argument set to 0. This turns off the slot identifier light and log‐
                     ically removes the disk from the host operating system. Example:
                     iprconfig -c remove-slot 0000:d8:01.0/0:1:1: 1

              add-slot [location] [0 = turn off identify LED, 1 = turn on identify LED]
                     Turn on/off the disk insert identify LED for the specified location. When 1 is specified as the second argument, the specified location is set to the insert state. When in this  state,
                     the  disk  may  be inserted. Once the disk has been physically inserted, iprconfig must be invoked again with the second argument set to 0. This turns off the slot identifier light and
                     logically adds the disk to the host operating system. Example:
                     iprconfig -c add-slot 0000:d8:01.0/0:1:1: 1

              set-initiator-id [IOA] [busno] [initiator id]
                     Set the IOA's SCSI initiator ID for the specified bus. Must be a value between 0 and 7 and must not conflict with any other device on the SCSI bus.

              set-bus-speed [IOA] [busno] [speed in MB/sec]
                     Set the maximum SCSI bus speed allowed on the specified SCSI bus.

              set-bus-width [IOA] [busno] [bus width in # bits]
                     Set the SCSI bus width to use for the specified SCSI bus. Example:
                     iprconfig -c set-bus-width sg5 0 16

              primary [IOA]
                     Set the adapter as the preferred primary adapter. This is used in dual initiator RAID configurations to indicate which adapter should be the primary adapter. The primary adapter should
                     be the adapter receiving the majority of the I/O. Example:
                     iprconfig -c primary sg5

              secondary [IOA]
                     Set the adapter to indicate it is not the preferred primary adapter. See the notes for the preferred primary for additional information. Example:
                     iprconfig -c secondary sg5

              set-all-primary
                     Set  all attached ipr adapters as the preferred primary adapter. This can be used when running a dual initiator RAID HA configuration.  This command can be run on the primary system to
                     quickly enable the preferred primary mode for all attached adapters. Refer to /etc/ha.d/resource.d/iprha for an example of how this might be used. Example:
                     iprconfig -c set-all-primary

              set-all-secondary
                     Set all attached ipr adapters to indicate they are not the preferred primary adapter. Example:
                     iprconfig -c set-all-secondary

              query-ha-mode [IOA]
                     When an adapter is configured in a highly available dual adapter configuration, it may be able to be configured in one of two ways. The default mode is Normal.  This mode is  used  for
                     all SCSI adapters and many SAS adapters.  Some SAS adapters also support a JBOD dual adapter configuration. This mode is to be used when the dual adapter configuration is to consist of
                     JBOD disks rather than RAID arrays. If the adapter is NOT going to be used in a dual adapter configuration, this mode MUST be set to Normal.  Example:
                     iprconfig -c query-ha-mode sg5

              set-ha-mode [IOA] [Normal | RAID]
                     Used to set the high-availability mode of the adapter. Refer to the query-ha-mode command for more information regarding these settings. Example:
                     iprconfig -c set-ha-mode sg5 Normal

              set-array-asymmetric-access-mode [array] [Optimized | Non-Optimized]
                     Used to set the asymmetric access mode of the disk array.  Example:
                     iprconfig -c set-array-asymmetric-access-mode sda Optimized

              set-ioa-asymmetric-access-mode [IOA] [Enabled | Disabled]
                     Used to set the asymmetric access mode of the IOA.
                     Example:
                     iprconfig -c set-ioa-asymmetric-access-mode sg5 Enabled

              set-ioa-caching [IOA] [Default | Disabled]
                     Used to set the requested caching mode of the IOA.
                     Example:
                     iprconfig -c set-ioa-caching sg5 Disabled

              set-array-rebuild-verify [IOA] [enable | disable | default]
                     Used to define whether to perform verification during an array rebuild.  Enabling this can affect performance.  The default value is disabled.
                     Example:
                     iprconfig -c set-array-rebuild-rate sg5 disable

              set-array-rebuild-rate [IOA] [Rebuild Rate | default]
                     Used to set the rebuilt rate ratio of the IOA. [Rebuild Rate] must be in range 10..100. If 'default' is used, the IOA will reset to the implementation default rate.  The value actually
                     configured may not be the exact rate configured by the user, but an approximation to the closest rate supported by the IOA.
                     Example:
                     iprconfig -c set-array-rebuild-rate sg5 10

              get-live-dump [IOA]
                     Dump the IOA's implementation unique critical information. The dump data will be saved in the /var/log/ directory with the pattern ipr-CCIN-PCI_ADDRESS-dump-TIMESTAMP.
                     Example:
                     iprconfig -c get-live-dump sg5

              dump   Display detailed hardware and system information on standard output.  In case a report file is needed, the iprsos command will create one at /var/log/iprsos.log.
                     Example:
                     iprconfig -c dump

       --version
              Print version number of iprconfig

       --debug
              Enable additional error logging. Enabling this will result in additional errors logging to /var/log/messages.

       --force
              Disable  safety  checks. Use this to disable safety checks in iprconfig.  This will allow you to format devices that are not at the appropriate code levels. Only use this option if you really
              know what you are doing.

AUTHOR
       Brian King <brking@us.ibm.com>

NOTES
       Notes on using under iSeries 5250 telnet

       Only use this utility across 5250 telnet when there are no other options available to you. Since there may be occasions when 5250 telnet is your only option to access  your  iSeries  Linux  console,
       every attempt has been made to make this utility usable under 5250 telnet. By following a few guidelines, you can make your 5250 telnet experience more productive and much less frustrating.

       1.  First of all, it will be helpful to know how the keys are mapped under 5250 telnet. From the 5250 telnet window, hit ESC. This will get you to the Send TELNET Control Functions menu. Take option
       6 to display the keyboard map. Take note of how TAB, ESC, CTLC, and SENDWOCR are bound. They will be useful in the future.

       2. When selecting menu options, enter the menu number, followed by the enter key, same as usual.

       3. When typing single character commands (eg. r=Refresh), type the single character followed by the SENDWOCR key (F11 by default).

       4. When on a device/array/IOA selection screen (eg. Display Disk Unit Details), do NOT use the arrow keys to navigate. Instead use the TAB key (F7 by default) to navigate these screens.

       5. Beware of the backspace and delete keys. As a rule do NOT use them.

       6. When editing the root kernel message log directory or the default editor, you may use the arrow keys, but not the backspace and delete keys. Use the space bar to remove already typed characters.



                                                                                                 August 2009                                                                                     IPRCONFIG(8)
