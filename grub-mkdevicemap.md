GRUB-MKDEVICEMAP(8)                                       System Administration Utilities                                      GRUB-MKDEVICEMAP(8)

NAME
       grub-mkdevicemap - make a device map file automatically

SYNOPSIS
       grub-mkdevicemap [OPTION]...

DESCRIPTION
       Generate a device map file automatically.

       -n, --no-floppy
              do not probe any floppy drive

       -s, --probe-second-floppy probe the second floppy drive

       -m, --device-map=FILE
              use FILE as the device map [default=/boot/grub/device.map]

       -h, --help
              display this message and exit

       -V, --version
              print version information and exit

       -v, --verbose
              print verbose messages

REPORTING BUGS
       Report bugs to <bug-grub@gnu.org>.

SEE ALSO
       grub-probe(8)

       The  full  documentation  for  grub-mkdevicemap  is maintained as a Texinfo manual.  If the info and grub-mkdevicemap programs are properly
       installed at your site, the command

              info grub-mkdevicemap

       should give you access to the complete manual.

grub-mkdevicemap (GRUB) 2.02-pve6                                   March 2017                                                 GRUB-MKDEVICEMAP(8)
