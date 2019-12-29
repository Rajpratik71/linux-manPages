LOSETUP(8)                               System Administration                              LOSETUP(8)

NAME
       losetup - set up and control loop devices

SYNOPSIS
       Get info:

            losetup [loopdev]

            losetup -l [-a]

            losetup -j file [-o offset]

       Detach a loop device:

            losetup -d loopdev...

       Detach all associated loop devices:

            losetup -D

       Set up a loop device:

            losetup [-o offset] [--sizelimit size] [--sector-size size]
                    [-Pr] [--show] -f|loopdev file

       Resize a loop device:

            losetup -c loopdev

DESCRIPTION
       losetup  is  used to associate loop devices with regular files or block devices, to detach loop
       devices, and to query the status of a loop device.  If only the loopdev argument is given,  the
       status  of the corresponding loop device is shown.  If no option is given, all loop devices are
       shown.

       Note that the old output format (i.e., losetup -a) with comma-delimited strings  is  deprecated
       in favour of the --list output format.

       It's  possible  to  create more independent loop devices for the same backing file.  This setup
       may be dangerous, can cause data loss, corruption and overwrites.  Use --nooverlap with  --find
       during setup to avoid this problem.

OPTIONS
       The  size  and offset arguments may be followed by the multiplicative suffixes KiB (=1024), MiB
       (=1024*1024), and so on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is  optional,  e.g.,  "K"
       has  the  same meaning as "KiB") or the suffixes KB (=1000), MB (=1000*1000), and so on for GB,
       TB, PB, EB, ZB and YB.

       -a, --all
              Show the status of all loop devices.  Note that not all information  is  accessible  for
              non-root  users.  See also --list.  The old output format (as printed without --list) is
              deprecated.

       -d, --detach loopdev...
              Detach the file or device associated with the specified loop device(s). Note that  since
              Linux  v3.7 kernel uses "lazy device destruction".  The detach operation does not return
              EBUSY error anymore if device is actively used by system, but it is marked by  autoclear
              flag and destroyed later.

       -D, --detach-all
              Detach all associated loop devices.

       -f, --find [file]
              Find  the first unused loop device.  If a file argument is present, use the found device
              as loop device.  Otherwise, just print its name.

       --show Display the name of the assigned loop device if the -f option and a  file  argument  are
              present.

       -L, --nooverlap
              Check  for  conflicts between loop devices to avoid situation when the same backing file
              is shared between more loop devices. If the file is already used by another device  then
              re-use the device rather than a new one. The option makes sense only with --find.

       -j, --associated file [-o offset]
              Show the status of all loop devices associated with the given file.

       -o, --offset offset
              The  data start is moved offset bytes into the specified file or device.  The offset may
              be followed by the multiplicative suffixes; see above.

       --sizelimit size
              The data end is set to no more than size bytes after the data start.  The  size  may  be
              followed by the multiplicative suffixes; see above.

       -b, --sector-size size
              Set  the  logical sector size of the loop device in bytes (since Linux 4.14). The option
              may be used when create a new loop device as well as stand-alone command to modify  sec‐
              tor size of the already existing loop device.

       -c, --set-capacity loopdev
              Force  the loop driver to reread the size of the file associated with the specified loop
              device.

       -P, --partscan
              Force the kernel to scan the partition table on a newly created loop device.  Note  that
              the  partition table parsing depends on sector sizes.  The default is sector size is 512
              bytes, otherwise you need to use the option --sector-size together with --partscan.

       -r, --read-only
              Set up a read-only loop device.

       --direct-io[=on|off]
              Enable or disable direct I/O for the backing file.  The optional argument can be  either
              on or off.  If the argument is omitted, it defaults to on.

       -v, --verbose
              Verbose mode.

       -l, --list
              If a loop device or the -a option is specified, print the default columns for either the
              specified loop device or all loop devices; the default is to print info  about  all  de‐
              vices.  See also --output, --noheadings, --raw, and --json.

       -O, --output column[,column]...
              Specify  the  columns that are to be printed for the --list output.  Use --help to get a
              list of all supported columns.

       --output-all
              Output all available columns.

       -n, --noheadings
              Don't print headings for --list output format.

       --raw  Use the raw --list output format.

       -J, --json
              Use JSON format for --list output.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

ENCRYPTION
       Cryptoloop is no longer supported in favor of dm-crypt.  For more details see cryptsetup(8).

RETURN VALUE
       losetup returns 0 on success, nonzero on failure.  When losetup displays the status of  a  loop
       device, it returns 1 if the device is not configured and 2 if an error occurred which prevented
       determining the status of the device.

FILES
       /dev/loop[0..N]
              loop block devices

       /dev/loop-control
              loop control device

EXAMPLE
       The following commands can be used as an example of using the loop device.

              # dd if=/dev/zero of=~/file.img bs=1024k count=10
              # losetup --find --show ~/file.img
              /dev/loop0
              # mkfs -t ext2 /dev/loop0
              # mount /dev/loop0 /mnt
               ...
              # umount /dev/loop0
              # losetup --detach /dev/loop0

ENVIRONMENT
       LOOPDEV_DEBUG=all
              enables debug output.

AUTHORS
       Karel  Zak  <kzak@redhat.com>,   based   on   the   original   version   from   Theodore   Ts'o
       <tytso@athena.mit.edu>

AVAILABILITY
       The  losetup  command  is part of the util-linux package and is available from https://www.ker‐
       nel.org/pub/linux/utils/util-linux/.

util-linux                                   November 2015                                  LOSETUP(8)
