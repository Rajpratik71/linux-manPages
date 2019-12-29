MKSWAP(8)                                System Administration                               MKSWAP(8)

NAME
       mkswap - set up a Linux swap area

SYNOPSIS
       mkswap [options] device [size]

DESCRIPTION
       mkswap sets up a Linux swap area on a device or in a file.

       The device argument will usually be a disk partition (something like /dev/sdb7) but can also be
       a file.  The Linux kernel does not look at partition IDs, but many  installation  scripts  will
       assume  that partitions of hex type 82 (LINUX_SWAP) are meant to be swap partitions.  (Warning:
       Solaris also uses this type.  Be careful not to kill your Solaris partitions.)

       The size parameter is superfluous but retained for backwards compatibility.  (It specifies  the
       desired  size  of  the  swap area in 1024-byte blocks.  mkswap will use the entire partition or
       file if it is omitted.  Specifying it is unwise – a typo may destroy your disk.)

       After creating the swap area, you need the swapon command to start using it.  Usually swap  ar‐
       eas  are  listed  in  /etc/fstab so that they can be taken into use at boot time by a swapon -a
       command in some boot script.

WARNING
       The swap header does not touch the first block.  A boot loader or disk label can be there,  but
       it  is  not  a  recommended  setup.  The recommended setup is to use a separate partition for a
       Linux swap area.

       mkswap, like many others mkfs-like utils, erases the first partition block to make any previous
       filesystem invisible.

       However, mkswap refuses to erase the first block on a device with a disk label (SUN, BSD, ...).

OPTIONS
       -c, --check
              Check the device (if it is a block device) for bad blocks before creating the swap area.
              If any bad blocks are found, the count is printed.

       -f, --force
              Go ahead even if the command is stupid.  This allows the creation of a swap area  larger
              than the file or partition it resides on.

              Also,  without this option, mkswap will refuse to erase the first block on a device with
              a partition table.

       -L, --label label
              Specify a label for the device, to allow swapon by label.

       -p, --pagesize size
              Specify the page size (in bytes) to use.  This option  is  usually  unnecessary;  mkswap
              reads the size from the kernel.

       -U, --uuid UUID
              Specify the UUID to use.  The default is to generate a UUID.

       -v, --swapversion 1
              Specify  the  swap-space  version.  (This option is currently pointless, as the old -v 0
              option has become obsolete and now only -v 1 is supported.  The kernel has not supported
              v0  swap-space  format  since 2.5.22 (June 2002).  The new version v1 is supported since
              2.1.117 (August 1998).)

       -h, --help
              Display help text and exit.

       -V, --version
              Display version information and exit.

NOTES
       The maximum useful size of a swap area depends on the architecture and the kernel version.

       The maximum number of the pages that is possible to address by swap area header  is  4294967295
       (32-bit unsigned int).  The remaining space on the swap device is ignored.

       Presently, Linux allows 32 swap areas.  The areas in use can be seen in the file /proc/swaps

       mkswap refuses areas smaller than 10 pages.

       If you don't know the page size that your machine uses, you may be able to look it up with "cat
       /proc/cpuinfo" (or you may not – the contents of this file depend on  architecture  and  kernel
       version).

       To  set up a swap file, it is necessary to create that file before initializing it with mkswap,
       e.g. using a command like

              # dd if=/dev/zero of=swapfile bs=1MiB count=$((8*1024))

       to create 8GiB swapfile.

       Please read notes from swapon(8) about the swap file use restrictions (holes, preallocation and
       copy-on-write issues).

ENVIRONMENT
       LIBBLKID_DEBUG=all
              enables libblkid debug output.

SEE ALSO
       fdisk(8), swapon(8)

AVAILABILITY
       The  mkswap  command  is  part of the util-linux package and is available from https://www.ker‐
       nel.org/pub/linux/utils/util-linux/.

util-linux                                    March 2009                                     MKSWAP(8)
