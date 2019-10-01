GRUB-BIOS-SETUP(3)                                                                         Library Functions Manual                                                                        GRUB-BIOS-SETUP(3)



NAME
       grub-bios-setup — Set up images to boot from a device.


SYNOPSIS
       grub-bios-setup [-a | --allow-floppy] [-b | --boot-image=FILE]
                        [-c | --core-image=FILE] [-d | --directory=DIR]
                        [-f | --force] [-m | --device-map=FILE]
                        [-s | --skip-fs-probe] [-v | --verbose] DEVICE


DESCRIPTION
       You should not normally run this program directly.  Use grub-install instead.


OPTIONS
       --allow-floppy
              Make the device also bootable as a floppy.  This option is the default for /dev/fdX devices.  Some BIOSes will not boot images created with this option.


       --boot-image=FILE
              Use FILE as the boot image.  The default value is boot.img.


       --core-image=FILE
              Use FILE as ther core image.  The default value is core.img.


       --directory=DIR
              Use GRUB files in the directory DIR.  The default value is /boot/grub.


       --force
              Install even if problems are detected.


       --device-map=FILE
              Use FILE as the device map.  The default value is /boot/grub/device.map .


       --skip-fs-probe
              Do not probe DEVICE for filesystems.


       --verbose
              Print verbose messages.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                             GRUB-BIOS-SETUP(3)
