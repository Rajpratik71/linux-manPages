GRUB-MOUNT(1)                                                                                User Commands                                                                               GRUB-MOUNT(1)

NAME
       grub-mount - export GRUB filesystem with FUSE

SYNOPSIS
       grub-mount [OPTION...] IMAGE1 [IMAGE2 ...] MOUNTPOINT

DESCRIPTION
       Debug tool for filesystem driver.

       -C, --crypto
              Mount crypto devices.

       -d, --debug=STRING
              Set debug environment variable.

       -K, --zfs-key=FILE|prompt
              Load zfs crypto key.

       -r, --root=DEVICE_NAME
              Set root device.

       -v, --verbose
              print verbose messages.

       -?, --help
              give this help list

       --usage
              give a short usage message

       -V, --version
              print program version

       Mandatory or optional arguments to long options are also mandatory or optional for any corresponding short options.

SEE ALSO
       The full documentation for grub-mount is maintained as a Texinfo manual.  If the info and grub-mount programs are properly installed at your site, the command

              info grub-mount

       should give you access to the complete manual.

grub-mount (GRUB) 2.02-2ubuntu8.12                                                           February 2019                                                                               GRUB-MOUNT(1)
