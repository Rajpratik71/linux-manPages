LVCREATE(8)                                                                              System Manager's Manual                                                                              LVCREATE(8)

NAME
       lvcreate - create a logical volume in an existing volume group

SYNOPSIS
       lvcreate [-a|--activate [a][e|l|s]{y|n}] [--addtag Tag] [--alloc AllocationPolicy] [-A|--autobackup {y|n}] [-H|--cache] [--cachemode {passthrough|writeback|writethrough}] [--cachepolicy policy]
       [--cachepool CachePoolLogicalVolume] [--cachesettings key=value] [-c|--chunksize ChunkSize] [--commandprofile ProfileName] [-C|--contiguous {y|n}] [-d|--debug] [--discards
       {ignore|nopassdown|passdown}] [--errorwhenfull {y|n}] [{-l|--extents LogicalExtentsNumber[%{FREE|PVS|VG}] | -L|--size LogicalVolumeSize} [-i|--stripes Stripes [-I|--stripesize StripeSize]]]
       [-h|-?|--help] [-K|--ignoreactivationskip] [--ignoremonitoring] [--minor minor [-j|--major major]] [--metadataprofile ProfileName] [-m|--mirrors Mirrors [--corelog|--mirrorlog {disk|core|mir‐
       rored}] [--nosync] [-R|--regionsize MirrorLogRegionSize]] [--monitor {y|n}] [-n|--name LogicalVolume] [--noudevsync] [-p|--permission {r|rw}] [-M|--persistent {y|n}] [--poolmetadatasize Meta‐
       dataVolumeSize] [--poolmetadataspare {y|n}] [--[raid]maxrecoveryrate Rate] [--[raid]minrecoveryrate Rate] [-r|--readahead {ReadAheadSectors|auto|none}] [-k|--setactivationskip {y|n}] [-s|--snap‐
       shot] [-V|--virtualsize VirtualSize] [-t|--test] [-T|--thin] [--thinpool ThinPoolLogicalVolume] [--type SegmentType] [-v|--verbose] [-W|--wipesignatures {y|n}] [-Z|--zero {y|n}] [Vol‐
       umeGroup[/{ExternalOrigin|Origin|Pool}LogicalVolumeName [PhysicalVolumePath[:PE[-PE]]...]]

       lvcreate [-l|--extents LogicalExtentsNumber[%{FREE|ORIGIN|PVS|VG}] | -L|--size LogicalVolumeSize] [-c|--chunksize ChunkSize] [--commandprofile ProfileName] [--noudevsync] [--ignoremonitoring]
       [--metadataprofile ProfileName] [--monitor {y|n}] [-n|--name SnapshotLogicalVolume] -s|--snapshot|-H|--cache {[VolumeGroup/]OriginalLogicalVolume [-V|--virtualsize VirtualSize]}

DESCRIPTION
       lvcreate  creates  a  new logical volume in a volume group (see vgcreate(8), vgchange(8)) by allocating logical extents from the free physical extent pool of that volume group.  If there are not
       enough free physical extents then the volume group can be extended (see vgextend(8)) with other physical volumes or by reducing existing logical volumes of this volume group in size  (see  lvre‐
       duce(8)).  If you specify one or more PhysicalVolumes, allocation of physical extents will be restricted to these volumes.
       The second form supports the creation of snapshot logical volumes which keep the contents of the original logical volume for backup purposes.

OPTIONS
       See lvm(8) for common options.

       -a|--activate [a][l|e|s]{y|n}
              Controls  the  availability  of  the Logical Volumes for immediate use after the command finishes running.  By default, new Logical Volumes are activated (-ay).  If it is possible techni‐
              cally, -an will leave the new Logical Volume inactive. But for example, snapshots of active origin can only be created in the active state so -an cannot be used with --type snapshot. This
              does not apply to thin volume snapshots, which are by default created with flag to skip their activation (-ky).  Normally the --zero n argument has to be supplied too because zeroing (the
              default behaviour) also requires activation.  If autoactivation option is used (-aay), the logical volume is activated only if it matches an item  in  the  activation/auto_activation_vol‐
              ume_list  set  in  lvm.conf(5).  For autoactivated logical volumes, --zero n and --wipesignatures n is always assumed and it can't be overridden. If the clustered locking is enabled, -aey
              will activate exclusively on one node and -a{a|l}y will activate only on the local node.

       -H|--cache
              Creates cache or cache pool logical volume.  Specifying the optional argument --extents or --size will cause the creation of the cache logical volume.  When the Volume group name is spec‐
              ified  together  with  existing  logical volume name which is NOT a cache pool name, such volume is treated as cache origin volume and cache pool is created. In this case the --extents or
              --size is used to specify size of cache pool volume.  See lvmcache(7) for more info about caching support.  Note that the cache segment type requires  a  dm-cache  kernel  module  version
              1.3.0 or greater.

       --cachemode {passthrough|writeback|writethrough}
              Specifying a cache mode determines when the writes to a cache LV are considered complete.  When writeback is specified, a write is considered complete as soon as it is stored in the cache
              pool LV.  If writethough is specified, a write is considered complete only when it has been stored in the cache pool LV and on the origin LV.  While writethrough may be slower for writes,
              it is more resilient if something should happen to a device associated with the cache pool LV.

       --cachepolicy policy
              Only applicable to cached LVs; see also lvmcache(7). Sets the cache policy. mq is the basic policy name. smq is more advanced version available in newer kernels.

       --cachepool CachePoolLogicalVolume{Name|Path}
              Specifies the name of cache pool volume name. The other way to specify pool name is to append name to Volume group name argument.

       --cachesettings key=value
              Only  applicable to cached LVs; see also lvmcache(7). Sets the cache tunable settings. In most use-cases, default values should be adequate.  Special string value default switches setting
              back to its default kernel value and removes it from the list of settings stored in lvm2 metadata.

       -c|--chunksize ChunkSize[b|B|s|S|k|K|m|M|g|G]
              Gives the size of chunk for snapshot, cache pool and thin pool logical volumes.  Default unit is in kilobytes.
              For snapshots the value must be power of 2 between 4KiB and 512KiB and the default value is 4KiB.
              For cache pools the value must a multiple of 32KiB between 32KiB and 1GiB. The default is 64KiB.
              For thin pools the value must be a multiple of 64KiB between 64KiB and 1GiB.  Default value starts with 64KiB and grows up to fit the pool metadata size within 128MiB, if the  pool  meta‐
              data  size  is not specified.  See lvm.conf(5) setting allocation/thin_pool_chunk_size_policy to select different calculation policy.  Thin pool target version <1.4 requires this value to
              be a power of 2.  For target version <1.5 discard is not supported for non power of 2 values.

       -C|--contiguous {y|n}
              Sets or resets the contiguous allocation policy for logical volumes. Default is no contiguous allocation based on a next free principle.

       --corelog
              This is shortcut for option --mirrorlog core.

       --discards {ignore|nopassdown|passdown}
              Sets discards behavior for thin pool.  Default is passdown.

       --errorwhenfull {y|n}
              Configures thin pool behaviour when data space is exhausted.  Default is no.  Device will queue I/O operations until target timeout (see dm-thin-pool kernel module  option  no_space_time‐
              out) expires. Thus configured system has a time to i.e. extend the size of thin pool data device.  When set to yes, the I/O operation is immeditelly errored.

       -K|--ignoreactivationskip
              Ignore the flag to skip Logical Volumes during activation.  Use --setactivationskip option to set or reset activation skipping flag persistently for logical volume.

       --ignoremonitoring
              Make no attempt to interact with dmeventd unless --monitor is specified.

       -l|--extents LogicalExtentsNumber[%{VG|PVS|FREE|ORIGIN}]
              Gives  the  number of logical extents to allocate for the new logical volume.  The total number of physical extents allocated will be greater than this, for example, if the volume is mir‐
              rored.  The number can also be expressed as a percentage of the total space in the Volume Group with the suffix %VG, as a percentage of the remaining free space in the Volume  Group  with
              the  suffix %FREE, as a percentage of the remaining free space for the specified PhysicalVolume(s) with the suffix %PVS, or (for a snapshot) as a percentage of the total space in the Ori‐
              gin Logical Volume with the suffix %ORIGIN (i.e. 100%ORIGIN provides space for the whole origin).  When expressed as a percentage, the number is treated as an approximate upper limit  for
              the number of physical extents to be allocated (including extents used by any mirrors, for example).

       -j|--major major
              Sets  the  major  number.   Major  numbers are not supported with pool volumes.  This option is supported only on older systems (kernel version 2.4) and is ignored on modern Linux systems
              where major numbers are dynamically assigned.

       --metadataprofile ProfileName
              Uses and attaches the ProfileName configuration profile to the logical volume metadata. Whenever the logical volume is processed next time, the profile is automatically  applied.  If  the
              volume group has another profile attached, the logical volume profile is preferred.  See lvm.conf(5) for more information about metadata profiles.

       --minor minor
              Sets the minor number.  Minor numbers are not supported with pool volumes.

       -m|--mirrors mirrors
              Creates a mirrored logical volume with mirrors copies.  For example, specifying -m 1 would result in a mirror with two-sides; that is, a linear volume plus one copy.

              Specifying the optional argument --nosync will cause the creation of the mirror to skip the initial resynchronization.  Any data written afterwards will be mirrored, but the original con‐
              tents will not be copied.  This is useful for skipping a potentially long and resource intensive initial sync of an empty device.

              There are two implementations of mirroring which can be used and correspond to the "raid1" and "mirror" segment types.  The default is "raid1".  See the --type option for more information
              if  you  would like to use the legacy "mirror" segment type.  See lvm.conf(5) settings  global/mirror_segtype_default and global/raid10_segtype_default to configure default mirror segment
              type.  The options --mirrorlog and --corelog apply to the legacy "mirror" segment type only.

       --mirrorlog {disk|core|mirrored}
              Specifies the type of log to be used for logical volumes utilizing the legacy "mirror" segment type.
              The default is disk, which is persistent and requires a small amount of storage space, usually on a separate device from the data being mirrored.
              Using core means the mirror is regenerated by copying the data from the first device each time the logical volume is activated, like after every reboot.
              Using mirrored will create a persistent log that is itself mirrored.

       --monitor {y|n}
              Starts or avoids monitoring a mirrored, snapshot or thin pool logical volume with dmeventd, if it is installed.  If a device used by a monitored mirror reports an I/O error,  the  failure
              is handled according to activation/mirror_image_fault_policy and activation/mirror_log_fault_policy set in lvm.conf(5).

       -n|--name LogicalVolume{Name|Path}
              Sets the name for the new logical volume.
              Without this option a default name of "lvol#" will be generated where # is the LVM internal number of the logical volume.

       --nosync
              Causes the creation of the mirror to skip the initial resynchronization.

       --noudevsync
              Disables udev synchronisation. The process will not wait for notification from udev.  It will continue irrespective of any possible udev processing in the background.  You should only use
              this if udev is not running or has rules that ignore the devices LVM2 creates.

       -p|--permission {r|rw}
              Sets access permissions to read only (r) or read and write (rw).
              Default is read and write.

       -M|--persistent {y|n}
              Set to y to make the minor number specified persistent.  Pool volumes cannot have persistent major and minor numbers.  Defaults to yes only when major or minor number is specified.   Oth‐
              erwise it is no.

       --poolmetadatasize MetadataVolumeSize[b|B|s|S|k|K|m|M|g|G]
              Sets  the  size  of  pool's metadata logical volume.  Supported values are in range between 2MiB and 16GiB for thin pool, and upto 16GiB for cache pool. The minimum value is computed from
              pool's data size.  Default value for thin pool is (Pool_LV_size / Pool_LV_chunk_size * 64b).  Default unit is megabytes.

       --poolmetadataspare {y|n}
              Controls creation and maintanence of pool metadata spare logical volume that will be used for automated pool recovery.  Only one such volume is maintained within a volume group  with  the
              size of the biggest pool metadata volume.  Default is yes.

       --[raid]maxrecoveryrate Rate[b|B|s|S|k|K|m|M|g|G]
              Sets  the maximum recovery rate for a RAID logical volume.  Rate is specified as an amount per second for each device in the array.  If no suffix is given, then KiB/sec/device is assumed.
              Setting the recovery rate to 0 means it will be unbounded.

       --[raid]minrecoveryrate Rate[b|B|s|S|k|K|m|M|g|G]
              Sets the minimum recovery rate for a RAID logical volume.  Rate is specified as an amount per second for each device in the array.  If no suffix is given, then KiB/sec/device is  assumed.
              Setting the recovery rate to 0 means it will be unbounded.

       -r|--readahead {ReadAheadSectors|auto|none}
              Sets  read  ahead sector count of this logical volume.  For volume groups with metadata in lvm1 format, this must be a value between 2 and 120.  The default value is auto which allows the
              kernel to choose a suitable value automatically.  none is equivalent to specifying zero.

       -R|--regionsize MirrorLogRegionSize[b|B|s|S|k|K|m|M|g|G]
              A mirror is divided into regions of this size (in MiB), and the mirror log uses this granularity to track which regions are in sync.

       -k|--setactivationskip {y|n}
              Controls whether Logical Volumes are persistently flagged to be skipped during activation. By default, thin snapshot volumes are flagged for  activation  skip.   See  lvm.conf(5)  activa‐
              tion/auto_set_activation_skip how to change its default behaviour.  To activate such volumes, an extra --ignoreactivationskip option must be used. The flag is not applied during deactiva‐
              tion. Use lvchange --setactivationskip command to change the skip flag for existing volumes.  To see whether the flag is attached, use lvs command where the state of the flag is  reported
              within lv_attr bits.

       -L|--size LogicalVolumeSize[b|B|s|S|k|K|m|M|g|G|t|T|p|P|e|E]
              Gives the size to allocate for the new logical volume.  A size suffix of B for bytes, S for sectors as 512 bytes, K for kilobytes, M for megabytes, G for gigabytes, T for terabytes, P for
              petabytes or E for exabytes is optional.
              Default unit is megabytes.

       -s|--snapshot OriginalLogicalVolume{Name|Path}
              Creates a snapshot logical volume (or snapshot) for an existing, so called original logical volume (or origin).  Snapshots provide a 'frozen image' of the contents of the origin while the
              origin can still be updated. They enable consistent backups and online recovery of removed/overwritten data/files.
              Thin  snapshot  is created when the origin is a thin volume and the size IS NOT specified. Thin snapshot shares same blocks within the thin pool volume.  The non thin volume snapshot with
              the specified size does not need the same amount of storage the origin has. In a typical scenario, 15-20% might be enough. In case the snapshot runs out of  storage,  use  lvextend(8)  to
              grow  it.  Shrinking  a snapshot is supported by lvreduce(8) as well. Run lvs(8) on the snapshot in order to check how much data is allocated to it.  Note: a small amount of the space you
              allocate to the snapshot is used to track the locations of the chunks of data, so you should allocate slightly more space than you actually need and monitor (--monitor) the rate at  which
              the  snapshot  data is growing so you can avoid running out of space.  If --thinpool is specified, thin volume is created that will use given original logical volume as an external origin
              that serves unprovisioned blocks.  Only read-only volumes can be used as external origins.  To make the volume external origin, lvm expects the volume to  be  inactive.   External  origin
              volume can be used/shared for many thin volumes even from different thin pools. See lvconvert(8) for online conversion to thin volumes with external origin.

       -i|--stripes Stripes
              Gives the number of stripes.  This is equal to the number of physical volumes to scatter the logical volume.  When creating a RAID 4/5/6 logical volume, the extra devices which are neces‐
              sary for parity are internally accounted for.  Specifying -i 3 would use 3 devices for striped logical volumes, 4 devices for RAID 4/5, and 5 devices  for  RAID  6.   Alternatively,  RAID
              4/5/6 will stripe across all PVs in the volume group or all of the PVs specified if the -i argument is omitted.

       -I|--stripesize StripeSize
              Gives the number of kilobytes for the granularity of the stripes.
              StripeSize must be 2^n (n = 2 to 9) for metadata in LVM1 format.  For metadata in LVM2 format, the stripe size may be a larger power of 2 but must not exceed the physical extent size.

       -T|--thin
              Creates  thin  pool or thin logical volume or both.  Specifying the optional argument --size or --extents will cause the creation of the thin pool logical volume.  Specifying the optional
              argument --virtualsize will cause the creation of the thin logical volume from given thin pool volume.  Specifying both arguments will cause the creation of both thin pool and thin volume
              using this pool.  See lvmthin(7) for more info about thin provisioning support.  Thin provisioning requires device mapper kernel driver from kernel 3.2 or greater.

       --thinpool ThinPoolLogicalVolume{Name|Path}
              Specifies the name of thin pool volume name. The other way to specify pool name is to append name to Volume group name argument.

       --type SegmentType
              Creates  a  logical volume with the specified segment type.  Supported types are: cache, cache-pool, error, linear, mirror, raid1, raid4, raid5_la, raid5_ls (= raid5), raid5_ra, raid5_rs,
              raid6_nc, raid6_nr, raid6_zr (= raid6), raid10, snapshot, striped, thin, thin-pool or zero.  Segment type may have a commandline switch alias that will enable its use.  When the  type  is
              not  explicitly  specified  an  implicit  type  is selected from combination of options: -H|--cache|--cachepool (cache or cachepool), -T|--thin|--thinpool (thin or thinpool), -m|--mirrors
              (raid1 or mirror), -s|--snapshot|-V|--virtualsize (snapshot or thin), -i|--stripes (striped).  Default segment type is linear.

       -V|--virtualsize VirtualSize[b|B|s|S|k|K|m|M|g|G|t|T|p|P|e|E]
              Creates a thinly provisioned device or a sparse device of the given size (in MiB by default).  See lvm.conf(5) settings global/sparse_segtype_default to configure default  sparse  segment
              type.   See lvmthin(7) for more info about thin provisioning support.  Anything written to a sparse snapshot will be returned when reading from it.  Reading from other areas of the device
              will return blocks of zeros.  Virtual snapshot (sparse snapshot) is implemented by creating a hidden virtual device of the requested size using the zero target.  A suffix of  _vorigin  is
              used for this device.  Note: using sparse snapshots is not efficient for larger device sizes (GiB), thin provisioning should be used for this case.

       -W|--wipesignatures {y|n}
              Controls  wiping  of detected signatures on newly created Logical Volume.  If this option is not specified, then by default signature wiping is done each time the zeroing ( -Z|--zero ) is
              done. This default behaviour can be controlled by allocation/wipe_signatures_when_zeroing_new_lvs setting found in lvm.conf(5).
              If blkid wiping is used allocation/use_blkid_wiping setting in lvm.conf(5)) and LVM2 is compiled with blkid wiping support, then blkid(8) library is used to  detect  the  signatures  (use
              blkid -k command to list the signatures that are recognized).  Otherwise, native LVM2 code is used to detect signatures (MD RAID, swap and LUKS signatures are detected only in this case).
              Logical volume is not wiped if the read only flag is set.

       -Z|--zero {y|n}
              Controls zeroing of the first 4KiB of data in the new logical volume.  Default is yes.  Snapshot COW volumes are always zeroed.  Logical volume is not zeroed if the read only flag is set.
              Warning: trying to mount an unzeroed logical volume can cause the system to hang.

Examples
       Creates a striped logical volume with 3 stripes, a stripe size of 8KiB and a size of 100MiB in the volume group named vg00.  The logical volume name will be chosen by lvcreate:

       lvcreate -i 3 -I 8 -L 100M vg00

       Creates  a  mirror  logical  volume with 2 sides with a useable size of 500 MiB.  This operation would require 3 devices (or option --alloc anywhere) - two for the mirror devices and one for the
       disk log:

       lvcreate -m1 -L 500M vg00

       Creates a mirror logical volume with 2 sides with a useable size of 500 MiB.  This operation would require 2 devices - the log is "in-memory":

       lvcreate -m1 --mirrorlog core -L 500M vg00

       Creates a snapshot logical volume named "vg00/snap" which has access to the contents of the original logical volume named "vg00/lvol1" at snapshot logical volume creation time. If  the  original
       logical  volume  contains  a file system, you can mount the snapshot logical volume on an arbitrary directory in order to access the contents of the filesystem to run a backup while the original
       filesystem continues to get updated:

       lvcreate --size 100m --snapshot --name snap /dev/vg00/lvol1

       Creates a snapshot logical volume named "vg00/snap" with size for overwriting 20% of the original logical volume named "vg00/lvol1".:

       lvcreate -s -l 20%ORIGIN --name snap vg00/lvol1

       Creates a sparse device named /dev/vg1/sparse of size 1TiB with space for just under 100MiB of actual data on it:

       lvcreate --virtualsize 1T --size 100M --snapshot --name sparse vg1

       Creates a linear logical volume "vg00/lvol1" using physical extents /dev/sda:0-7 and /dev/sdb:0-7 for allocation of extents:

       lvcreate -L 64M -n lvol1 vg00 /dev/sda:0-7 /dev/sdb:0-7

       Creates a 5GiB RAID5 logical volume "vg00/my_lv", with 3 stripes (plus a parity drive for a total of 4 devices) and a stripesize of 64KiB:

       lvcreate --type raid5 -L 5G -i 3 -I 64 -n my_lv vg00

       Creates a RAID5 logical volume "vg00/my_lv", using all of the free space in the VG and spanning all the PVs in the VG:

       lvcreate --type raid5 -l 100%FREE -n my_lv vg00

       Creates a 5GiB RAID10 logical volume "vg00/my_lv", with 2 stripes on 2 2-way mirrors.  Note that the -i and -m arguments behave differently.  The -i specifies the  number  of  stripes.   The  -m
       specifies the number of additional copies:

       lvcreate --type raid10 -L 5G -i 2 -m 1 -n my_lv vg00

       Creates 100MiB pool logical volume for thin provisioning build with 2 stripes 64KiB and chunk size 256KiB together with 1TiB thin provisioned logical volume "vg00/thin_lv":

       lvcreate -i 2 -I 64 -c 256 -L100M -T vg00/pool -V 1T --name thin_lv

       Creates a thin snapshot volume "thinsnap" of thin volume "thinvol" that will share the same blocks within the thin pool.  Note: the size MUST NOT be specified, otherwise the non-thin snapshot is
       created instead:

       lvcreate -s vg00/thinvol --name thinsnap

       Creates a thin snapshot volume of read-only inactive volume "origin" which then becomes the thin external origin for the thin snapshot volume  in  vg00  that  will  use  an  existing  thin  pool
       "vg00/pool":

       lvcreate -s --thinpool vg00/pool origin

       Create a cache pool LV that can later be used to cache one logical volume.

       lvcreate --type cache-pool -L 1G -n my_lv_cachepool vg /dev/fast1

       If there is an existing cache pool LV, create the large slow device (i.e. the origin LV) and link it to the supplied cache pool LV, creating a cache LV.

       lvcreate --cache -L 100G -n my_lv vg/my_lv_cachepool /dev/slow1

       If there is an existing logical volume, create the small and fast cache pool LV and link it to the supplied existing logical volume (i.e. the origin LV), creating a cache LV.

       lvcreate --type cache -L 1G -n my_lv_cachepool vg/my_lv /dev/fast1

SEE ALSO
       lvm(8), lvm.conf(5), lvmcache(7), lvmthin(7), lvconvert(8), lvchange(8), lvextend(8), lvreduce(8), lvremove(8), lvrename(8) lvs(8), lvscan(8), vgcreate(8), blkid(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                        LVCREATE(8)
