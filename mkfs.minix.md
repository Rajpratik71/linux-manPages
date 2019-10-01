MKFS.MINIX(8)                                                                               System Administration                                                                               MKFS.MINIX(8)



NAME
       mkfs.minix - make a Minix filesystem

SYNOPSIS
       mkfs.minix [-c|-l filename] [-n namelength] [-i inodecount] [-v] device [size-in-blocks]

DESCRIPTION
       mkfs.minix creates a Linux MINIX filesystem on a device (usually a disk partition).

       The device is usually of the following form:

              /dev/hda[1-8] (IDE disk 1)
              /dev/hdb[1-8] (IDE disk 2)
              /dev/sda[1-8] (SCSI disk 1)
              /dev/sdb[1-8] (SCSI disk 2)

       The  size-in-blocks  parameter  is the desired size of the file system, in blocks.  It is present only for backwards compatibility.  If omitted the size will be determined automatically.  Only block
       counts strictly greater than 10 and strictly less than 65536 are allowed.

OPTIONS
       -c     Check the device for bad blocks before creating the filesystem.  If any are found, the count is printed.

       -n namelength
              Specify the maximum length of filenames.  Currently, the only allowable values are 14 and 30.  The default is 30.  Note that kernels older than 0.99p7 only accept namelength 14.

       -i inodecount
              Specify the number of inodes for the filesystem.

       -l filename
              Read the list of bad blocks from filename.  The file has one bad-block number per line.  The count of bad blocks read is printed.

       -1     Make a Minix version 1 filesystem.

       -2, -v Make a Minix version 2 filesystem.

       -3     Make a Minix version 3 filesystem.

EXIT CODES
       The exit code returned by mkfs.minix is one of the following:

       0      No errors

       8      Operational error

       16     Usage or syntax error

SEE ALSO
       mkfs(8), fsck(8), reboot(8)

AVAILABILITY
       The mkfs.minix command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                        June 2011                                                                                     MKFS.MINIX(8)
