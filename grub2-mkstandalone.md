GRUB-MKSTANDALONE(3)                                                                       Library Functions Manual                                                                      GRUB-MKSTANDALONE(3)



NAME
       grub-mkstandalone — Generate a standalone image in the selected format.


SYNOPSIS
       grub-mkstandalone [-o | --output=FILE] [-O | --format=FORMAT]
                          [-C | --compression=(xz|none|auto)]
                          [--modules=MODULES] [--install-modules=MODULES]
                          [--themes=THEMES] [--fonts=FONTS]
                          [--locales=LOCALES] [--compress[=no,xz,gz,lzo]]
                          [-d | --directory=DIR] [--grub-mkimage=FILE]
                          SOURCE...


DESCRIPTION
OPTIONS
       --output=FILE
              Write the generated file to FILE.  The default is to write to standard output.


       --format=FORMAT
              Generate an image in the specified FORMAT.  Valid values are:

                  i386-coreboot, i386-multiboot, i386-pc, i386-pc-pxe, i386-efi, i386-ieee1275, i386-qemu, x86_64-efi, mipsel-yeeloong-flash, mipsel-fuloong2f-flash, mipself-loongson-elf, powerpc-ieee1275,
                  sparc64-ieee1275-raw, sparc64-ieee1275-cdcore, sparc64-ieee1275-aout, ia64-efi, mips-arc, mipsel-arc, mipsel-qemu_mips-elf, mips-qemu_mips-flash,  mipsel-qemu_mips-flash,  mips-qemu_mips-
                  elf


       --compression=(xz|none|auto)
              Use one of xz, none, or auto as the compression method for the core image.


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


       --compress[=no,xz,gz,lzo]
              Compress GRUB files using the specified compression algorithm.


       --directory=DIR
              Use images and modules in DIR.


       --grub-mkimage=FILE
              Use FILE as grub-mkimage.  The default is /usr/bin/grub-mkimage.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                           GRUB-MKSTANDALONE(3)
