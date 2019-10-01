GRUB-MKIMAGE(1)                                                                            General Commands Manual                                                                            GRUB-MKIMAGE(1)



NAME
       grub-mkimage — Make a bootable GRUB image.


SYNOPSIS
       grub-mkimage [-c | --config=FILE] [-C | --compression=(xz,none,auto)]
                     [-d | --directory=DIR] [-k | --pubkey=FILE]
                     [-m | --memdisk=FILE] [-n | --note] [-o | --output=FILE]
                     [-O | --format=FORMAT] [-p | --prefix=DIR]
                     [-v | --verbose] MODULES


DESCRIPTION
       grub-mkimage builds a bootable image of GRUB.


OPTIONS
       --config=FILE
              Embed FILE as the image's initial configuration file.


       --compression=(xz,none,auto)
              Use one of xz, none, or auto as the compression method for the core image.


       --directory=DIR
              Use images and modules from DIR.  The default value is /usr/lib/grub/<platform>.


       --pubkey=FILE
              Embed the public key FILE for signature checking.


       --memdisk=FILE
              Embed the memdisk image FILE.  If no -p option is also specified, this implies -p (memdisk)/boot/grub.


       --note Add a CHRP NOTE section.  This option is only valid on IEEE1275 platforms.


       --output=FILE
              Write the generated file to FILE.  The default is to write to standard output.


       --format=FORMAT
              Generate an image in the specified FORMAT.  Valid values are:

                  i386-coreboot, i386-multiboot, i386-pc, i386-pc-pxe, i386-efi, i386-ieee1275, i386-qemu, x86_64-efi, mipsel-yeeloong-flash, mipsel-fuloong2f-flash, mipself-loongson-elf, powerpc-ieee1275,
                  sparc64-ieee1275-raw, sparc64-ieee1275-cdcore, sparc64-ieee1275-aout, ia64-efi, mips-arc, mipsel-arc, mipsel-qemu_mips-elf, mips-qemu_mips-flash,  mipsel-qemu_mips-flash,  mips-qemu_mips-
                  elf


       --prefix=DIR
              Set prefix directory.  The default value is /boot/grub.


       --verbose
              Print verbose messages.


       MODULES
              Include MODULES.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                                GRUB-MKIMAGE(1)
