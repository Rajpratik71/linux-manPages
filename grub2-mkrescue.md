GRUB-MKRESCUE(3)                                                                           Library Functions Manual                                                                          GRUB-MKRESCUE(3)



NAME
       grub-mkrescue — Generate a GRUB rescue image using GNU Xorriso.


SYNOPSIS
       grub-mkrescue [-o | --output=FILE] [--modules=MODULES]
                      [--install-modules=MODULES] [--themes=THEMES]
                      [--fonts=FONTS] [--locales=LOCALES]
                      [--compress[=no,xz,gz,lzo]] [-d | --directory=DIR]
                      [--grub-mkimage=FILE] [--rom-directory=DIR]
                      [--xorriso=FILE] [--grub-glue-efi=FILE]
                      [--grub-render-label=FILE] [--label-font=FILE]
                      [--label-color=COLOR] [--label-bgcolor=FILE]
                      [--product-name=STRING] [--product-version=STRING]
                      [--sparc-boot] [--arcs-boot]


DESCRIPTION
       grub-mkrescue can be used to generate a rescue image with the GRUB bootloader.


OPTIONS
       --output=FILE
              Write the generated file to FILE.  The default is to write to standard output.


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
              Use FILE as grub-mkimage(1).  The default is /usr/bin/grub-mkimage.


       --rom-directory=DIR
              Save ROM images in DIR.


       --xorriso=FILE
              Use FILE as xorriso.


       --grub-glue-efi=FILE
              Use FILE as grub-glue-efi(3).


       --grub-render-label=FILE
              Use FILE as grub-render-label(3).


       --label-font=FILE
              Use FILE as the font file for generated labels.


       --label-color=COLOR
              Use COLOR as the color for generated labels.


       --label-bgcolor=COLOR
              Use COLOR as the background color for generated labels.


       --product-name=STRING
              Use STRING as the product name in generated labels.


       --product-version=STRING
              Use STRING as the product version in generated labels.


       --sparc-boot
              Enable booting the SPARC platform.  This disables HFS+, APM, ARCS, and "boot as disk image" on the i386-pc target platform.


       --arcs-boot
              Enable ARCS booting.  This is typically for big-endian MIPS machines, and disables HFS+, APM, sparc64, and "boot as disk image" on the i386-pc target platform.


       --     All options after a -- will be passed directly to xorriso's command line when generating the image.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                               GRUB-MKRESCUE(3)
