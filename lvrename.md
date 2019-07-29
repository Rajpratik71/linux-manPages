LVRENAME(8)                                                   System Manager's Manual                                                  LVRENAME(8)

NAME
       lvrename — rename a logical volume

SYNOPSIS
       lvrename   [-A|--autobackup   {y|n}]   [--commandprofile  ProfileName]  [-d|--debug]  [-h|--help]  [-t|--test]  [-v|--verbose]  [--version]
       [-f|--force] [--noudevsync] [--reportformat {basic|json}] {OldLogicalVolume{Name|Path} NewLogicalVolume{Name|Path} |  VolumeGroupName  Old‐
       LogicalVolumeName NewLogicalVolumeName}

DESCRIPTION
       lvrename  renames  an  existing  logical volume or an existing historical logical volume from OldLogicalVolume{Name|Path} to NewLogicalVol‐
       ume{Name|Path}.

OPTIONS
       See lvm(8) for common options.

       --noudevsync
              Disable udev synchronisation. The process will not wait for notification from udev.  It will continue irrespective of  any  possible
              udev  processing  in the background.  You should only use this if udev is not running or has rules that ignore the devices LVM2 cre‐
              ates.

EXAMPLE
       To rename lvold in volume group vg02 to lvnew:

       lvrename /dev/vg02/lvold vg02/lvnew

       An alternate syntax to rename this logical volume is:

       lvrename vg02 lvold lvnew

SEE ALSO
       lvm(8), lvchange(8), vgcreate(8), vgrename(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             LVRENAME(8)
