GRUB-MKNETDIR(1)                                                                             User Commands                                                                            GRUB-MKNETDIR(1)

NAME
       grub-mknetdir - prepare a GRUB netboot directory.

SYNOPSIS
       grub-mknetdir [OPTION...]

DESCRIPTION
       --compress=no|xz|gz|lzo
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

       --net-directory=DIR
              root directory of TFTP server

       --subdir=DIR
              relative subdirectory on network server

       -?, --help
              give this help list

       --usage
              give a short usage message

       -V, --version
              print program version

       Mandatory or optional arguments to long options are also mandatory or optional for any corresponding short options.

       Prepares GRUB network boot images at net_directory/subdir assuming net_directory being TFTP root.

REPORTING BUGS
       Report bugs to <bug-grub@gnu.org>.

SEE ALSO
       grub-mkimage(1)

       The full documentation for grub-mknetdir is maintained as a Texinfo manual.  If the info and grub-mknetdir programs are properly installed at your site, the command

              info grub-mknetdir

       should give you access to the complete manual.

grub-mknetdir (GRUB) 2.02-2ubuntu8.12                                                        February 2019                                                                            GRUB-MKNETDIR(1)
