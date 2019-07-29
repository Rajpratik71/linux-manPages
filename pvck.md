PVCK(8)                                                       System Manager's Manual                                                      PVCK(8)

NAME
       pvck — check physical volume metadata

SYNOPSIS
       pvck [--commandprofile ProfileName] [-d|--debug] [-h|--help] [-v|--verbose] [--labelsector sector] PhysicalVolume [PhysicalVolume...]

DESCRIPTION
       pvck checks physical volume LVM metadata for consistency.

OPTIONS
       See lvm(8) for common options.

       --labelsector sector
              By  default, 4 sectors of PhysicalVolume are scanned for an LVM label, starting at sector 0.  This parameter allows you to specify a
              different starting sector for the scan and is useful for recovery situations.  For example, suppose the partition table is corrupted
              or  lost  on /dev/sda, but you suspect there was an LVM partition at approximately 100 MiB.  This area of the disk may be scanned by
              using the --labelsector parameter with a value of 204800 (100 * 1024 * 1024 / 512 = 204800):

              pvck --labelsector 204800 /dev/sda

              Note that a script can be used with --labelsector to automate the process of finding LVM labels.

SEE ALSO
       lvm(8), pvcreate(8), pvscan(8) vgck(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                                 PVCK(8)
