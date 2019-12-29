LSBLK(8)                                 System Administration                                LSBLK(8)

NAME
       lsblk - list block devices

SYNOPSIS
       lsblk [options] [device...]

DESCRIPTION
       lsblk  lists information about all available or the specified block devices.  The lsblk command
       reads the sysfs filesystem and udev db to gather information. If the udev db is  not  available
       or  lsblk  is  compiled without udev support than it tries to read LABELs, UUIDs and filesystem
       types from the block device. In this case root permissions are necessary.

       The command prints all block devices (except RAM disks) in a tree-like format by default.   Use
       lsblk --help to get a list of all available columns.

       The  default  output,  as  well as the default output from options like --fs and --topology, is
       subject to change.  So whenever possible, you  should  avoid  using  default  outputs  in  your
       scripts.   Always  explicitly define expected columns by using --output columns-list and --list
       in environments where a stable output is required.

       Note that lsblk might be executed in time when udev does not have  all  information  about  re‐
       cently  added or modified devices yet. In this case it is recommended to use udevadm settle be‐
       fore lsblk to synchronize with udev.

OPTIONS
       -a, --all
              Also list empty devices and RAM disk devices.

       -b, --bytes
              Print the SIZE column in bytes rather than in a human-readable format.

       -D, --discard
              Print information about the discarding capabilities (TRIM, UNMAP) for each device.

       -d, --nodeps
              Do not print holder devices or slaves.  For example, lsblk --nodeps /dev/sda prints  in‐
              formation about the sda device only.

       -E, --dedup column
              Use column as a de-duplication key to de-duplicate output tree. If the key is not avail‐
              able for the device, or the device is a partition and parental  whole-disk  device  pro‐
              vides the same key than the device is always printed.

              The  usual  use case is to de-duplicate output on system multi-path devices, for example
              by -E WWN.

       -e, --exclude list
              Exclude the devices specified by the comma-separated list of major device numbers.  Note
              that  RAM disks (major=1) are excluded by default if --all is not specified.  The filter
              is applied to the top-level devices only. This may be confusing for --list output format
              where hierarchy of the devices is not obvious.

       -f, --fs
              Output  info  about  filesystems.   This  option  is  equivalent  to  -o NAME,FSTYPE,LA‐
              BEL,UUID,MOUNTPOINT.  The authoritative information about filesystems and raids is  pro‐
              vided by the blkid(8) command.

       -h, --help
              Display help text and exit.

       -I, --include list
              Include devices specified by the comma-separated list of major device numbers.  The fil‐
              ter is applied to the top-level devices only. This may be confusing  for  --list  output
              format where hierarchy of the devices is not obvious.

       -i, --ascii
              Use ASCII characters for tree formatting.

       -J, --json
              Use  JSON  output  format.  It's strongly recommended to use --output and also --tree if
              necessary.

       -l, --list
              Produce output in the form of a list. The output does not provide information about  re‐
              lationships between devices and since version 2.34 every device is printed only once.

       -M, --merge
              Group  parents of sub-trees to provide more readable output for RAIDs and Multi-path de‐
              vices. The tree-like output is required.

       -m, --perms
              Output info  about  device  owner,  group  and  mode.   This  option  is  equivalent  to
              -o NAME,SIZE,OWNER,GROUP,MODE.

       -n, --noheadings
              Do not print a header line.

       -o, --output list
              Specify  which  output columns to print.  Use --help to get a list of all supported col‐
              umns.  The columns may affect tree-like output.  The default is to use tree for the col‐
              umn 'NAME' (see also --tree).

              The  default  list  of  columns may be extended if list is specified in the format +list
              (e.g. lsblk -o +UUID).

       -O, --output-all
              Output all available columns.

       -P, --pairs
              Produce output in the form of key="value" pairs.  All potentially unsafe characters  are
              hex-escaped (\x<code>).

       -p, --paths
              Print full device paths.

       -r, --raw
              Produce  output  in  raw  format.   All  potentially  unsafe  characters are hex-escaped
              (\x<code>) in the NAME, KNAME, LABEL, PARTLABEL and MOUNTPOINT columns.

       -S, --scsi
              Output info about SCSI devices only.  All partitions, slaves and holder devices are  ig‐
              nored.

       -s, --inverse
              Print  dependencies  in  inverse order. If the --list output is requested then the lines
              are still ordered by dependencies.

       -T, --tree[=column]
              Force tree-like output format.  If column is specified, then a tree is  printed  in  the
              column.  The default is NAME column.

       -t, --topology
              Output  info  about  block-device topology.  This option is equivalent to -o NAME,ALIGN‐
              MENT,MIN-IO,OPT-IO,PHY-SEC,LOG-SEC,ROTA,SCHED,RQ-SIZE,RA,WSAME.

       -V, --version
              Display version information and exit.

       -x, --sort column
              Sort output lines by column. This option enables --list output format by default.  It is
              possible  to  use the option --tree to force tree-like output and than the tree branches
              are sorted by the column.

       -z, --zoned
              Print the zone model for each device.

        --sysroot directory
              Gather data for a Linux instance other than the instance from which the lsblk command is
              issued.   The  specified  directory  is  the system root of the Linux instance to be in‐
              spected.  This option is designed for the testing purpose.

NOTES
       For partitions, some information (e.g. queue attributes) is inherited from the parent device.

       The lsblk command needs to be able to look up each block device by major:minor  numbers,  which
       is done by using /sys/dev/block.  This sysfs block directory appeared in kernel 2.6.27 (October
       2008).  In case of problems with a new enough kernel, check that CONFIG_SYSFS  was  enabled  at
       the time of the kernel build.

RETURN CODES
       0      success

       1      failure

       32     none of specified devices found

       64     some specified devices found, some not found

AUTHORS
       Milan Broz <mbroz@redhat.com>
       Karel Zak <kzak@redhat.com>

ENVIRONMENT
       LSBLK_DEBUG=all
              enables lsblk debug output.

       LIBBLKID_DEBUG=all
              enables libblkid debug output.

       LIBMOUNT_DEBUG=all
              enables libmount debug output.

       LIBSMARTCOLS_DEBUG=all
              enables libsmartcols debug output.

       LIBSMARTCOLS_DEBUG_PADDING=on
              use visible padding characters. Requires enabled LIBSMARTCOLS_DEBUG.

SEE ALSO
       ls(1), blkid(8), findmnt(8)

AVAILABILITY
       The  lsblk  command  is  part  of the util-linux package and is available from https://www.ker‐
       nel.org/pub/linux/utils/util-linux/.

util-linux                                   February 2013                                    LSBLK(8)
