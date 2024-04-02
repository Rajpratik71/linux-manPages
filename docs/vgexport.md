VGEXPORT(8)                                                                                System Manager's Manual                                                                                VGEXPORT(8)



NAME
       vgexport - make volume groups unknown to the system

SYNOPSIS
       vgexport [-a|--all] [--commandprofile ProfileName] [-d|--debug] [-h|-?|--help] [-S|--select Selection] [-v|--verbose] [VolumeGroupName...]

DESCRIPTION
       vgexport allows you to make the inactive VolumeGroupName(s) unknown to the system.  You can then move all the Physical Volumes in that Volume Group to a different system for later vgimport(8).  Most
       LVM2 tools ignore exported Volume Groups.

OPTIONS
       See lvm(8) for common options.

       -a, --all
              Export all inactive Volume Groups.

SEE ALSO
       lvm(8), pvscan(8), vgimport(8), vgscan(8)



Sistina Software UK                                                                   LVM TOOLS 2.02.120(2) (2015-05-15)                                                                          VGEXPORT(8)
