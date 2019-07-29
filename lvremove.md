LVREMOVE(8)                                                   System Manager's Manual                                                  LVREMOVE(8)

NAME
       lvremove — remove a logical volume

SYNOPSIS
       lvremove  [-A|--autobackup  {y|n}]  [--commandprofile  ProfileName]  [-d|--debug]  [-h|--help]  [--nohistory] [--reportformat {basic|json}]
       [-S|--select Selection] [-t|--test] [-v|--verbose] [--version] [-f|--force] [--noudevsync] [LogicalVolume{Name|Path}...]

DESCRIPTION
       lvremove removes one or more logical volumes.  Confirmation will be requested before  deactivating  any  active  logical  volume  prior  to
       removal.   Logical  volumes  cannot be deactivated or removed while they are open (e.g. if they contain a mounted filesystem).  Removing an
       origin logical volume will also remove all dependent snapshots.

       If the logical volume is clustered then it must be deactivated on all nodes in the cluster before it can be removed. A single lvchange com‐
       mand issued from one node can do this.

       If  the  configuration  setting metadata/record_lvs_history is enabled and the logical volume being removed forms part of the history of at
       least one logical volume that is still present then a simplified representation of the logical volume will be retained.  This includes  the
       time  of  removal  (lv_time_removed  reporting field), creation time (lv_time), name (lv_name), LV uuid (lv_uuid) and VG name (vg_name) and
       allows you to see the ancestry chain of thin snapshot volumes even after some intermediate logical volumes have been removed.  The names of
       such  historical  logical volumes acquire a hyphen as a prefix (e.g. '-lvol1') and cannot be reactivated.  Use lvremove a second time, with
       the hyphen, to remove the record of the former logical volume completely.

OPTIONS
       See lvm(8) for common options.

       -f, --force
              Remove active logical volumes without confirmation.  Tool will try to deactivate unused volume.  To proceed with damaged  pools  use
              -ff

       --nohistory
              Disable  the  recording of history of logical volumes which are being removed.  (This has no effect unless the configuration setting
              metadata/record_lvs_history is enabled.)

       --noudevsync
              Disable udev synchronisation. The process will not wait for notification from udev.  It will continue irrespective of  any  possible
              udev  processing  in the background.  You should only use this if udev is not running or has rules that ignore the devices LVM2 cre‐
              ates.

Examples
       Remove the active logical volume lvol1 in volume group vg00 without asking for confirmation:

       lvremove -f vg00/lvol1

       Remove all logical volumes in volume group vg00:

       lvremove vg00

SEE ALSO
       lvcreate(8), lvdisplay(8), lvchange(8), lvm(8), lvs(8), lvscan(8), vgremove(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             LVREMOVE(8)
