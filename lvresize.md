LVRESIZE(8)                                                                              System Manager's Manual                                                                              LVRESIZE(8)

NAME
       lvresize — resize a logical volume

SYNOPSIS
       lvresize   [--alloc   AllocationPolicy]   [--noudevsync]   [--commandprofile   ProfileName]   [-i|--stripes   Stripes   [-I|--stripesize   StripeSize]]   {[-l|--extents   [+|-]LogicalExtentsNum‐
       ber[%{VG|LV|PVS|FREE|ORIGIN}] | [-L|--size [+|-]LogicalVolumeSize[bBsSkKmMgGtTpPeE]} [--poolmetadatasize [+]MetadataVolumeSize[bBsSkKmMgG] [-f|--force] [-n|--nofsck] [-r|--resizefs]  LogicalVol‐
       ume{Name|Path} [PhysicalVolumePath[:PE[-PE]]...]

DESCRIPTION
       lvresize allows you to resize a logical volume.  Be careful when reducing a logical volume's size, because data in the reduced part is lost!!!  You should therefore ensure that any filesystem on
       the volume is shrunk first so that the extents that are to be removed are not in use.  Resizing snapshot logical volumes (see lvcreate(8) for information about creating snapshots)  is  supported
       as well.  But to change the number of copies in a mirrored logical volume use lvconvert(8).

OPTIONS
       See lvm(8) for common options.

       -f, --force
              Force resize without prompting even when it may cause data loss.

       -n, --nofsck
              Do not perform fsck before resizing filesystem when filesystem requires it. You may need to use --force to proceed with this option.

       -r, --resizefs
              Resize underlying filesystem together with the logical volume using fsadm(8).

       -l, --extents [+|-]LogicalExtentsNumber[%{VG|LV|PVS|FREE|ORIGIN}]
              Change or set the logical volume size in units of logical extents.  With the + or - sign the value is added to or subtracted from the actual size of the logical volume and without it, the
              value is taken as an absolute one.  The total number of physical extents affected will be greater than this if, for example, the volume is mirrored.  The number can also be expressed as a
              percentage of the total space in the Volume Group with the suffix %VG, relative to the existing size of the Logical Volume with the suffix %LV, as a percentage of the remaining free space
              of the PhysicalVolumes on the command line with the suffix %PVS, as a percentage of the remaining free space in the Volume Group with the suffix %FREE, or (for a snapshot) as a percentage
              of  the  total  space  in the Origin Logical Volume with the suffix %ORIGIN.  The resulting value is rounded downward for the subtraction otherwise it is rounded upward.  N.B. In a future
              release, when expressed as a percentage with PVS, VG or FREE, the number will be treated as an approximate total number of physical extents to be allocated  or  freed  (including  extents
              used by any mirrors, for example).  The code may currently allocate or remove more space than you might otherwise expect.

       -L, --size [+|-]LogicalVolumeSize[bBsSkKmMgGtTpPeE]
              Change  or set the logical volume size in units of megabytes.  A size suffix of M for megabytes, G for gigabytes, T for terabytes, P for petabytes or E for exabytes is optional.  With the
              + or - sign the value is added or subtracted from the actual size of the logical volume and rounded to the full extent size and without it, the value is taken as an absolute one.

       -i, --stripes Stripes
              Gives the number of stripes to use when extending a Logical Volume.  Defaults to whatever the last segment of the Logical Volume uses.  Not applicable to LVs using the  original  metadata
              LVM format, which must use a single value throughout.

       --poolmetadatasize [+]MetadataVolumeSize[bBsSkKmMgG]
              Change or set the thin pool metadata logical volume size.  With the + sign the value is added to the actual size of the metadata volume and rounded to the full extent size and without it,
              the value is taken as an absolute one.  Maximal size is 16GiB. Default unit is megabytes.

       -I, --stripesize StripeSize
              Gives the number of kilobytes for the granularity of the stripes.  Defaults to whatever the last segment of the Logical Volume uses.  Not applicable to LVs using the original metadata LVM
              format, which must use a single value throughout.
              StripeSize must be 2^n (n = 2 to 9) for metadata in LVM1 format.  For metadata in LVM2 format, the stripe size may be a larger power of 2 but must not exceed the physical extent size.

       --noudevsync
              Disable  udev synchronisation. The process will not wait for notification from udev.  It will continue irrespective of any possible udev processing in the background.  You should only use
              this if udev is not running or has rules that ignore the devices LVM2 creates.

EXAMPLES
       Extend a logical volume vg1/lv1 by 16MB using physical extents /dev/sda:0-1 and /dev/sdb:0-1 for allocation of extents:

       lvresize -L+16M vg1/lv1 /dev/sda:0-1 /dev/sdb:0-1

SEE ALSO
       fsadm(8), lvm(8), lvconvert(8), lvcreate(8), lvreduce(8), lvchange(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                        LVRESIZE(8)
