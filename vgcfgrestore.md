VGCFGRESTORE(8)                                                                          System Manager's Manual                                                                          VGCFGRESTORE(8)

NAME
       vgcfgrestore — restore volume group descriptor area

SYNOPSIS
       vgcfgrestore [--commandprofile ProfileName] [-d|--debug] [-f|--file <filename>] [--force] [-l[l]|--list] [-h|--help] [-M|--metadatatype 1|2] [-t|--test] [-v|--verbose] VolumeGroupName

DESCRIPTION
       vgcfgrestore  allows  you to restore the metadata of VolumeGroupName from a text backup file produced by vgcfgbackup.  You can specify a backup file with --file.  If no backup file is specified,
       the most recent one is used.  Use --list for a list of the available backup and archive files of VolumeGroupName.

OPTIONS
       See lvm(8) for common options.

       -l, --list
              List files pertaining to VolumeGroupName List metadata backup and archive files pertaining to VolumeGroupName.  May be used with the -f option.  Does not restore VolumeGroupName.

       -f, --file filename
              Name of LVM metadata backup file Specifies a metadata backup or archive file to be used for restoring VolumeGroupName.  Often this file has been created with vgcfgbackup.

       --force
              Necessary to restore metadata with thin pool volumes.
              WARNING: Use with extreme caution.  Most changes to thin metadata cannot be reverted.  You may lose data if you restore metadata that does not match the thin  pool  kernel  metadata  pre‐
              cisely.

REPLACING PHYSICAL VOLUMES
       vgdisplay  --partial --verbose will show you the UUIDs and sizes of any PVs that are no longer present.  If a PV in the VG is lost and you wish to substitute another of the same size, use pvcre‐
       ate --restorefile filename --uuid uuid (plus additional arguments as appropriate) to initialise it with the same UUID as the missing PV.  Repeat for all other missing PVs in the  VG.   Then  use
       vgcfgrestore --file filename to restore the volume group's metadata.

SEE ALSO
       lvm(8), vgcreate(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                    VGCFGRESTORE(8)
