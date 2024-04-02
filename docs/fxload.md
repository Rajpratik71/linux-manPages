FXLOAD(8)                                                                                 Linux Programmer's Manual                                                                                 FXLOAD(8)



NAME
       fxload - Firmware download to EZ-USB devices

SYNOPSIS
       fxload [ -v ] [ -D devpath ] [ -I hexfile ] [ -2 ] [ -t type ] [ -c config ] [ -s loader ]
       fxload [ -D devpath ] [ -L link ] [ -m mode ]
       fxload [ -V ] [ -? ]

DESCRIPTION
       fxload  is  a program which downloads firmware to USB devices based on AnchorChips EZ-USB, Cypress EZ-USB FX, or Cypress EZ-USB FX2 microcontrollers.  These have 8-bit 8051 cores with special exten‐
       sions for USB I/O.  The FX2 supports high speed USB 2.0 transfers (480 Mbit/sec) as well as full speed USB 1.1 transfers (12 Mbit/sec), while the earlier parts supports only  full  speed  transfers.
       These controllers have several package options, and can be set up with external memory (on-chip memory is usually about 8K), EEPROMs, and ROMs when device costs allow.

       This  uses  "usbfs"  (older  name:  "usbdevfs") to access devices, and issues vendor specific control requests to download and reset the EZ-USB devices.  Normally, firmware will then "renumerate" by
       disconnecting from USB and then reconnecting as a new device.  It then appears with new device descriptors and functionality, as provided by the firmware which has been downloaded.

       To support some non-firmware applications, this can also set up symbolic links for those usbfs names.  It can also change their access modes.  Both of these can help simplify  software  applications
       that need to talk to USB devices using user mode drivers, don't want to run with privileges or to examine all of the existing USB devices, and which don't need more kernel drivers.

       See  the  Linux-Hotplug web site for information about how to use fxload to download device firmware when hotplugging USB devices, using driver-specific scripts stored in the /etc/hotplug/usb direc‐
       tory.

FUNCTION LETTERS
       At least one of the following options must be specified.  Note that as usual with UNIX and Linux commands, the order of command option flags does not matter.  You may use these in any order.

       -I hexfile
              Downloads the specified firmware file.  This firmware is provided in standard Intel hexfile format.  (Common naming conventions include *.hex and *.ihx.)  Depending on the device and firmware
              in  use,  the -s option may also be necessary to specify a second stage loader.  Firmware is normally downloaded to RAM and executed, but there is also an option for downloading into bootable
              I2C EEPROMs.

       -L link
              Creates the specified symbolic link to the usbfs device path.  This would typically be used to create a name in a directory that would be searched by an application.   The  symlink  would  be
              removed by some other component on device unplug.

       -m mode
              Changes permissions on the "usbfs" device node.  By default, those nodes are only accessible by privileged users, which doesn't help when the user mode device driver needs to run without root
              privileges.  Note that usbfs mount options like devmode=0666 are also available.

       -V     Identifies the version of fxload being invoked, and exits without performing other actions.

       -?     Show usage.

       Note that when downloading firmware that renumerates, there's no point in changing the device permissions or creating a symbolic link.

OPTIONS
       By default, fxload assumes the device uses an EZ-USB or EZ-USB FX.  It also assumes that the device in question has been specified by USB kernel hotplugging conventions, using the DEVICE environment
       variable to name a "usbfs" file that can be used to talk to the device.

       -c config
              Indicates  the  specified  firmware  should  be downloaded to an I2C boot EEPROM rather than to RAM.  The parameter is the EZ-USB FX or FX2 configuration byte, and for AnchorChips devices the
              value should be zero.  This requires a second stage loader that knows how to write to I2C EEPROMs specified using the -s option, as well as a device  that's  provided  with  an  EEPROM  large
              enough to store the boot firmware.  After downloading to a device's EEPROM, you should retest it starting from power off.

       -s loader
              This identifies the hex file holding a second stage loader (in the same hex file format as the firmware itself), which is loaded into internal memory.  This loader understands additional ven‐
              dor control requests, beyond the one built into all EZ-USB hardware, which are needed to write external RAM or EEPROM.  As a last step when loading firmware, fxload normally  overwrites  this
              second stage loader with parts of the firmware residing on-chip.

       -2     Same as "-t fx2".

       -t type
              Indicates  which  type  of microcontroller is used in the device; type may be one of an21 (the original AnchorChips devices), fx (Cypress' updated version, the EZ-USB FX), or fx2 (the Cypress
              EZ-USB FX2, supporting high speed transfers).  Except when writing to EEPROM, all that normally matters when downloading firmware is whether or not the device uses an FX2.

       -v     Prints some diagnostics, such as download addresses and sizes, to standard error.  Repeat the flag (-vv, -vvv) to get more diagnostics.

       -D devpath
              Specifies the "usbfs" path name for the device in question, such as /proc/bus/usb/004/080.  This takes precedence over any DEVICE environment variable that may be set.

NOTES
       This program implements one extension to the standard "hex file" format.  Lines beginning with a "#" character are ignored, and may be used to hold copyright statements and other information.  Other
       tools may not handle hexfiles using this extension.

       At  this  writing, "usbfs" is a kernel configuration option.  That means that device drivers relying on user mode firmware downloading may need to depend on that kernel configuration option.  A less
       preferable alternative involves compiling the firmware into the kernel and managing downloads and renumeration there.  This is less preferable in part because much device firmware is  provided  with
       GPL-incompatible licensing, and in part because storing such firmware firmware wastes kernel memory.

       For EZ-USB family devices, the hardware's first stage loader (supporting the 0xA0 vendor request) can't write into external memory.  Configurations that put firmware into external memory thus need a
       second stage loader.  For typical "flat" memory architectures, a loader supporting the 0xA3 vendor request is used to write into that memory.  Similarly, a second stage loader that supports the 0xA2
       vendor  request  is  needed when writing boot firmware into an I2C EEPROM.  These 0xA2 and 0xA3 vendor commands are conventions defined by Cypress.  Devices that use bank switching or similar mecha‐
       nisms to stretch the 64KByte address space may need different approach to loading firmware.

       Not all devices support EEPROM updates.  Some EZ-USB based devices don't have an I2C EEPROM; many such EEPROMs are too small to store firmware; and some firmware can't be placed in bootable I2C EEP‐
       ROMs.

ENVIRONMENT VARIABLES
       DEVICE normally names a "usbfs" file that will be used to talk to the device.  This is provided by the Linux kernel as part of USB hotplugging.

SEE ALSO
       hotplug(8)

AUTHORS
       Linux Hotplugging Project http://linux-hotplug.sourceforge.net/



                                                                                                  April 2002                                                                                        FXLOAD(8)
