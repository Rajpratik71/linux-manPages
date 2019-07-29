VGREMOVE(8)                                                   System Manager's Manual                                                  VGREMOVE(8)

NAME
       vgremove — remove a volume group

SYNOPSIS
       vgremove  [--commandprofile ProfileName] [-d|--debug] [-f|--force] [-h|-?|--help] [--noudevsync] [--reportformat {basic|json}] [-S|--select
       Selection] [-t|--test] [-v|--verbose] [VolumeGroupName...]

DESCRIPTION
       vgremove allows you to remove one or more volume groups.  If one or more physical volumes in the volume group are lost,  consider  vgreduce
       --removemissing to make the volume group metadata consistent again.

       If  there  are logical volumes that exist in the volume group, a prompt will be given to confirm removal.  You can override the prompt with
       -f.

OPTIONS
       See lvm(8) for common options.

       -f, --force
              Force the removal of any logical volumes on the volume group without confirmation.  To remove also damaged pool volumes use -ff.

       --noudevsync
              Disable udev synchronisation. The process will not wait for notification from udev.  It will continue irrespective of  any  possible
              udev  processing  in the background.  You should only use this if udev is not running or has rules that ignore the devices LVM2 cre‐
              ates.

SEE ALSO
       lvm(8), lvremove(8), vgcreate(8), vgreduce(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             VGREMOVE(8)
