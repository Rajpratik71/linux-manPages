LVSCAN(8)                                                                                System Manager's Manual                                                                                LVSCAN(8)

NAME
       lvscan — scan (all disks) for Logical Volumes

SYNOPSIS
       lvscan [-a|--all] [-b|--blockdevice] [--commandprofile ProfileName] [-d|--debug] [-h|--help] [--ignorelockingfailure] [-P|--partial] [-v|--verbose]

DESCRIPTION
       lvscan  scans all known volume groups or all supported LVM block devices in the system for defined Logical Volumes.  The output consists of one line for each Logical Volume indicating whether or
       not it is active, a snapshot or origin, the size of the device and its allocation policy.  Use lvs(8) or lvdisplay(8) to obtain more-comprehensive information about the Logical Volumes.

OPTIONS
       See lvm(8) for common options.

       --all  Include information in the output about internal Logical Volumes that are components of normally-accessible Logical Volumes, such as mirrors, but which are  not  independently  accessible
              (e.g.  not mountable).  For example, after creating a mirror using lvcreate -m1 --mirrorlog disk, this option will reveal three internal Logical Volumes, with suffixes mimage_0, mimage_1,
              and mlog.

       -b, --blockdevice
              This option is now ignored.  Instead, use lvs(8) or lvdisplay(8) to obtain the device number.

       --cache LogicalVolume
              Applicable only when lvmetad(8) is in use (see also lvm.conf(5), global/use_lvmetad). This command issues a rescan of physical volume labels and metadata areas of all PVs that the logical
              volume  uses.  In particular, this can be used when a RAID logical volume becomes degraded, to update information about physical volume availability. This is only necessary if the logical
              volume is not being monitored by dmeventd (see lvchange(8), option --monitor).

SEE ALSO
       lvm(8), lvcreate(8), lvdisplay(8) lvs(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                          LVSCAN(8)
