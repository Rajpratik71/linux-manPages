SWAPON(8)                   System Administration                   SWAPON(8)

NAME
       swapon,  swapoff  -  enable/disable  devices  and files for paging and
       swapping

SYNOPSIS
       swapon [options] [specialfile...]
       swapoff [-va] [specialfile...]

DESCRIPTION
       swapon is used to specify devices on which paging and swapping are  to
       take place.

       The device or file used is given by the specialfile parameter.  It may
       be of the form -L label or -U uuid to indicate a device  by  label  or
       uuid.

       Calls  to  swapon normally occur in the system boot scripts making all
       swap devices available, so that the paging and  swapping  activity  is
       interleaved across several devices and files.

       swapoff  disables  swapping  on the specified devices and files.  When
       the -a flag is given, swapping is disabled on all known  swap  devices
       and files (as found in /proc/swaps or /etc/fstab).

OPTIONS
       -a, --all
              All  devices  marked  as ``swap'' in /etc/fstab are made avail‐
              able, except for those with  the  ``noauto''  option.   Devices
              that are already being used as swap are silently skipped.

       -d, --discard[=policy]
              Enable  swap  discards, if the swap backing device supports the
              discard or trim operation.  This  may  improve  performance  on
              some  Solid  State  Devices, but often it does not.  The option
              allows one to select between two available swap  discard  poli‐
              cies: --discard=once to perform a single-time discard operation
              for the whole swap area at swapon; or --discard=pages to  asyn‐
              chronously  discard  freed swap pages before they are available
              for reuse.  If no policy is selected, the default  behavior  is
              to  enable  both  discard  types.  The /etc/fstab mount options
              discard, discard=once, or discard=pages may  also  be  used  to
              enable discard flags.

       -e, --ifexists
              Silently  skip devices that do not exist.  The /etc/fstab mount
              option nofail may also be used to skip non-existing device.

       -f, --fixpgsz
              Reinitialize (exec mkswap) the swap space if its page size does
              not  match  that of the current running kernel.  mkswap(2) ini‐
              tializes the whole device and does not check for bad blocks.

       -h, --help
              Display help text and exit.

       -L label
              Use the partition that has the  specified  label.   (For  this,
              access to /proc/partitions is needed.)

       -o, --options opts
              Specify  swap  options  by  an fstab-compatible comma-separated
              string.  For example:

                     swapon -o pri=1,discard=pages,nofail /dev/sda2

              The opts string is evaluated last and overrides all other  com‐
              mand line options.

       -p, --priority priority
              Specify  the  priority of the swap device.  priority is a value
              between -1 and 32767.  Higher numbers indicate higher priority.
              See  swapon(2)  for a full description of swap priorities.  Add
              pri=value to the option field of /etc/fstab for use with swapon
              -a.  When no priority is defined, it defaults to -1.

       -s, --summary
              Display  swap  usage  summary  by  device.   Equivalent to "cat
              /proc/swaps".  This output format is DEPRECATED  in  favour  of
              --show that provides better control on output data.

       --show[=column...]
              Display a definable table of swap areas.  See the --help output
              for a list of available columns.

       --noheadings
              Do not print headings when displaying --show output.

       --raw  Display --show output without aligning table columns.

       --bytes
              Display swap size in bytes in --show output instead of in user-
              friendly units.

       -U uuid
              Use the partition that has the specified uuid.

       -v, --verbose
              Be verbose.

       -V, --version
              Display version information and exit.

NOTES
       You  should  not use swapon on a file with holes.  This can be seen in
       the system log as

              swapon: swapfile has holes.

       The swap file implementation in the kernel expects to be able to write
       to  the file directly, without the assistance of the filesystem.  This
       is a problem on preallocated files (e.g.  fallocate(1)) on filesystems
       like XFS or ext4, and on copy-on-write filesystems like btrfs.

       It is recommended to use dd(1) and /dev/zero to avoid holes on XFS and
       ext4.

       swapon may not work correctly when using a swap file  with  some  ver‐
       sions  of  btrfs.  This is due to btrfs being a copy-on-write filesys‐
       tem: the file location may not be static and  corruption  can  result.
       Btrfs  actively  disallows the use of swap files on its filesystems by
       refusing to map the file.

       One possible workaround is to map the swap file to a loopback  device.
       This  will  allow the filesystem to determine the mapping properly but
       may come with a performance impact.

       Swap over NFS may not work.

       swapon automatically detects and rewrites a swap space signature  with
       old software suspend data (e.g S1SUSPEND, S2SUSPEND, ...). The problem
       is that if we don't do it, then we get data corruption the  next  time
       an attempt at unsuspending is made.

ENVIRONMENT
       LIBMOUNT_DEBUG=all
              enables libmount debug output.

       LIBBLKID_DEBUG=all
              enables libblkid debug output.

SEE ALSO
       swapoff(2), swapon(2), fstab(5), init(8), mkswap(8), mount(8), rc(8)

FILES
       /dev/sd??  standard paging devices
       /etc/fstab ascii filesystem description table

HISTORY
       The swapon command appeared in 4.0BSD.

AVAILABILITY
       The  swapon command is part of the util-linux package and is available
       from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                       October 2014                       SWAPON(8)
