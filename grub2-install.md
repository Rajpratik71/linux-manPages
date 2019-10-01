GRUB-INSTALL(1)                                                                            General Commands Manual                                                                            GRUB-INSTALL(1)



NAME
       grub-install — Install GRUB on a device.


SYNOPSIS
       grub-install [--modules=MODULES] [--install-modules=MODULES]
                     [--themes=THEMES] [--fonts=FONTS] [--locales=LOCALES]
                     [--compress[=no,xz,gz,lzo]] [-d | --directory=DIR]
                     [--grub-mkimage=FILE] [--boot-directory=DIR]
                     [--target=TARGET] [--grub-setup=FILE]
                     [--grub-mkrelpath=FILE] [--grub-probe=FILE]
                     [--allow-floppy] [--recheck] [--force] [--force-file-id]
                     [--disk-module=MODULE] [--no-nvram] [--removable]
                     [--bootloader-id=ID] [--efi-directory=DIR] INSTALL_DEVICE


DESCRIPTION
       grub-install installs GRUB onto a device.  This includes copying GRUB images into the target directory (generally /boot/grub), and on some platforms may also include installing GRUB onto a boot sec‐
       tor.


OPTIONS
       --modules=MODULES
              Pre-load modules specified by MODULES.


       --install-modules=MODULES
              Install only MODULES and their dependencies.  The default is to install all available modules.


       --themes=THEMES
              Install THEMES.  The default is to install the starfield theme, if available.


       --fonts=FONTS
              Install FONTS.  The default is to install the unicode font.


       --locales=LOCALES
              Install only locales listed in LOCALES.  The default is to install all available locales.


       --compress=no,xz,gz,lzo
              Compress GRUB files using the specified compression algorithm.


       --directory=DIR
              Use images and modules in DIR.


       --grub-mkimage=FILE
              Use FILE as grub-mkimage.  The default is /usr/bin/grub-mkimage.


       --boot-directory=DIR
              Use DIR as the boot directory.  The default is /boot.  GRUB will put its files in a subdirectory of this directory named grub.


       --target=TARGET
              Install GRUB for TARGET platform.  The default is the platform grub-install is running on.


       --grub-setup=FILE
              Use FILE as grub-setup.  The default is /usr/bin/grub-setup.


       --grub-mkrelpath=FILE
              Use FILE as grub-mkrelpath.  The default is /usr/bin/grub-mkrelpath.


       --grub-probe=FILE
              Use FILE as grub-probe.  The default is /usr/bin/grub-mkrelpath.


       --allow-floppy
              Make the device also bootable as a floppy.  This option is the default for /dev/fdX devices. Some BIOSes will not boot images created with this option.


       --recheck
              Delete any existing device map and create a new one if necessary.


       --force
              Install even if problems are detected.


       --force-file-id
              Use identifier file even if UUID is available.


       --disk-module=MODULE
              Use MODULE for disk access.  This allows you to manually specify either biosdisk or native disk access.  This option is only available on the BIOS target platform.


       --no-nvram
              Do not update the boot-device NVRAM variable.  This option is only available on IEEE1275 target platforms.


       --removable
              Treat the target device as if it is removeable.  This option is only available on the EFI target platform.


       --bootloader-id=ID
              Use ID as the bootloader ID.  This opption is only available on the EFI target platform.


       --efi-directory=DIR
              Use DIR as the EFI System Partition root.  This opption is only available on the EFI ta rget platform.


       INSTALL_DEVICE
              Install GRUB to the block device INSTALL_DEVICE.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                                GRUB-INSTALL(1)
