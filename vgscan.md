VGSCAN(8)                                                                                System Manager's Manual                                                                                VGSCAN(8)

NAME
       vgscan — scan all disks for volume groups and rebuild caches

SYNOPSIS
       vgscan [--commandprofile ProfileName] [-d|--debug] [-h|-?|--help] [--ignorelockingfailure] [--mknodes] [-P|--partial] [-v|--verbose]

DESCRIPTION
       vgscan  scans  all  SCSI,  (E)IDE  disks,  multiple devices and a bunch of other disk devices in the system looking for LVM physical volumes and volume groups.  Define a filter in lvm.conf(5) to
       restrict the scan to avoid a CD ROM, for example.

       In LVM2, vgscans take place automatically; but you might still need to run one explicitly after changing hardware.

OPTIONS
       See lvm(8) for common options.

       --mknodes
              Also checks the LVM special files in /dev that are needed for active logical volumes and creates any missing ones and removes unused ones.

       --cache
              Scan devices for LVM physical volumes and volume groups and instruct the lvmetad daemon to update its cached state accordingly.

SEE ALSO
       lvm(8), vgcreate(8), vgchange(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                          VGSCAN(8)
