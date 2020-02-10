VGSPLIT(8)                                                                               System Manager's Manual                                                                               VGSPLIT(8)

NAME
       vgsplit — split a volume group into two

SYNOPSIS
       vgsplit  [--alloc  AllocationPolicy] [-A|--autobackup {y|n}] [-c|--clustered {y|n}] [--commandprofile ProfileName] [-d|--debug] [-h|--help] [-l|--maxlogicalvolumes MaxLogicalVolumes] [-M|--meta‐
       datatype type] [-p|--maxphysicalvolumes MaxPhysicalVolumes] [--[vg]metadatacopies NumberOfCopies|unmanaged|all] [-n|--name  LogicalVolumeName]  [-t|--test]  [-v|--verbose]  SourceVolumeGroupName
       DestinationVolumeGroupName [PhysicalVolumePath...]

DESCRIPTION
       vgsplit  moves  one or more physical volumes from SourceVolumeGroupName into DestinationVolumeGroupName.  The physical volumes moved can be specified either explicitly via PhysicalVolumePath, or
       implicitly by -n LogicalVolumeName, in which case only physical volumes underlying the specified logical volume will be moved.

       If DestinationVolumeGroupName does not exist, a new volume group will be created.  The default attributes for the new volume group can be specified with  --alloc,  --clustered,  --maxlogicalvol‐
       umes,  --metadatatype,  --maxphysicalvolumes and --[vg]metadatacopies (see vgcreate(8) for a description of these options).  If any of these options are not given, default attribute(s) are taken
       from SourceVolumeGroupName. If a non-LVM2 metadata type (e.g. lvm1) is being used, you should use the -M option to specify the metadata type directly.

       If DestinationVolumeGroupName does exist, it will be checked for compatibility with SourceVolumeGroupName before the physical volumes are moved. Specifying any of the above default volume  group
       attributes with an existing destination volume group is an error, and no split will occur.

       Logical  volumes  cannot  be split between volume groups. vgsplit(8) only moves complete physical volumes: To move part of a physical volume, use pvmove(8).  Each existing logical volume must be
       entirely on the physical volumes forming either the source or the destination volume group.  For this reason, vgsplit(8) may fail with an error if a split would result in a logical volume  being
       split across volume groups.

       A  vgsplit  into  an existing volume group retains the existing volume group's value of vgmetadatacopies (see vgcreate(8) and lvm.conf(5) for further explanation of vgmetadatacopies).  To change
       the value of vgmetadatacopies, use vgchange(8).

OPTIONS
       See lvm(8) for common options.

SEE ALSO
       lvm(8), vgcreate(8), vgextend(8), vgreduce(8), vgmerge(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                         VGSPLIT(8)
