WIPEFS(8)                                                                                System Administration                                                                               WIPEFS(8)

NAME
       wipefs - wipe a signature from a device

SYNOPSIS
       wipefs [options] device...

       wipefs [--backup] -o offset device...

       wipefs [--backup] -a device...

DESCRIPTION
       wipefs  can erase filesystem, raid or partition-table signatures (magic strings) from the specified device to make the signatures invisible for libblkid.  wipefs does not erase the filesystem
       itself nor any other data from the device.

       When used without any options, wipefs lists all visible filesystems and the offsets of their basic signatures.  The default output is subject to change.   So  whenever  possible,  you  should
       avoid using default outputs in your scripts.  Always explicitly define expected columns by using --output columns-list in environments where a stable output is required.

       wipefs calls the BLKRRPART ioctl when it has erased a partition-table signature to inform the kernel about the change.

       Note  that some filesystems and some partition tables store more magic strings on the device (e.g. FAT, ZFS, GPT).  The wipefs command (since v2.31) lists all the offset where a magic strings
       have been detected.

       When option -a is used, all magic strings that are visible for libblkid are erased. In this case the wipefs scans the device again after each modification (erase) until  no  magic  string  is
       found.

       Note that by default wipefs does not erase nested partition tables on non-whole disk devices.  For this the option --force is required.

OPTIONS
       -a, --all
              Erase all available signatures.  The set of erased signatures can be restricted with the -t option.

       -b, --backup
              Create a signature backup to the file $HOME/wipefs-<devname>-<offset>.bak.  For more details see the EXAMPLES section.

       -f, --force
              Force erasure, even if the filesystem is mounted.  This is required in order to erase a partition-table signature on a block device.

       -h, --help
              Display help text and exit.

       -J, --json
              Use JSON output format.

       -n, --noheadings
              Do not print a header line.

       -O, --output list
              Specify which output columns to print.  Use --help to get a list of all supported columns.

       -n, --no-act
              Causes everything to be done except for the write() call.

       -o, --offset offset
              Specify  the  location  (in  bytes)  of the signature which should be erased from the device.  The offset number may include a "0x" prefix; then the number will be interpreted as a hex
              value.  It is possible to specify multiple -o options.

              The offset argument may be followed by the multiplicative suffixes KiB (=1024), MiB (=1024*1024), and so on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is optional, e.g. "K" has  the
              same meaning as "KiB"), or the suffixes KB (=1000), MB (=1000*1000), and so on for GB, TB, PB, EB, ZB and YB.

       -p, --parsable
              Print out in parsable instead of printable format.  Encode all potentially unsafe characters of a string to the corresponding hex value prefixed by '\x'.

       -q, --quiet
              Suppress any messages after a successful signature wipe.

       -t, --types list
              Limit  the  set  of printed or erased signatures.  More than one type may be specified in a comma-separated list.  The list or individual types can be prefixed with 'no' to specify the
              types on which no action should be taken.  For more details see mount(8).

       -V, --version
              Display version information and exit.

EXAMPLES
       wipefs /dev/sda*
              Prints information about sda and all partitions on sda.

       wipefs --all --backup /dev/sdb
              Erases all signatures from the device /dev/sdb and creates a signature backup file ~/wipefs-sdb-<offset>.bak for each signature.

       dd if=~/wipefs-sdb-0x00000438.bak of=/dev/sdb seek=$((0x00000438)) bs=1 conv=notrunc
              Restores an ext2 signature from the backup file  ~/wipefs-sdb-0x00000438.bak.

AUTHOR
       Karel Zak <kzak@redhat.com>

ENVIRONMENT
       LIBBLKID_DEBUG=all
              enables libblkid debug output.

SEE ALSO
       blkid(8), findfs(8)

AVAILABILITY
       The wipefs command is part of the util-linux package and is available from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                                                                                   December 2014                                                                                   WIPEFS(8)
