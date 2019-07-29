GRUB-FSTEST(1)                                                     User Commands                                                    GRUB-FSTEST(1)

NAME
       grub-fstest - debug tool for GRUB filesystem drivers

SYNOPSIS
       grub-fstest [OPTION...] IMAGE_PATH COMMANDS

DESCRIPTION
       Debug tool for filesystem driver.

              Commands:

       blocklist FILE
              Display blocklist of FILE.

       cat FILE
              Copy FILE to standard output.

       cmp FILE LOCAL
              Compare FILE with local file LOCAL.

       cp FILE LOCAL
              Copy FILE to local file LOCAL.

       crc FILE
              Get crc32 checksum of FILE.

       hex FILE
              Show contents of FILE in hex.

       ls PATH
              List files in PATH.

       xnu_uuid DEVICE
              Compute XNU UUID of the device.

       -c, --diskcount=NUM
              Specify the number of input files.

       -C, --crypto
              Mount crypto devices.

       -d, --debug=STRING
              Set debug environment variable.

       -K, --zfs-key=FILE|prompt
              Load zfs crypto key.

       -n, --length=NUM
              Handle N bytes in output file.

       -r, --root=DEVICE_NAME
              Set root device.

       -s, --skip=NUM
              Skip N bytes from output file.

       -u, --uncompress
              Uncompress data.

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
       grub-probe(8)

       The  full  documentation for grub-fstest is maintained as a Texinfo manual.  If the info and grub-fstest programs are properly installed at
       your site, the command

              info grub-fstest

       should give you access to the complete manual.

grub-fstest (GRUB) 2.02-pve6                                        March 2017                                                      GRUB-FSTEST(1)
