GRUB-INSTALL(8)                                                                      System Administration Utilities                                                                      GRUB-INSTALL(8)

NAME
       grub-install - install GRUB to a device

SYNOPSIS
       grub-install [OPTION...] [OPTION] [INSTALL_DEVICE]

DESCRIPTION
       Install GRUB on your drive.

       --compress[=no,xz,gz,lzo]
              compress GRUB files [optional]

       -d, --directory=DIR
              use images and modules under DIR [default=/usr/lib/grub/<platform>]

       --fonts=FONTS
              install FONTS [default=unicode]

       --install-modules=MODULES
              install only MODULES and their dependencies [default=all]

       -k, --pubkey=FILE
              embed FILE as public key for signature checking

       --locale-directory=DIR use translations under DIR
              [default=/usr/share/locale]

       --locales=LOCALES
              install only LOCALES [default=all]

       --modules=MODULES
              pre-load specified modules MODULES

       --themes=THEMES
              install THEMES [default=starfield]

       -v, --verbose
              print verbose messages.

       --allow-floppy
              make the drive also bootable as floppy (default for fdX devices). May break on some BIOSes.

       --boot-directory=DIR
              install GRUB images under the directory DIR/grub instead of the boot/grub directory

       --bootloader-id=ID
              the ID of bootloader. This option is only available on EFI and Macs.

       --core-compress=xz|none|auto
              choose the compression to use for core image

       --disk-module=MODULE
              disk module to use (biosdisk or native). This option is only available on BIOS target.

       --efi-directory=DIR
              use DIR as the EFI System Partition root.

       --force
              install even if problems are detected

       --force-extra-removable
              force installation to the removable media path also. This option is only available on EFI.

       --force-file-id
              use identifier file even if UUID is available

       --label-bgcolor=COLOR
              use COLOR for label background

       --label-color=COLOR
              use COLOR for label

       --label-font=FILE
              use FILE as font for label

       --macppc-directory=DIR use DIR for PPC MAC install.

       --no-bootsector
              do not install bootsector

       --no-nvram
              don't update the `boot-device'/`Boot*' NVRAM variables. This option is only available on EFI and IEEE1275 targets.

       --no-rs-codes
              Do not apply any reed-solomon codes when embedding core.img. This option is only available on x86 BIOS targets.

       --no-uefi-secure-boot
              do not install an image usable with UEFI Secure Boot, even if the system was currently started using it. This option is only available on EFI.

       --product-version=STRING
              use STRING as product version

       --recheck
              delete device map if it already exists

       --removable
              the installation device is removable. This option is only available on EFI.

       -s, --skip-fs-probe
              do not probe for filesystems in DEVICE

              Usage: grub-install [OPTION...] [OPTION] [INSTALL_DEVICE]

       Install GRUB on your drive.

       --compress[=no,xz,gz,lzo]
              compress GRUB files [optional]

       -d, --directory=DIR
              use images and modules under DIR [default=/usr/lib/grub/<platform>]

       --fonts=FONTS
              install FONTS [default=unicode]

       --install-modules=MODULES
              install only MODULES and their dependencies [default=all]

       -k, --pubkey=FILE
              embed FILE as public key for signature checking

       --locale-directory=DIR use translations under DIR
              [default=/usr/share/locale]

       --locales=LOCALES
              install only LOCALES [default=all]

       --modules=MODULES
              pre-load specified modules MODULES

       --themes=THEMES
              install THEMES [default=starfield]

       -v, --verbose
              print verbose messages.

       --allow-floppy
              make the drive also bootable as floppy (default for fdX devices). May break on some BIOSes.

       --boot-directory=DIR
              install GRUB images under the directory DIR/grub instead of the boot/grub directory

       --bootloader-id=ID
              the ID of bootloader. This option is only available on EFI and Macs.

       --core-compress=xz|none|auto
              choose the compression to use for core image

       --disk-module=MODULE
              disk module to use (biosdisk or native). This option is only available on BIOS target.

       --efi-directory=DIR
              use DIR as the EFI System Partition root.

       --force
              install even if problems are detected

       --force-extra-removable
              force installation to the removable media path also. This option is only available on EFI.

       --force-file-id
              use identifier file even if UUID is available

       --label-bgcolor=COLOR
              use COLOR for label background

       --label-color=COLOR
              use COLOR for label

       --label-font=FILE
              use FILE as font for label

       --macppc-directory=DIR use DIR for PPC MAC install.

       --no-bootsector
              do not install bootsector

       --no-nvram
              don't update the `boot-device'/`Boot*' NVRAM variables. This option is only available on EFI and IEEE1275 targets.

       --no-rs-codes
              Do not apply any reed-solomon codes when embedding core.img. This option is only available on x86 BIOS targets.

       --no-uefi-secure-boot
              do not install an image usable with UEFI Secure Boot, even if the system was currently started using it. This option is only available on EFI.

       --product-version=STRING
              use STRING as product version

       --recheck
              delete device map if it already exists

       --removable
              the installation device is removable. This option is only available on EFI.

       -s, --skip-fs-probe
              do not probe for filesystems in DEVICE

       --target=TARGET
              install GRUB for TARGET platform [default=i386-pc]

       --uefi-secure-boot
              install an image usable with UEFI Secure Boot.  This option is only available on EFI and if the grub-efi-amd64-signed package is installed.

       -?, --help
              give this help list

       --usage
              give a short usage message

       -V, --version
              print program version

       Mandatory or optional arguments to long options are also mandatory or optional for any corresponding short options.

       INSTALL_DEVICE must be system device filename.  grub-install copies GRUB images into boot/grub.  On some platforms, it may also install GRUB into the boot sector.

REPORTING BUGS
       Report bugs to <bug-grub@gnu.org>.

SEE ALSO
       grub-mkconfig(8), grub-mkimage(1), grub-mkrescue(1)

       The full documentation for grub-install is maintained as a Texinfo manual.  If the info and grub-install programs are properly installed at your site, the command

              info grub-install

       should give you access to the complete manual.

grub-install (GRUB) 2.02~beta2-36ubuntu3.23                                                    October 2019                                                                               GRUB-INSTALL(8)
