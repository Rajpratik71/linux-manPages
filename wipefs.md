WIPEFS(8)                                                                                   System Administration                                                                                   WIPEFS(8)



NAME
       wipefs - wipe a signature from a device

SYNOPSIS
       wipefs [-ahnpqtV] [-o offset] device...

DESCRIPTION
       wipefs can erase filesystem, raid or partition-table signatures (magic strings) from the specified device to make the signatures invisible for libblkid.

       wipefs does not erase the filesystem itself nor any other data from the device.  When used without options -a or -o, it lists all visible filesystems and the offsets of their basic signatures.

       wipefs calls BLKRRPART ioctl when erase partition table to inform kernel about the change.

       Note  that  some  filesystems or some partition tables store more magic strings on the devices.  The wipefs command lists only the first offset where a magic string has been detected.  The device is
       not scanned for additional magic strings for the same filesystem.  It is possible that after wipefs -o offset the same filesystem or partition table will still be visible by another magic string  on
       another offset.

       When used with option -a, all magic strings that are visible for libblkid are erased.

       Note that by default wipefs does not erase nested partition tables on non-whole disk devices. The option --force is required.


OPTIONS
       -a, --all
              Erase all available signatures.  The set of erased signatures can be restricted with the -t list option.

       -f, --force
              Force erasure, even if the filesystem is mounted.  This is required in order to erase the partition table on a block device.

       -h, --help
              Print help and exit.

       -n, --no-act
              Causes everything to be done except for the write() call.

       -o, --offset offset
              Specify  the location (in bytes) of the signature which should be erased from the device.  The offset number may include a "0x" prefix; then the number will be interpreted as a hex value.  It
              is possible to specify multiple -o options.

              The offset argument may be followed by the multiplicative suffixes KiB (=1024), MiB (=1024*1024), and so on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is optional, e.g. "K"  has  the  same
              meaning as "KiB"), or the suffixes KB (=1000), MB (=1000*1000), and so on for GB, TB, PB, EB, ZB and YB.

       -p, --parsable
              Print out in parsable instead of printable format.  Encode all potentially unsafe characters of a string to the corresponding hex value prefixed by '\x'.

       -q, --quiet
              Suppress output messages after successful signature wipe.

       -t, --types list
              Limit  the set of printed or erased signatures.  More than one type may be specified in a comma-separated list.  The list or individual types can be prefixed with 'no' to specify the types on
              which no action should be taken.  For more details see mount(8).

       -V, --version
              Output version information and exit.

AUTHOR
       Karel Zak <kzak@redhat.com>

ENVIRONMENT
       Setting LIBBLKID_DEBUG=0xffff enables debug output.

SEE ALSO
       blkid(8), findfs(8)

AVAILABILITY
       The wipefs command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                       October 2009                                                                                       WIPEFS(8)
