VGCONVERT(8)                                                  System Manager's Manual                                                 VGCONVERT(8)

NAME
       vgconvert - convert volume group metadata format

SYNOPSIS
       vgconvert  [--commandprofile  ProfileName]  [-d|--debug] [-h|--help] [-t|--test] [-v|--verbose] [--labelsector] [--bootloaderareasize size]
       [-M|--metadatatype type] [--pvmetadatacopies NumberOfCopies] [--metadatasize size] [--reportformat {basic|json}]  [--version]  VolumeGroup‐
       Name [VolumeGroupName...]

DESCRIPTION
       vgconvert converts VolumeGroupName metadata from one format to another provided that the metadata fits into the same space.

OPTIONS
       See lvm(8) and pvcreate(8) for options.

Examples
       Convert volume group vg1 from LVM1 metadata format to the new LVM2 metadata format.

       vgconvert -M2 vg1

RECOVERY
       Use  pvscan(8) to see which PVs lost their metadata.  Run pvcreate(8) with the --uuid and --restorefile options on each such PV to reformat
       it as it was, using the archive file that vgconvert(8) created at the start of the procedure.  Finally run vgcfgrestore(8)  with  that  ar‐
       chive file to restore the original metadata.

SEE ALSO
       lvm(8), pvcreate(8), vgcfgrestore(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                            VGCONVERT(8)
