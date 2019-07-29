FSTRIM(8)                   System Administration                   FSTRIM(8)

NAME
       fstrim - discard unused blocks on a mounted filesystem

SYNOPSIS
       fstrim [-a] [-o offset] [-l length] [-m minimum-size] [-v] mountpoint

DESCRIPTION
       fstrim  is  used on a mounted filesystem to discard (or "trim") blocks
       which are not in use by the filesystem.  This  is  useful  for  solid-
       state drives (SSDs) and thinly-provisioned storage.

       By  default,  fstrim will discard all unused blocks in the filesystem.
       Options may be used to modify this behavior based on range or size, as
       explained below.

       The  mountpoint  argument  is  the pathname of the directory where the
       filesystem is mounted.

       Running fstrim frequently, or even using mount -o discard, might nega‐
       tively  affect  the  lifetime  of  poor-quality SSD devices.  For most
       desktop and server systems a sufficient trimming frequency is  once  a
       week.   Note  that not all devices support a queued trim, so each trim
       command incurs a performance penalty on whatever else might be  trying
       to use the disk at the time.

OPTIONS
       The  offset, length, and minimum-size arguments may be followed by the
       multiplicative suffixes KiB (=1024), MiB (=1024*1024), and so  on  for
       GiB,  TiB,  PiB, EiB, ZiB and YiB (the "iB" is optional, e.g., "K" has
       the  same  meaning  as  "KiB")  or  the  suffixes   KB   (=1000),   MB
       (=1000*1000), and so on for GB, TB, PB, EB, ZB and YB.

       -a, --all
              Trim  all  mounted filesystems on devices that support the dis‐
              card operation.  The other  supplied  options,  like  --offset,
              --length  and  --minimum,  are  applied  to  all these devices.
              Errors from filesystems that do not support the discard  opera‐
              tion are silently ignored.

       -o, --offset offset
              Byte offset in the filesystem from which to begin searching for
              free blocks to discard.  The default value is zero, starting at
              the beginning of the filesystem.

       -l, --length length
              The  number  of  bytes (after the starting point) to search for
              free blocks to discard.  If the specified  value  extends  past
              the  end  of the filesystem, fstrim will stop at the filesystem
              size boundary.  The default value extends to  the  end  of  the
              filesystem.

       -m, --minimum minimum-size
              Minimum contiguous free range to discard, in bytes. (This value
              is internally rounded up to a multiple of the filesystem  block
              size.)   Free  ranges  smaller  than  this will be ignored.  By
              increasing this value, the fstrim operation will complete  more
              quickly   for  filesystems  with  badly  fragmented  freespace,
              although not all blocks will be discarded.  The  default  value
              is zero, discarding every free block.

       -v, --verbose
              Verbose  execution.   With  this  option fstrim will output the
              number of bytes passed from the filesystem down the block stack
              to  the device for potential discard.  This number is a maximum
              discard amount from the storage device's  perspective,  because
              FITRIM ioctl called repeated will keep sending the same sectors
              for discard repeatedly.

              fstrim will report the same potential discard bytes each  time,
              but only sectors which had been written to between the discards
              would actually be discarded by the  storage  device.   Further,
              the kernel block layer reserves the right to adjust the discard
              ranges to fit raid stripe geometry, non-trim capable devices in
              a  LVM  setup, etc.  These reductions would not be reflected in
              fstrim_range.len (the --length option).

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

RETURN CODES
       0      success

       1      failure

       32     all failed

       64     some filesystem discards have succeeded, some failed

       The command fstrim --all returns 0 (all succeeded), 32 (all failed) or
       64 (some failed, some succeeded).

AUTHOR
       Lukas Czerner <lczerner@redhat.com>
       Karel Zak <kzak@redhat.com>

SEE ALSO
       blkdiscard(8), mount(8)

AVAILABILITY
       The  fstrim command is part of the util-linux package and is available
       from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                        July 2014                         FSTRIM(8)
