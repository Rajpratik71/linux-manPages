PVREMOVE(8)                                                   System Manager's Manual                                                  PVREMOVE(8)

NAME
       pvremove — remove a physical volume

SYNOPSIS
       pvremove   [--commandprofile  ProfileName]  [-d|--debug]  [-h|--help]  [-t|--test]  [-v|--verbose]  [--version]  [-f[f]|--force  [--force]]
       [--reportformat {basic|json}] [-y|--yes] PhysicalVolume [PhysicalVolume...]

DESCRIPTION
       pvremove wipes the label on a device so that LVM will no longer recognise it as a physical volume.

OPTIONS
       See lvm(8) for common options.

       -ff, --force --force
              Force the removal of a physical volume belonging to an existing volume group.  Normally vgreduce(8) should be used instead  of  this
              command.  You cannot remove a physical volume which in use by some active logical volume.

       -y, --yes
              Answer yes to all questions.

SEE ALSO
       lvm(8), pvcreate(8), pvdisplay(8), vgreduce(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             PVREMOVE(8)
