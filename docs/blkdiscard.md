BLKDISCARD(8)                                                                            System Administration                                                                           BLKDISCARD(8)

NAME
       blkdiscard - discard sectors on a device

SYNOPSIS
       blkdiscard [options] [-o offset] [-l length] device

DESCRIPTION
       blkdiscard  is  used  to  discard  device sectors.  This is useful for solid-state drivers (SSDs) and thinly-provisioned storage.  Unlike fstrim(8), this command is used directly on the block
       device.

       By default, blkdiscard will discard all blocks on the device.  Options may be used to modify this behavior based on range or size, as explained below.

       The device argument is the pathname of the block device.

       WARNING: All data in the discarded region on the device will be lost!

OPTIONS
       The offset and length arguments may be followed by the multiplicative suffixes KiB (=1024), MiB (=1024*1024), and so on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is  optional,  e.g.,  "K"
       has the same meaning as "KiB") or the suffixes KB (=1000), MB (=1000*1000), and so on for GB, TB, PB, EB, ZB and YB.

       -o, --offset offset
              Byte offset into the device from which to start discarding.  The provided value will be aligned to the device sector size.  The default value is zero.

       -l, --length length
              The  number  of  bytes to discard (counting from the starting point).  The provided value will be aligned to the device sector size.  If the specified value extends past the end of the
              device, blkdiscard will stop at the device size boundary.  The default value extends to the end of the device.

       -p, --step length
              The number of bytes to discard within one iteration. The default is to discard all by one ioctl call.

       -s, --secure
              Perform a secure discard.  A secure discard is the same as a regular discard except that all copies of the discarded blocks that were possibly created by garbage collection  must  also
              be erased.  This requires support from the device.

       -z, --zeroout
              Zero-fill rather than discard.

       -v, --verbose
              Display the aligned values of offset and length.  If the --step option is specified, it prints the discard progress every second.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

AUTHOR
       Lukas Czerner ⟨lczerner@redhat.com⟩

SEE ALSO
       fstrim(8)

AVAILABILITY
       The blkdiscard command is part of the util-linux package and is available Linux Kernel Archive ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩.

util-linux                                                                                     July 2014                                                                                 BLKDISCARD(8)
