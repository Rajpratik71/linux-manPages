VGCREATE(8)                                                   System Manager's Manual                                                  VGCREATE(8)

NAME
       vgcreate — create a volume group

SYNOPSIS
       vgcreate   [--addtag  Tag]  [--alloc  AllocationPolicy]  [-A|--autobackup  {y|n}]  [-c|--clustered  {y|n}]  [--commandprofile  ProfileName]
       [-d|--debug] [-h|--help] [-l|--maxlogicalvolumes MaxLogicalVolumes] [-M|--metadatatype type] [--metadataprofile ProfileName] [-p|--maxphys‐
       icalvolumes  MaxPhysicalVolumes] [--[vg]metadatacopies NumberOfCopies|unmanaged|all] [-s|--physicalextentsize PhysicalExtentSize[bBsSkKmMg‐
       GtTpPeE]] [--reportformat {basic|json}] [--shared] [--systemid SystemID] [-t|--test] [-v|--verbose] [--version] [PHYSICAL  DEVICE  OPTIONS]
       VolumeGroupName PhysicalDevicePath [PhysicalDevicePath...]

DESCRIPTION
       vgcreate creates a new volume group called VolumeGroupName using the block special device PhysicalDevicePath.

       If  PhysicalDevicePath  was not previously configured for LVM with pvcreate(8), the device will be initialized with the same default values
       used with pvcreate(8).  If non-default pvcreate values are desired, they may be given on the commandline with the same  options  as  pvcre‐
       ate(8).   See  PHYSICAL  DEVICE  OPTIONS  for  available  options.  Note that the restore-related options such as --restorefile, --uuid and
       --physicalvolumesize are not available.  If a restore operation is needed, use pvcreate(8) and vgcfgrestore(8).

OPTIONS
       See lvm(8) for common options.

       -c, --clustered {y|n}
              If clustered locking is enabled, this defaults to y indicating that this Volume Group is shared with other nodes in the cluster.

              If the new Volume Group contains only local disks that are not visible on the other nodes, you must specify --clustered n.   If  the
              cluster infrastructure is unavailable on a particular node at a particular time, you may still be able to use such Volume Groups.

       -l, --maxlogicalvolumes MaxLogicalVolumes
              Sets  the  maximum number of logical volumes allowed in this volume group.  The setting can be changed with vgchange(8).  For volume
              groups with metadata in lvm1 format, the limit and default value is 255.  If the metadata uses lvm2 format, the default value  is  0
              which removes this restriction: there is then no limit.

       -p, --maxphysicalvolumes MaxPhysicalVolumes
              Sets  the  maximum  number of physical volumes that can belong to this volume group.  The setting can be changed with vgchange.  For
              volume groups with metadata in lvm1 format, the limit and default value is 255.  If the metadata  uses  lvm2  format,  the  value  0
              removes this restriction: there is then no limit.  If you have a large number of physical volumes in a volume group with metadata in
              lvm2 format, for tool performance reasons, you should consider some use of --pvmetadatacopies 0 as described in pvcreate(8),  and/or
              use --vgmetadatacopies.

       --[vg]metadatacopies NumberOfCopies|unmanaged|all
              Sets  the  desired  number  of  metadata  copies in the volume group.  If set to a non-zero value, LVM will automatically manage the
              'metadataignore' flags on the physical volumes (see pvcreate(8) or pvchange --metadataignore) in  order  to  achieve  NumberOfCopies
              copies  of  metadata.   If  set to unmanaged, LVM will not automatically manage the 'metadataignore' flags.  If set to all, LVM will
              first clear all of the 'metadataignore' flags on all metadata areas in the volume group, then  set  the  value  to  unmanaged.   The
              vgmetadatacopies  option is useful for volume groups containing large numbers of physical volumes with metadata as it may be used to
              minimize metadata read and write overhead.  The default value is unmanaged.

       --metadataprofile ProfileName
              Uses and attaches the ProfileName configuration profile to the volume group metadata. Whenever the volume group  is  processed  next
              time,  the  profile is automatically applied. The profile is inherited by all logical volumes in the volume group unless the logical
              volume itself has its own profile attached.  See lvm.conf(5) for more information about metadata profiles.

       -s, --physicalextentsize PhysicalExtentSize[bBsSkKmMgGtTpPeE]
              Sets the physical extent size on physical volumes of this volume group.  A size suffix (k for kilobytes up to t  for  terabytes)  is
              optional,  megabytes  is  the  default if no suffix is present. For LVM2 format, the value must be a power of 2 of at least 1 sector
              (where the sector size is the largest sector size of the PVs currently used in the VG) or, if not a power of  2,  at  least  128KiB.
              For  the  older  LVM1  format, it must be a power of 2 of at least 8KiB.  The default is 4 MiB.  Once this value has been set, it is
              difficult to change it without recreating the volume group which would involve backing up and restoring data on any logical volumes.
              However, if no extents need moving for the new value to apply, it can be altered using vgchange -s.

              If  the volume group metadata uses lvm1 format, extents can vary in size from 8KiB to 16GiB and there is a limit of 65534 extents in
              each logical volume.  The default of 4 MiB leads to a maximum logical volume size of around 256GiB.

              If the volume group metadata uses lvm2 format those restrictions do not apply, but having a large number of extents will  slow  down
              the tools but have no impact on I/O performance to the logical volume.  The smallest PE is 1KiB

              The 2.4 kernel has a limitation of 2TiB per block device.

       --shared
              Create a shared VG using lvmlockd if LVM is compiled with lockd support.
               lvmlockd will select lock type sanlock or dlm depending on which lock manager is running.  This allows multiple hosts to share a VG
              on shared devices.  lvmlockd and a lock manager must be configured and running.  See lvmlockd(8).

       --systemid SystemID
              Specifies the system ID that will be given to the new VG, overriding the system ID of the host running the command.  A  VG  is  nor‐
              mally  created  without  this  option,  in  which case the new VG is given the system ID of the host creating it.  Using this option
              requires caution because the system ID of the new VG may not match the system ID of the host running the  command,  leaving  the  VG
              inaccessible to the host.  See lvmsystemid(7).

PHYSICAL DEVICE OPTIONS
       The  following  options  are  available  for initializing physical devices in the volume group.  These options are further described in the
       pvcreate(8) man page.

       -f, --force

       -y, --yes

       -Z, --zero {y|n}

       --labelsector sector

       --metadatasize size

       --pvmetadatacopies copies

       --dataalignment alignment

       --dataalignmentoffset alignment_offset

Examples
       Creates a volume group named "test_vg" using physical volumes "/dev/sdk1" and "/dev/sdl1" with default physical extent size of 4MiB:

       vgcreate test_vg /dev/sdk1 /dev/sdl1

SEE ALSO
       lvm(8), pvdisplay(8), pvcreate(8), vgdisplay(8), vgextend(8), vgreduce(8), lvcreate(8), lvdisplay(8), lvextend(8), lvreduce(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             VGCREATE(8)
