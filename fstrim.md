FSTRIM(8)                                                                                   System Administration                                                                                   FSTRIM(8)



NAME
       fstrim - discard unused blocks on a mounted filesystem

SYNOPSIS
       fstrim [-o offset] [-l length] [-m minimum-free-extent] [-v] mountpoint


DESCRIPTION
       fstrim is used on a mounted filesystem to discard (or "trim") blocks which are not in use by the filesystem.  This is useful for solid-state drives (SSDs) and thinly-provisioned storage.

       By default, fstrim will discard all unused blocks in the filesystem.  Options may be used to modify this behavior based on range or size, as explained below.

       The mountpoint argument is the pathname of the directory where the filesystem is mounted.


OPTIONS
       The  offset,  length,  and  minimum-free-extent arguments may be followed by the multiplicative suffixes KiB=1024, MiB=1024*1024, and so on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is optional,
       e.g. "K" has the same meaning as "KiB") or the suffixes KB=1000, MB=1000*1000, and so on for GB, TB, PB, EB, ZB and YB.

       -h, --help
              Print help and exit.

       -o, --offset offset
              Byte offset in filesystem from which to begin searching for free blocks to discard.  Default value is zero, starting at the beginning of the filesystem.

       -l, --length length
              Number of bytes after starting point to search for free blocks to discard.  If the specified value extends past the end of the filesystem, fstrim will stop at the  filesystem  size  boundary.
              Default value extends to the end of the filesystem.

       -m, --minimum minimum-free-extent
              Minimum  contiguous  free  range  to  discard,  in bytes. (This value is internally rounded up to a multiple of the filesystem block size).  Free ranges smaller than this will be ignored.  By
              increasing this value, the fstrim operation will complete more quickly for filesystems with badly fragmented freespace, although not all blocks will be discarded.  Default value is zero, dis‐
              card every free block.

       -v, --verbose
              Verbose  execution. When specified fstrim will output the number of bytes passed from the filesystem down the block stack to the device for potential discard. This number is a maximum discard
              amount from the storage device's perspective, because FITRIM ioctl called repeated will keep sending the same sectors for discard repeatedly.

              fstrim will report the same potential discard bytes each time, but only sectors which had been written to between the discards would actually be discarded by the storage device.  Further, the
              kernel  block  layer  reserves  the  right  to adjust the discard ranges to fit raid stripe geometry, non-trim capable devices in a LVM setup, etc.  These reductions would not be reflected in
              fstrim_range.len (the --length option).


AUTHOR
       Lukas Czerner <lczerner@redhat.com>
       Karel Zak <kzak@redhat.com>

SEE ALSO
       mount(8)

AVAILABILITY
       The fstrim command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                      November 2010                                                                                       FSTRIM(8)
