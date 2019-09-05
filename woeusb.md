woeusb(1)                                                       WoeUSB User Manual                                                       woeusb(1)

NAME
       woeusb - Bootable Windows installation/PE USB storage creator

SYNOPSIS
       woeusb [OPTIONS] --device|--partition source_media target_media

DESCRIPTION
       woeusb is a command-line utility that enables you to create your own bootable Windows installation USB storage device from an existing Win‐
       dows Installation DVD or its ISO image.

       It mainly extracts all files from source_media to target_media , then installs GNU GRUB bootloader and a small  configuration  into  it  to
       support chainloading Windows BOOTMGR.

       It also supports UEFI bootstrap scheme, however in this case Windows UEFI bootloader is used instead.

COMMAND-LINE OPTIONS
   CREATION METHOD
       --device / -d source_media target_device
              Drop  target_device  ´s  partition  table(if there's any), create a new PC/Legacy/MBR partition table, create a FAT32/NTFS partition
              spanning (almost) the entire disk, then setup bootable Windows on it.

              WARNING: ALL PREVIOUS DATA ON target_device WILL BE DROPPED!

       --partition / -p source_media target_partition
              Mount target_partition ´s file system, extracts all files from source_media into it, then make it bootable.

              WARNING: ALL FILES EXISTING ON target_partition WITH THE SAME FILENAME IN source_media WILL BE OVERWRITTEN!

   MISCELLANEOUS
       --help / -h
              Print application help message

       --version / -V
              Print application version

       --about / -ab
              Print info about this application

       --verbose / -v
              Be more verbose

       --debug
              Enable script debugging

       --no-color
              Disable message coloring

       --label / -l filesystem_label
              Specify label for the newly created file system in --device creation method

              Note that the label is not verified for validity and may be illegal for the filesystem

       --workaround-bios-boot-flag
              Apply workaround for buggy BIOSes that doesn't consider a device bootable if none of its partition's boot flag is toggled.

       --debugging-internal-function-call function_name (function_parameters...)
              Development option for developers to test certain function without running the entire build

       --target-filesystem / --tgt-fs filesystem_name
              Specify the filesystem to use as the target partition's filesystem.  Currently supported: FAT(default)/NTFS

EXAMPLES
       We love examples!

       Completely DESTROY all previous data on a USB storage device, recreate the partition table and  the  target  partition,  copy  the  Windows
       files, and make it bootable
       # woeusb --device win7_amd64.iso /dev/sdX
       # woeusb --device /dev/sr0 /dev/sdX

       Copy Windows files to an existing FAT partition of a USB storage device and make it bootable
       # woeusb --partition win7_amd64.iso /dev/sdX1
       # woeusb --partition /dev/sr0 /dev/sdX1

EXIT STATUS
       0 when success, 1 (and non-zero if there's any) when failure

BUGS
       Refer to our issue tracker ⟨https://github.com/slacka/WoeUSB/issues⟩ for any known issues

SEE ALSO
       woeusbgui(1)

AUTHORS
       Colin GILLE / congelli501 <colingille@hotmail.com>
       林博仁 <Buo.Ren.Lin@gmail.com>

WoeUSB                                                          @@WOEUSB_VERSION@@                                                       woeusb(1)
