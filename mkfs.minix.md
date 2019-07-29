MKFS.MINIX(8)                                                  System Administration                                                 MKFS.MINIX(8)

NAME
       mkfs.minix - make a Minix filesystem

SYNOPSIS
       mkfs.minix [options] device [size-in-blocks]

DESCRIPTION
       mkfs.minix creates a Linux MINIX filesystem on a device (usually a disk partition).

       The device is usually of the following form:

              /dev/hda[1–8] (IDE disk 1)
              /dev/hdb[1–8] (IDE disk 2)
              /dev/sda[1–8] (SCSI disk 1)
              /dev/sdb[1–8] (SCSI disk 2)

       The device may be a block device or a image file of one, but this is not enforced.  Expect not much fun on a character device :-).

       The  size-in-blocks parameter is the desired size of the file system, in blocks.  It is present only for backwards compatibility.  If omit‐
       ted the size will be determined automatically.  Only block counts strictly greater than 10 and strictly less than 65536 are allowed.

OPTIONS
       -c, --check
              Check the device for bad blocks before creating the filesystem.  If any are found, the count is printed.

       -n, --namelength length
              Specify the maximum length of filenames.  Currently, the only allowable values are 14 and 30 for file system versions 1 and 2.  Ver‐
              sion 3 allows only value 60.  The default is 30.

       -i, --inodes number
              Specify the number of inodes for the filesystem.

       -l, --badblocks filename
              Read the list of bad blocks from filename.  The file has one bad-block number per line.  The count of bad blocks read is printed.

       -1     Make a Minix version 1 filesystem.  This is the default.

       -2, -v Make a Minix version 2 filesystem.

       -3     Make a Minix version 3 filesystem.

       -V, --version
              Display version information and exit.  The long option cannot be combined with other options.

       -h, --help
              Display help text and exit.

EXIT CODES
       The exit code returned by mkfs.minix is one of the following:

       0      No errors

       8      Operational error

       16     Usage or syntax error

SEE ALSO
       fsck(8), mkfs(8), reboot(8)

AVAILABILITY
       The mkfs.minix command is part of the util-linux package and is available from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                                                           June 2015                                                       MKFS.MINIX(8)
