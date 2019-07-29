VGEXPORT(8)                                                   System Manager's Manual                                                  VGEXPORT(8)

NAME
       vgexport - make volume groups unknown to the system

SYNOPSIS
       vgexport  [-a|--all]  [--commandprofile  ProfileName]  [-d|--debug]  [-h|-?|--help]  [--reportformat  {basic|json}] [-S|--select Selection]
       [-v|--verbose] [VolumeGroupName...]

DESCRIPTION
       vgexport allows you to make the inactive VolumeGroupName(s) unknown to the system.  You can then move all the Physical Volumes in that Vol‐
       ume  Group  to a different system for later vgimport(8).  Most LVM2 tools ignore exported Volume Groups.  vgexport clears the VG system ID,
       and vgimport sets the VG system ID to match the host running vgimport (if the host has a system ID).

OPTIONS
       See lvm(8) for common options.

       -a, --all
              Export all inactive Volume Groups.

SEE ALSO
       lvm(8), pvscan(8), vgimport(8), vgscan(8), lvmsystemid(7)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             VGEXPORT(8)
