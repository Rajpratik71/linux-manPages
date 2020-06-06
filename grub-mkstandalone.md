GRUB-MKSTANDALONE(1)                                                                          User Commands                                                                          GRUB-MKSTANDALONE(1)

NAME
       grub-mkstandalone - make a memdisk-based GRUB image

SYNOPSIS
       grub-mkstandalone [OPTION...] [OPTION] SOURCE...

DESCRIPTION
       Generate a standalone image (containing all modules) in the selected format

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

       --core-compress=xz|none|auto
              choose the compression to use for core image

       -o, --output=FILE
              save output in FILE [required]

       -O, --format=FILE
              generate an image in FORMAT available formats: i386-coreboot, i386-multiboot, i386-pc, i386-pc-pxe, i386-pc-eltorito, i386-efi, i386-ieee1275, i386-qemu, x86_64-efi, i386-xen, x86_64-xen,
              mipsel-yeeloong-flash, mipsel-fuloong2f-flash, mipsel-loongson-elf, powerpc-ieee1275, sparc64-ieee1275-raw, sparc64-ieee1275-cdcore, sparc64-ieee1275-aout, ia64-efi, mips-arc, mipsel-arc,
              mipsel-qemu_mips-elf, mips-qemu_mips-flash, mipsel-qemu_mips-flash, mips-qemu_mips-elf, arm-uboot, arm-efi, arm64-efi

       -?, --help
              give this help list

       --usage
              give a short usage message

       -V, --version
              print program version

       Mandatory or optional arguments to long options are also mandatory or optional for any corresponding short options.

       Graft point syntax (E.g. /boot/grub/grub.cfg=./grub.cfg) is accepted

REPORTING BUGS
       Report bugs to <bug-grub@gnu.org>.

SEE ALSO
       grub-mkimage(1)

       The full documentation for grub-mkstandalone is maintained as a Texinfo manual.  If the info and grub-mkstandalone programs are properly installed at your site, the command

              info grub-mkstandalone

       should give you access to the complete manual.

grub-mkstandalone (GRUB) 2.02~beta2-36ubuntu3.23                                               October 2019                                                                          GRUB-MKSTANDALONE(1)
