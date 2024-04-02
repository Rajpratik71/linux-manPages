FASTBOOT(1)                                fastboot Manuals                               FASTBOOT(1)

NAME
       fastboot - Android flashing and booting utility

SYNOPSIS
       fastboot [-w] [-u] [-s device] [-p product] [-c cmdline] [-i vendorId] [-b baseAddr] [-n page‐
       Size] [-S size[K|M|G]] command

DESCRIPTION
       WARNING: This manual might be outdated, please refer to the official documentation.

       fastboot is a command line tool for flashing an Android device,  boot  an  Android  device  to
       fastboot mode, etc..

OPTIONS
       -w     Erase userdata and cache (and format if supported by partition type).

       -u     Do not erase partition before formatting.

       -s device
              Specify device serial number or path to device port.

       -l     With devices command, list device paths."

       -p product
              Specify product name.

       -c cmdline
              Override kernel commandline.

       -i vendorId
              Specify a custom USB vendor ID.

       -b|--base baseAddr
              Specify a custom kernel base address (default: 0x10000000).

       --kernel-offset
              Specify a custom kernel offset (default: 0x00008000).

       --ramdisk-offset
              Specify a custom ramdisk offset (default: 0x01000000).

       --tags-offset offset
              Specify a custom tags offset (default: 0x00000100).

       -n|--page-size pageSize
              Specify the nand page size (default: 2048).

       -S size[K|M|G]
              Automatically sparse files greater than 'size'.  0 to disable.

       --slot suffix
              Specify slot suffix to be used if the device supports slots.  This will be added to all
              partition names that use slots.  all can be given to refer to all slots.  other can  be
              given  to  refer  to  a non-current slot.  If this flag is not used, slotted partitions
              will default to the current active slot.

       -a, --set-active[=]
              Sets the active slot.  If no suffix is provided, this will default to the  value  given
              by  --slot.   If  slots  are not supported, this does nothing.  This will run after all
              non-reboot commands.

       --wipe-and-use-fbe
              On devices which support it, erase userdata and cache, and  enable  file-based  encryp‐
              tion.

       --unbuffered
              Do not buffer input or output.

       --version
              Display version.

       -h|--help
              show this message.

COMMANDS
       fastboot update filename
              Reflash device from update.zip.

       fastboot flashall
              Flash boot, system, vendor, and (if found) recovery.

       fastboot flash partition [filename]
              Write a file to a flash partition.

       fastboot flashing lock
              Locks the device.  Prevents flashing.

       fastboot flashing unlock
              Unlocks  the  device.   Allows  flashing any partition except bootloader-related parti‐
              tions.

       fastboot flashing lock_critical
              Prevents flashing bootloader-related partitions.

       fastboot flashing unlock_critical
              Enables flashing bootloader-related partitions.

       fastboot flashing get_unlock_ability
              Queries bootloader to see if the device is unlocked.

       fastboot erase partition
              Erase a flash partition.

       fastboot format[:[fs type][:[size]] partition
              Format a flash partition.  Can override the fs type and/or size the bootloader reports.

       fastboot getvar variable
              Display a bootloader variable.

       fastboot set_active suffix
              Sets the active slot.  If slots are not supported, this does nothing.

       fastboot boot kernel [ramdisk [second]]
              Download and boot kernel.

       fastboot flash:raw boot kernel [ramdisk [second]]
              Create bootimage and flash it.

       fastboot devices [-l]
              List all connected devices (with device paths if -l is used).

       fastboot continue
              Continue with autoboot.

       fastboot reboot [bootloader]
              Reboot device [into bootloader].

       fastboot reboot-bootloader
              Reboot device into bootloader.

       fastboot help
              Show this help message.

AUTHORS
       The Android Open Source Project.

android-platform-system-core                                                              FASTBOOT(1)
