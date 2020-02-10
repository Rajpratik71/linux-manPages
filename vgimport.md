VGIMPORT(8)                                                                              System Manager's Manual                                                                              VGIMPORT(8)

NAME
       vgimport — make exported volume groups known to the system

SYNOPSIS
       vgimport [-a|--all] [-d|--debug] [-h|-?|--help] [-S|--select Selection] [-v|--verbose] [VolumeGroupName...]

DESCRIPTION
       vgimport allows you to make a Volume Group that was previously exported using vgexport(8) known to the system again, perhaps after moving its Physical Volumes from a different machine.  vgexport
       clears the VG system ID, and vgimport sets the VG system ID to match the host running vgimport (if the host has a system ID).

OPTIONS
       See lvm(8) for common options.

       -a, --all
              Import all exported Volume Groups.

       --force
              Import exported Volume Groups even if there are missing Physical Volumes.  This option should only be used if the missing devices are known to have failed and they cannot be restored.

SEE ALSO
       lvm(8), pvscan(8), vgexport(8), vgscan(8), lvmsystemid(7)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                        VGIMPORT(8)
