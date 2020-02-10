VGMKNODES(8)                                                                             System Manager's Manual                                                                             VGMKNODES(8)

NAME
       vgmknodes — recreate volume group directory and logical volume special files

SYNOPSIS
       vgmknodes [--commandprofile ProfileName] [-d|--debug] [-h|--help] [--refresh] [-v|--verbose] [[VolumeGroupName|LogicalVolumePath]...]

DESCRIPTION
       Checks the LVM2 special files in /dev that are needed for active logical volumes and creates any missing ones and removes unused ones.

OPTIONS
       See lvm(8) for common options.

       --refresh
              If  any  logical  volume  in  the volume group is active, reload its metadata.  This is not necessary in normal operation, but may be useful if something has gone wrong or if you're doing
              clustering manually without a clustered lock manager.

SEE ALSO
       lvm(8), vgscan(8), dmsetup(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                       VGMKNODES(8)
