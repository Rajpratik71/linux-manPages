LOSETUP(8)                                                                                  System Administration                                                                                  LOSETUP(8)



NAME
       losetup - set up and control loop devices

SYNOPSIS
       Get info:

            losetup loopdev

            losetup -l [-a]

            losetup -j file [-o offset]

       Delete loop:

            losetup -d loopdev...

       Delete all used loop devices:

            losetup -D

       Print name of first unused loop device:

            losetup -f

       Set up a loop device:

            losetup [-o offset] [--sizelimit size]
                    [-Pr] [--show] -f|loopdev file

       Resize loop device:

            losetup -c loopdev

DESCRIPTION
       losetup  is  used to associate loop devices with regular files or block devices, to detach loop devices and to query the status of a loop device. If only the loopdev argument is given, the status of
       the corresponding loop device is shown.

       Note that the old output format (e.g. losetup -a) with comma delimited strings is deprecated in favour of the --list output format (e.g. losetup -a -l).

OPTIONS
       +The size and offset arguments may be followed by the multiplicative +suffixes KiB=1024, MiB=1024*1024, and so on for GiB, TiB, PiB, EiB, ZiB and YiB +(the "iB" is optional, e.g. "K"  has  the  same
       meaning as "KiB") or the suffixes +KB=1000, MB=1000*1000, and so on for GB, TB, PB, EB, ZB and YB.


       -a, --all
              show status of all loop devices. Note that not all information are accessible for non-root users. See also --list. The old output format (as printed without --list) is deprecated.

       -c, --set-capacity loopdev
              force loop driver to reread size of the file associated with the specified loop device

       -d, --detach loopdev...
              detach  the  file  or  device associated with the specified loop device(s). Note that since Linux v3.7 kernel uses "lazy device destruction".  The detach operation does not return EBUSY error
              anymore if device is actively used by system, but it is marked by autoclear flag and destroyed later.

       -D, --detach-all
              detach all associated loop devices

       -f, --find
              find the first unused loop device. If a file argument is present, use this device. Otherwise, print its name

       -h, --help
              print help

       -j, --associated file
              show status of all loop devices associated with given file

       -l, --list
              if a loop device or the -a option is specified, print default columns for either the specified loop device or all loop devices, default is to print info about all devices.

       -o, --offset offset
              the data start is moved offset bytes into the specified file or device

       -O, --output columns
              specify which columns are to be printed for the --list output

       --sizelimit size
              the data end is set to no more than size bytes after the data start

       -P, --partscan
              force kernel to scan partition table on newly created loop device

       -r, --read-only
              setup read-only loop device

       --show print device name if the -f option and a file argument are present.

       -v, --verbose
              verbose mode


ENCRYPTION
       Cryptoloop is no longer supported in favor of dm-crypt. For more details see cryptsetup(8).


RETURN VALUE
       losetup returns 0 on success, nonzero on failure. When losetup displays the status of a loop device, it returns 1 if the device is not configured and 2 if an  error  occurred  which  prevented  from
       determining the status of the device.


FILES
       /dev/loop[0..N]
              loop block devices

       /dev/loop-cotrol
              loop control device


EXAMPLE
       The following commands can be used as an example of using the loop device.

              # dd if=/dev/zero of=~/file.img bs=1MiB count=10
              # losetup --find --show ~/file.img
              /dev/loop0
              # mkfs -t ext2 /dev/loop0
              # mount /dev/loop0 /mnt
               ...
              # umount /dev/loop0
              # losetup --detach /dev/loop0

AUTHORS
       Karel Zak <kzak@redhat.com>, based on original version from Theodore Ts'o <tytso@athena.mit.edu>

AVAILABILITY
       The losetup command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                        July 2003                                                                                        LOSETUP(8)
