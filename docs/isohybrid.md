isohybrid(1)                                                  General Commands Manual                                                 isohybrid(1)

NAME
       isohybrid — Post-process an ISO 9660 image for booting as a hard disk.

SYNOPSIS
       isohybrid [OPTIONS] <boot.iso>

DESCRIPTION
       The  isohybrid  utility modifies an ISO 9660 image generated with mkisofs, genisoimage, or compatible utilities, to be bootable as a CD-ROM
       or as a hard disk.

OPTIONS
       -h <X>
              Number of geometry heads (default 64)

       -s <X>
              Number of geometry sectors (default 32)

       -e <X>, --entry <X>
              Specify parititon entry number (1-4)

       -o <X>, --offset <X>
              Specify partition offset (default 0)

       -t <X>, --type <X>
              Specify partition type (default 0x17)

       -i <X>, --id <X>
              Specify MBR ID (default random)

       -u, --uefi
              Build EFI bootable image

       -m, --mac
              Add Apple File Protocol partition table support

       --forcehd0
              Assume we are laoded as disk ID 0

       --ctrlhd0
              Assume disk ID 0 if the Ctrl key is pressed

       --partok
              Allow booting from within a partition

       -?, --help
              Display help

       -v, --verbose
              Display verbose output

       -V, --version
              Display version information

SEE ALSO
       mkisofs(1)

isohybrid                                                           17 Jan 2014                                                       isohybrid(1)
