LVREDUCE(8)                                                   System Manager's Manual                                                  LVREDUCE(8)

NAME
       lvreduce — reduce the size of a logical volume

SYNOPSIS
       lvreduce   [-A|--autobackup   {y|n}]   [--commandprofile  ProfileName]  [-d|--debug]  [-h|--help]  [-t|--test]  [-v|--verbose]  [--version]
       [-f|--force] [--noudevsync] {-l|--extents [-]LogicalExtentsNumber[%{VG|LV|FREE|ORIGIN}] | -L|--size [-]LogicalVolumeSize[bBsSkKmMgGtTpPeE]}
       [-n|--nofsck] [--reportformat {basic|json}] [-r|--resizefs] LogicalVolume{Name|Path}

DESCRIPTION
       lvreduce  allows you to reduce the size of a logical volume.  Be careful when reducing a logical volume's size, because data in the reduced
       part is lost!!!
       You should therefore ensure that any filesystem on the volume is resized before running lvreduce so that the extents that are to be removed
       are not in use.
       Shrinking snapshot logical volumes (see lvcreate(8) for information to create snapshots) is supported as well.  But to change the number of
       copies in a mirrored logical volume use lvconvert(8).
       Sizes will be rounded if necessary - for example, the volume size must be an exact number of extents and the size of a striped segment must
       be a multiple of the number of stripes.

OPTIONS
       See lvm(8) for common options.

       -f, --force
              Force size reduction without prompting even when it may cause data loss.

       -l, --extents [-]LogicalExtentsNumber[%{VG|LV|FREE|ORIGIN}]
              Reduce  or  set  the logical volume size in units of logical extents.  With the - sign the value will be subtracted from the logical
              volume's actual size and without it the value will be taken as an absolute size.  The total number of physical extents freed will be
              greater  than  this  logical value if, for example, the volume is mirrored.  The number can also be expressed as a percentage of the
              total space in the Volume Group with the suffix %VG, relative to the existing size of the Logical Volume with the suffix %LV,  as  a
              percentage  of  the remaining free space in the Volume Group with the suffix %FREE, or (for a snapshot) as a percentage of the total
              space in the Origin Logical Volume with the suffix %ORIGIN.  The resulting value for the subtraction is rounded  downward,  for  the
              absolute  size  it  is rounded upward.  N.B. In a future release, when expressed as a percentage with VG or FREE, the number will be
              treated as an approximate total number of physical extents to be freed (including extents used by any mirrors,  for  example).   The
              code may currently release more space than you might otherwise expect.

       -L, --size [-]LogicalVolumeSize[bBsSkKmMgGtTpPeE]
              Reduce  or  set  the logical volume size in units of megabytes.  A size suffix of k for kilobyte, m for megabyte, g for gigabytes, t
              for terabytes, p for petabytes or e for exabytes is optional.  With the - sign the value will be subtracted from  the  logical  vol‐
              ume's actual size and without it it will be taken as an absolute size.

       -n, --nofsck
              Do not perform fsck before resizing filesystem when filesystem requires it. You may need to use --force to proceed with this option.

       --noudevsync
              Disable  udev  synchronisation. The process will not wait for notification from udev.  It will continue irrespective of any possible
              udev processing in the background.  You should only use this if udev is not running or has rules that ignore the devices  LVM2  cre‐
              ates.

       -r, --resizefs
              Resize underlying filesystem together with the logical volume using fsadm(8).

Examples
       Reduce the size of logical volume lvol1 in volume group vg00 by 3 logical extents:

       lvreduce -l -3 vg00/lvol1

SEE ALSO
       fsadm(8), lvchange(8), lvconvert(8), lvcreate(8), lvextend(8), lvm(8), lvresize(8), vgreduce(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             LVREDUCE(8)
