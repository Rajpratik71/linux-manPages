GRUB-FSTEST(3)                                                                             Library Functions Manual                                                                            GRUB-FSTEST(3)



NAME
       grub-fstest — Debug tool for GRUB's filesystem driver.


SYNOPSIS
       grub-fstest [-c | --diskcount=NUM] [-C | --crypto]
                    [-d | --debug=STRING] [-K | --zfs-key=FILE|prompt]
                    [-n | --length=NUM] [-r | --root=DEVICE_NAME]
                    [-s | --skip=NUM] [-u | --uncompress] [-v | --verbose]
                    IMAGE_PATH <blocklist FILE | cat FILE |
                    cmp FILE LOCAL | cp FILE LOCAL | crc FILE |
                    hex FILE | ls PATH | xnu_uuid DEVICE>


DESCRIPTION
       grub-fstest is a tool for testing GRUB's filesystem drivers.  You should not normally need to run this program.


OPTIONS
       --diskcount=NUM
              Specify the number of input files.


       --crypto
              Mount cryptographic devices.


       --debug=STRING
              Set debug environment variable.


       --zfs-key=FILE|prompt
              Load ZFS cryptographic key.


       --length=NUM
              Handle NUM bytes in output file.


       --root=DEVICE_NAME
              Set root device.


       --skip=NUM
              Skip NUM bytes from output file.


       --uncompress
              Uncompress data.


       --verbose
              Print verbose messages.


COMMANDS
       blocklist FILE
              Display block list of FILE.


       cat FILE
              Display FILE on standard output.


       cmp FILE LOCAL
              Compare FILE with local file LOCAL.


       cp FILE LOCAL
              Copy FILE to local file LOCAL.


       crc FILE
              Display the CRC-32 checksum of FILE.


       hex FILE
              Display contents of FILE in hexidecimal.


       ls PATH
              List files at PATH.


       xnu_uuid DEVICE
              Display the XNU UUID of DEVICE.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                                 GRUB-FSTEST(3)
