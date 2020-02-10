LVEXTEND(8)                                                                              System Manager's Manual                                                                              LVEXTEND(8)

NAME
       lvextend — extend the size of a logical volume

SYNOPSIS
       lvextend  [--alloc  AllocationPolicy]  [-A|--autobackup  {y|n}]  [--commandprofile  ProfileName]  [-d|--debug]  [-h|-?|--help]  [-f|--force]  [-i|--stripes  Stripes [-I|--stripesize StripeSize]]
       {-l|--extents [+]LogicalExtentsNumber[%{VG|LV|PVS|FREE|ORIGIN}] | -L|--size [+]LogicalVolumeSize[bBsSkKmMgGtTpPeE]}  [-n|--nofsck]  [--noudevsync]  [-r|--resizefs]  [--use-policies]  [-t|--test]
       [-v|--verbose] LogicalVolumePath [PhysicalVolumePath[:PE[-PE]]...]

DESCRIPTION
       lvextend  allows you to extend the size of a logical volume.  Extension of snapshot logical volumes (see lvcreate(8) for information to create snapshots) is supported as well.  But to change the
       number of copies in a mirrored logical volume use lvconvert(8).

OPTIONS
       See lvm(8) for common options.

       -f, --force
              Proceed with size extension without prompting.

       -l, --extents [+]LogicalExtentsNumber[%{VG|LV|PVS|FREE|ORIGIN}]
              Extend or set the logical volume size in units of logical extents.  With the '+' sign the value is added to the actual size of the logical volume and without it, the value is taken as  an
              absolute  one.   The total number of physical extents allocated will be greater than this, for example, if the volume is mirrored.  The number can also be expressed as a percentage of the
              total space in the Volume Group with the suffix %VG, relative to the existing size of the Logical Volume with the suffix %LV, of the remaining free space for  the  specified  PhysicalVol‐
              ume(s)  with  the  suffix %PVS, as a percentage of the remaining free space in the Volume Group with the suffix %FREE, or (for a snapshot) as a percentage of the total space in the Origin
              Logical Volume with the suffix %ORIGIN.  The resulting value is rounded upward.  N.B. In a future release, when expressed as a percentage with PVS, VG or FREE, the number will be  treated
              as  an  approximate  upper limit for the total number of physical extents to be allocated (including extents used by any mirrors, for example).  The code may currently allocate more space
              than you might otherwise expect.

       -L, --size [+]LogicalVolumeSize[bBsSkKmMgGtTpPeE]
              Extend or set the logical volume size in units of megabytes.  A size suffix of M for megabytes, G for gigabytes, T for terabytes, P for petabytes or E for exabytes is optional.  With  the
              + sign the value is added to the actual size of the logical volume and without it, the value is taken as an absolute one.

       -i, --stripes Stripes
              Gives the number of stripes for the extension.  Not applicable to LVs using the original metadata LVM format, which must use a single value throughout.

       -I, --stripesize StripeSize
              Gives the number of kilobytes for the granularity of the stripes.  Not applicable to LVs using the original metadata LVM format, which must use a single value throughout.
              StripeSize must be 2^n (n = 2 to 9)

       -n, --nofsck
              Do not perform fsck before extending filesystem when filesystem requires it. You may need to use --force to proceed with this option.

       --noudevsync
              Disable  udev synchronisation. The process will not wait for notification from udev.  It will continue irrespective of any possible udev processing in the background.  You should only use
              this if udev is not running or has rules that ignore the devices LVM2 creates.

       -r, --resizefs
              Resize underlying filesystem together with the logical volume using fsadm(8).

       --use-policies
              Resizes the logical volume according to configured policy. See lvm.conf(5) for some details.

Examples
       Extends the size of the logical volume "vg01/lvol10" by 54MiB on physical volume /dev/sdk3. This is only possible if /dev/sdk3 is a member of volume group vg01 and there are enough free physical
       extents in it:

       lvextend -L +54 /dev/vg01/lvol10 /dev/sdk3

       Extends the size of logical volume "vg01/lvol01" by the amount of free space on physical volume /dev/sdk3. This is equivalent to specifying "-l +100%PVS" on the command line:

       lvextend /dev/vg01/lvol01 /dev/sdk3

       Extends a logical volume "vg01/lvol01" by 16MiB using physical extents /dev/sda:8-9 and /dev/sdb:8-9 for allocation of extents:

       lvextend -L+16M vg01/lvol01 /dev/sda:8-9 /dev/sdb:8-9

SEE ALSO
       fsadm(8), lvm(8), lvm.conf(5), lvcreate(8), lvconvert(8), lvreduce(8), lvresize(8), lvchange(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                        LVEXTEND(8)
