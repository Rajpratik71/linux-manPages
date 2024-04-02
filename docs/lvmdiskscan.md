LVMDISKSCAN(8)                                                                             System Manager's Manual                                                                             LVMDISKSCAN(8)



NAME
       lvmdiskscan — scan for all devices visible to LVM2

SYNOPSIS
       lvmdiskscan [--commandprofile ProfileName] [-d|--debug] [-h|-?|--help] [-l|--lvmpartition] [-v|--verbose]

DESCRIPTION
       lvmdiskscan  scans  all  SCSI, (E)IDE disks, multiple devices and a bunch of other block devices in the system looking for LVM physical volumes.  The size reported is the real device size.  Define a
       filter in lvm.conf(5) to restrict the scan to avoid a CD ROM, for example.

OPTIONS
       See lvm(8) for common options.

       -l, --lvmpartition
              Only reports Physical Volumes.

SEE ALSO
       lvm(8), lvm.conf(5), pvscan(8), vgscan(8)



Sistina Software UK                                                                   LVM TOOLS 2.02.120(2) (2015-05-15)                                                                       LVMDISKSCAN(8)
