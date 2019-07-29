LVCREATE(8)                                                   System Manager's Manual                                                  LVCREATE(8)

NAME
       lvcreate - create a logical volume in an existing volume group

SYNOPSIS
       lvcreate [-a|--activate [a][e|l|s]{y|n}] [--addtag Tag] [--alloc AllocationPolicy] [-A|--autobackup {y|n}] [-H|--cache] [--cachemode
       {passthrough|writeback|writethrough}] [--cachepolicy Policy] [--cachepool CachePoolLogicalVolume] [--cachesettings Key=Value] [-c|--chunk‐
       size ChunkSize] [--commandprofile ProfileName] [-C|--contiguous {y|n}] [-d|--debug] [--discards {ignore|nopassdown|passdown}] [--errorwhen‐
       full {y|n}] [{-l|--extents LogicalExtentsNumber[%{FREE|PVS|VG}] | -L|--size LogicalVolumeSize} [-i|--stripes Stripes [-I|--stripesize
       StripeSize]]] [-h|-?|--help] [-K|--ignoreactivationskip] [--ignoremonitoring] [--minor Minor [-j|--major Major]] [--metadataprofile
       ProfileName] [-m|--mirrors Mirrors [--corelog|--mirrorlog {disk|core|mirrored}] [--nosync] [-R|--regionsize MirrorLogRegionSize]] [--moni‐
       tor {y|n}] [-n|--name LogicalVolume] [--noudevsync] [-p|--permission {r|rw}] [-M|--persistent {y|n}] [--poolmetadatasize MetadataVolume‐
       Size] [--poolmetadataspare {y|n}] [--[raid]maxrecoveryrate Rate] [--[raid]minrecoveryrate Rate] [-r|--readahead {ReadAheadSec‐
       tors|auto|none}] [--reportformat {basic|json}] [-k|--setactivationskip {y|n}] [-s|--snapshot] [-V|--virtualsize VirtualSize] [-t|--test]
       [-T|--thin] [--thinpool ThinPoolLogicalVolume] [--type SegmentType] [-v|--verbose] [-W|--wipesignatures {y|n}] [-Z|--zero {y|n}] [Vol‐
       umeGroup | {ExternalOrigin|Origin|Pool}LogicalVolume [PhysicalVolumePath[:PE[-PE]]...]]

       lvcreate [-l|--extents LogicalExtentsNumber[%{FREE|ORIGIN|PVS|VG}] | -L|--size LogicalVolumeSize] [-c|--chunksize ChunkSize]
       [--commandprofile ProfileName] [--noudevsync] [--ignoremonitoring] [--metadataprofile ProfileName] [--monitor {y|n}] [-n|--name Snapshot‐
       LogicalVolumeName] [--reportformat {basic|json}] -s|--snapshot|-H|--cache {[VolumeGroup/]OriginalLogicalVolume [-V|--virtualsize Virtual‐
       Size]}

DESCRIPTION
       lvcreate creates a new logical volume in a volume group (see vgcreate(8), vgchange(8)) by allocating logical extents from the free physical
       extent  pool  of  that volume group.  If there are not enough free physical extents then the volume group can be extended (see vgextend(8))
       with other physical volumes or by reducing existing logical volumes of this volume group in size (see lvreduce(8)).  If you specify one  or
       more PhysicalVolumes, allocation of physical extents will be restricted to these volumes.
       The  second  form  supports the creation of snapshot logical volumes which keep the contents of the original logical volume for backup pur‐
       poses.

OPTIONS
       See lvm(8) for common options.

       -a|--activate [a][l|e|s]{y|n}
              Controls the availability of the Logical Volumes for immediate use after the command finishes running.  By default, new Logical Vol‐
              umes are activated (-ay).  If it is possible technically, -an will leave the new Logical Volume inactive. But for example, snapshots
              of active origin can only be created in the active state so -an cannot be used with --type snapshot. This does  not  apply  to  thin
              volume  snapshots,  which are by default created with flag to skip their activation (-ky).  Normally the --zero n argument has to be
              supplied too because zeroing (the default behaviour) also requires activation.  If autoactivation option is used (-aay), the logical
              volume  is activated only if it matches an item in the activation/auto_activation_volume_list set in lvm.conf(5).  For autoactivated
              logical volumes, --zero n and --wipesignatures n is always assumed and it can't be overridden. If the clustered locking is  enabled,
              -aey will activate exclusively on one node and -a{a|l}y will activate only on the local node.

       -H|--cache
              Creates  cache  or  cache  pool logical volume.  Specifying the optional argument --extents or --size will cause the creation of the
              cache logical volume.  When the Volume group name is specified together with existing logical volume name which is NOT a cache  pool
              name, such volume is treated as cache origin volume and cache pool is created. In this case the --extents or --size is used to spec‐
              ify size of cache pool volume.  See lvmcache(7) for more info about caching support.  Note that the cache segment  type  requires  a
              dm-cache kernel module version 1.3.0 or greater.

       --cachemode {passthrough|writeback|writethrough}
              Specifying  a  cache mode determines when the writes to a cache LV are considered complete.  When writeback is specified, a write is
              considered complete as soon as it is stored in the cache pool LV.  If writethough is specified, a write is considered complete  only
              when  it  has  been  stored  in  the  cache  pool  LV and on the origin LV.  While writethrough may be slower for writes, it is more
              resilient if something should happen to a device associated with the cache pool LV. With passthrough mode, all reads are served from
              origin  LV  (all  reads  miss  the  cache) and all writes are forwarded to the origin LV; additionally, write hits cause cache block
              invalidates. See lvmcache(7) for more details.

       --cachepolicy Policy
              Only applicable to cached LVs; see also lvmcache(7). Sets the cache policy. mq is the basic policy name. smq is more  advanced  ver‐
              sion available in newer kernels.

       --cachepool CachePoolLogicalVolume{Name|Path}
              Specifies the name of cache pool volume name. The other way to specify pool name is to append name to Volume group name argument.

       --cachesettings Key=Value
              Only  applicable  to  cached LVs; see also lvmcache(7). Sets the cache tunable settings. In most use-cases, default values should be
              adequate.  Special string value default switches setting back to its default kernel value and removes it from the list  of  settings
              stored in lvm2 metadata.

       -c|--chunksize ChunkSize[b|B|s|S|k|K|m|M|g|G]
              Gives the size of chunk for snapshot, cache pool and thin pool logical volumes.  Default unit is in kilobytes.
              For snapshots the value must be power of 2 between 4KiB and 512KiB and the default value is 4KiB.
              For  cache  pools  the value must a multiple of 32KiB between 32KiB and 1GiB. The default is 64KiB.  When the size is specified with
              volume caching, it may not be smaller than cache pool creation chunk size was.
              For thin pools the value must be a multiple of 64KiB between 64KiB and 1GiB.  Default value starts with 64KiB and grows  up  to  fit
              the   pool  metadata  size  within  128MiB,  if  the  pool  metadata  size  is  not  specified.   See  lvm.conf(5)  setting  alloca‐
              tion/thin_pool_chunk_size_policy to select different calculation policy.  Thin pool target version <1.4 requires this value to be  a
              power of 2.  For target version <1.5 discard is not supported for non power of 2 values.

       -C|--contiguous {y|n}
              Sets  or resets the contiguous allocation policy for logical volumes. Default is no contiguous allocation based on a next free prin‐
              ciple.

       --corelog
              This is shortcut for option --mirrorlog core.

       --discards {ignore|nopassdown|passdown}
              Sets discards behavior for thin pool.  Default is passdown.

       --errorwhenfull {y|n}
              Configures thin pool behaviour when data space is exhausted.  Default is no.  Device will queue I/O operations until target  timeout
              (see  dm-thin-pool kernel module option no_space_timeout) expires. Thus configured system has a time to i.e. extend the size of thin
              pool data device.  When set to yes, the I/O operation is immeditelly errored.

       -K|--ignoreactivationskip
              Ignore the flag to skip Logical Volumes during activation.  Use --setactivationskip option to set or reset activation skipping  flag
              persistently for logical volume.

       --ignoremonitoring
              Make no attempt to interact with dmeventd unless --monitor is specified.

       -l|--extents LogicalExtentsNumber[%{VG|PVS|FREE|ORIGIN}]
              Specifies  the size of the new LV in logical extents.  The number of physical extents allocated may be different, and depends on the
              LV type.  Certain LV types require more physical extents for data redundancy or metadata.  An alternate syntax allows the size to be
              determined  indirectly as a percentage of the size of a related VG, LV, or set of PVs.  The suffix %VG denotes the total size of the
              VG, the suffix %FREE the remaining free space in the VG, and the suffix %PVS the free space in the specified Physical Volumes.   For
              a  snapshot,  the  size  can  be  expressed  as  a percentage of the total size of the Origin Logical Volume with the suffix %ORIGIN
              (100%ORIGIN provides space for the whole origin).  When expressed as a percentage, the size defines an upper limit for the number of
              logical  extents  in  the  new  LV. The precise number of logical extents in the new LV is not determined until the command has com‐
              pleted.

       -j|--major Major
              Sets the major number.  Major numbers are not supported with pool volumes.  This option is supported only on older  systems  (kernel
              version 2.4) and is ignored on modern Linux systems where major numbers are dynamically assigned.

       --metadataprofile ProfileName
              Uses  and  attaches  the  ProfileName configuration profile to the logical volume metadata. Whenever the logical volume is processed
              next time, the profile is automatically applied. If the volume group has another profile attached, the  logical  volume  profile  is
              preferred.  See lvm.conf(5) for more information about metadata profiles.

       --minor Minor
              Sets the minor number.  Minor numbers are not supported with pool volumes.

       -m|--mirrors mirrors
              Creates  a  mirrored logical volume with mirrors copies.  For example, specifying -m 1 would result in a mirror with two-sides; that
              is, a linear volume plus one copy.

              Specifying the optional argument --nosync will cause the creation of the mirror LV to skip the initial resynchronization.  Any  data
              written afterwards will be mirrored, but the original contents will not be copied.

              This is useful for skipping a potentially long and resource intensive initial sync of an empty mirrored RaidLV.

              There  are two implementations of mirroring which can be used and correspond to the "raid1" and "mirror" segment types.  The default
              is "raid1".  See the --type option for more information if you would like to use the legacy "mirror" segment type.  See  lvm.conf(5)
              settings   global/mirror_segtype_default  and  global/raid10_segtype_default  to configure default mirror segment type.  The options
              --mirrorlog and --corelog apply to the legacy "mirror" segment type only.

              Note the current maxima for mirrors are 7 for "mirror" providing 8 mirror legs and 9 for "raid1" providing 10 legs.

       --mirrorlog {disk|core|mirrored}
              Specifies the type of log to be used for logical volumes utilizing the legacy "mirror" segment type.
              The default is disk, which is persistent and requires a small amount of storage space, usually on a separate device  from  the  data
              being mirrored.
              Using core means the mirror is regenerated by copying the data from the first device each time the logical volume is activated, like
              after every reboot.
              Using mirrored will create a persistent log that is itself mirrored.

       --monitor {y|n}
              Starts or avoids monitoring a mirrored, snapshot or thin pool logical volume with dmeventd, if it is installed.  If a device used by
              a  monitored  mirror  reports  an  I/O  error,  the failure is handled according to activation/mirror_image_fault_policy and activa‐
              tion/mirror_log_fault_policy set in lvm.conf(5).

       -n|--name LogicalVolume{Name|Path}
              Sets the name for the new logical volume.
              Without this option a default name of "lvol#" will be generated where # is the LVM internal number of the logical volume.

       --nosync
              Causes the creation of mirror, raid1, raid4, raid5 and raid10 to skip the initial resynchronization.  In case of mirror,  raid1  and
              raid10,  any data written afterwards will be mirrored, but the original contents will not be copied.  In case of raid4 and raid5, no
              parity blocks will be written, though any data written afterwards will cause parity blocks to be stored.
              This is useful for skipping a potentially long and resource intensive initial sync of an empty mirror/raid1/raid4/raid5  and  raid10
              LV.
              This  option is not valid for raid6, because raid6 relies on proper parity (P and Q Syndromes) being created during initial synchro‐
              nization in order to reconstruct proper user date in case of device failures.

              raid0 and raid0_meta don't provide any data copies or parity support and thus don't support initial resynchronization.

       --noudevsync
              Disables udev synchronisation. The process will not wait for notification from udev.  It will continue irrespective of any  possible
              udev  processing  in the background.  You should only use this if udev is not running or has rules that ignore the devices LVM2 cre‐
              ates.

       -p|--permission {r|rw}
              Sets access permissions to read only (r) or read and write (rw).
              Default is read and write.

       -M|--persistent {y|n}
              Set to y to make the minor number specified persistent.  Pool volumes cannot have persistent major and minor numbers.   Defaults  to
              yes only when major or minor number is specified.  Otherwise it is no.

       --poolmetadatasize MetadataVolumeSize[b|B|s|S|k|K|m|M|g|G]
              Sets the size of pool's metadata logical volume.  Supported values are in range between 2MiB and 16GiB for thin pool, and upto 16GiB
              for cache pool. The  minimum  value  is  computed  from  pool's  data  size.   Default  value  for  thin  pool  is  (Pool_LV_size  /
              Pool_LV_chunk_size  *  64b).   To  work  with  a  thin pool, there should be at least 25% of free space when the size of metadata is
              smaller then 16MiB, or at least 4MiB of free space otherwise.  Default unit is megabytes.

       --poolmetadataspare {y|n}
              Controls creation and maintanence of pool metadata spare logical volume that will be used for automated  pool  recovery.   Only  one
              such volume is maintained within a volume group with the size of the biggest pool metadata volume.  Default is yes.

       --[raid]maxrecoveryrate Rate[b|B|s|S|k|K|m|M|g|G]
              Sets  the  maximum recovery rate for a RAID logical volume.  Rate is specified as an amount per second for each device in the array.
              If no suffix is given, then KiB/sec/device is assumed.  Setting the recovery rate to 0 means it will be unbounded.

       --[raid]minrecoveryrate Rate[b|B|s|S|k|K|m|M|g|G]
              Sets the minimum recovery rate for a RAID logical volume.  Rate is specified as an amount per second for each device in  the  array.
              If no suffix is given, then KiB/sec/device is assumed.  Setting the recovery rate to 0 means it will be unbounded.

       -r|--readahead {ReadAheadSectors|auto|none}
              Sets read ahead sector count of this logical volume.  For volume groups with metadata in lvm1 format, this must be a value between 2
              and 120.  The default value is auto which allows the kernel to choose a suitable value automatically.  none is equivalent to  speci‐
              fying zero.

       -R|--regionsize MirrorLogRegionSize[b|B|s|S|k|K|m|M|g|G]
              A mirror is divided into regions of this size (in MiB), and the mirror log uses this granularity to track which regions are in sync.

       -k|--setactivationskip {y|n}
              Controls  whether  Logical  Volumes  are persistently flagged to be skipped during activation. By default, thin snapshot volumes are
              flagged for activation skip.  See lvm.conf(5) activation/auto_set_activation_skip how to change its default behaviour.  To  activate
              such  volumes,  an  extra  --ignoreactivationskip  option  must  be  used. The flag is not applied during deactivation. Use lvchange
              --setactivationskip command to change the skip flag for existing volumes.  To see whether the flag  is  attached,  use  lvs  command
              where the state of the flag is reported within lv_attr bits.

       -L|--size LogicalVolumeSize[b|B|s|S|k|K|m|M|g|G|t|T|p|P|e|E]
              Gives the size to allocate for the new logical volume.  A size suffix of B for bytes, S for sectors as 512 bytes, K for kilobytes, M
              for megabytes, G for gigabytes, T for terabytes, P for petabytes or E for exabytes is optional.
              Default unit is megabytes.

       -s|--snapshot OriginalLogicalVolume{Name|Path}
              Creates a snapshot logical volume (or snapshot) for an existing, so called original logical volume (or origin).  Snapshots provide a
              'frozen image' of the contents of the origin while the origin can still be updated. They enable consistent backups and online recov‐
              ery of removed/overwritten data/files.
              Thin snapshot is created when the origin is a thin volume and the size IS NOT specified. Thin snapshot shares same blocks within the
              thin  pool volume.  The non thin volume snapshot with the specified size does not need the same amount of storage the origin has. In
              a typical scenario, 15-20% might be enough. In case the snapshot runs out of storage, use lvextend(8) to grow it. Shrinking a  snap‐
              shot  is  supported  by lvreduce(8) as well. Run lvs(8) on the snapshot in order to check how much data is allocated to it.  Note: a
              small amount of the space you allocate to the snapshot is used to track the locations of the chunks of data, so you should  allocate
              slightly  more  space than you actually need and monitor (--monitor) the rate at which the snapshot data is growing so you can avoid
              running out of space.  If --thinpool is specified, thin volume is created that will use given original logical volume as an external
              origin  that serves unprovisioned blocks.  Only read-only volumes can be used as external origins.  To make the volume external ori‐
              gin, lvm expects the volume to be inactive.  External origin volume can be used/shared for many thin  volumes  even  from  different
              thin pools. See lvconvert(8) for online conversion to thin volumes with external origin.

       -i|--stripes Stripes
              Gives  the  number of stripes.  This is equal to the number of physical volumes to scatter the logical volume data.  When creating a
              RAID 4/5/6 logical volume, the extra devices which are necessary for parity are internally accounted for.   Specifying  -i  3  would
              cause  3  devices  for  striped  and RAID 0 logical volumes, 4 devices for RAID 4/5, 5 devices for RAID 6 and 6 devices for RAID 10.
              Alternatively, RAID 0 will stripe across 2 devices, RAID 4/5 across 3 PVs, RAID 6 across 5 PVs and RAID 10 across 4 PVs in the  vol‐
              ume  group  if  the  -i  argument  is  omitted.   In  order  to  stripe  across all PVs of the VG if the -i argument is omitted, set
              raid_stripe_all_devices=1 in the allocation section of lvm.conf (5) or add
              --config allocation/raid_stripe_all_devices=1
              to the command.

              Note the current maxima for stripes depend on the created RAID type.  For raid10, the maximum of stripes is 32, for raid0, it is 64,
              for raid4/5, it is 63 and for raid6 it is 62.

              See the --nosync option to optionally avoid initial syncrhonization of RaidLVs.

              Two  implementations  of  basic  striping are available in the kernel.  The original device-mapper implementation is the default and
              should normally be used.  The alternative implementation using MD, available since version 1.7 of the RAID device-mapper kernel tar‐
              get  (kernel  version  4.2)  is  provided  to  facilitate  the  development  of  new  RAID features.  It may be accessed with --type
              raid0[_meta], but is best avoided at present because of assorted restrictions on resizing and converting such devices.

       -I|--stripesize StripeSize
              Gives the number of kilobytes for the granularity of the stripes.
              StripeSize must be 2^n (n = 2 to 9) for metadata in LVM1 format.  For metadata in LVM2 format, the stripe size may be a larger power
              of 2 but must not exceed the physical extent size.

       -T|--thin
              Creates  thin  pool or thin logical volume or both.  Specifying the optional argument --size or --extents will cause the creation of
              the thin pool logical volume.  Specifying the optional argument --virtualsize will cause the creation of  the  thin  logical  volume
              from  given  thin pool volume.  Specifying both arguments will cause the creation of both thin pool and thin volume using this pool.
              See lvmthin(7) for more info about thin provisioning support.  Thin provisioning requires device mapper kernel  driver  from  kernel
              3.2 or greater.

       --thinpool ThinPoolLogicalVolume{Name|Path}
              Specifies the name of thin pool volume name. The other way to specify pool name is to append name to Volume group name argument.

       --type SegmentType
              Creates  a  logical  volume  with the specified segment type.  Supported types are: cache, cache-pool, error, linear, mirror, raid0,
              raid1, raid4, raid5_la, raid5_ls (= raid5), raid5_ra, raid5_rs, raid6_nc, raid6_nr, raid6_zr (= raid6), raid10,  snapshot,  striped,
              thin,  thin-pool  or zero.  Segment type may have a commandline switch alias that will enable its use.  When the type is not explic‐
              itly  specified  an  implicit  type  is  selected  from  combination  of  options:  -H|--cache|--cachepool  (cache  or   cachepool),
              -T|--thin|--thinpool  (thin  or  thinpool),  -m|--mirrors  (raid1  or  mirror),  -s|--snapshot|-V|--virtualsize  (snapshot or thin),
              -i|--stripes (striped).  The default segment type is linear.

       -V|--virtualsize VirtualSize[b|B|s|S|k|K|m|M|g|G|t|T|p|P|e|E]
              Creates a thinly provisioned device or a  sparse  device  of  the  given  size  (in  MiB  by  default).   See  lvm.conf(5)  settings
              global/sparse_segtype_default  to  configure default sparse segment type.  See lvmthin(7) for more info about thin provisioning sup‐
              port.  Anything written to a sparse snapshot will be returned when reading from it.  Reading from other areas  of  the  device  will
              return blocks of zeros.  Virtual snapshot (sparse snapshot) is implemented by creating a hidden virtual device of the requested size
              using the zero target.  A suffix of _vorigin is used for this device.  Note: using sparse snapshots  is  not  efficient  for  larger
              device sizes (GiB), thin provisioning should be used for this case.

       -W|--wipesignatures {y|n}
              Controls detection and subsequent wiping of signatures on newly created Logical Volume. There's a prompt for each signature detected
              to confirm its wiping (unless --yes is used where LVM assumes 'yes' answer for each prompt automatically). If  this  option  is  not
              specified,  then by default -W | --wipesignatures y is assumed each time the zeroing is done (-Z | --zero y). This default behaviour
              can be controlled by allocation/wipe_signatures_when_zeroing_new_lvs setting found in lvm.conf(5).
              If blkid wiping is used (allocation/use_blkid_wiping setting in lvm.conf(5)) and LVM2 is compiled with blkid  wiping  support,  then
              blkid(8)  library  is  used  to detect the signatures (use blkid -k command to list the signatures that are recognized).  Otherwise,
              native LVM2 code is used to detect signatures (MD RAID, swap and LUKS signatures are detected only in this case).
              Logical volume is not wiped if the read only flag is set.

       -Z|--zero {y|n}
              Controls zeroing of the first 4KiB of data in the new logical volume.  Default is yes.  Snapshot  COW  volumes  are  always  zeroed.
              Logical volume is not zeroed if the read only flag is set.
              Warning: trying to mount an unzeroed logical volume can cause the system to hang.

Examples
       Creates  a  striped  logical volume with 3 stripes, a stripe size of 8KiB and a size of 100MiB in the volume group named vg00.  The logical
       volume name will be chosen by lvcreate:

       lvcreate -i 3 -I 8 -L 100M vg00

       Creates a mirror logical volume with 2 sides with a useable size of 500 MiB.  This operation would require 3  devices  (or  option  --alloc
       anywhere) - two for the mirror devices and one for the disk log:

       lvcreate -m1 -L 500M vg00

       Creates  a mirror logical volume with 2 sides with a useable size of 500 MiB.  This operation would require 2 devices - the log is "in-mem‐
       ory":

       lvcreate -m1 --mirrorlog core -L 500M vg00

       Creates a snapshot logical volume named "vg00/snap" which has access to the contents of the original logical volume named  "vg00/lvol1"  at
       snapshot  logical volume creation time. If the original logical volume contains a file system, you can mount the snapshot logical volume on
       an arbitrary directory in order to access the contents of the filesystem to run a backup while the original  filesystem  continues  to  get
       updated:

       lvcreate --size 100m --snapshot --name snap /dev/vg00/lvol1

       Creates a snapshot logical volume named "vg00/snap" with size for overwriting 20% of the original logical volume named "vg00/lvol1".:

       lvcreate -s -l 20%ORIGIN --name snap vg00/lvol1

       Creates a sparse device named /dev/vg1/sparse of size 1TiB with space for just under 100MiB of actual data on it:

       lvcreate --virtualsize 1T --size 100M --snapshot --name sparse vg1

       Creates a linear logical volume "vg00/lvol1" using physical extents /dev/sda:0-7 and /dev/sdb:0-7 for allocation of extents:

       lvcreate -L 64M -n lvol1 vg00 /dev/sda:0-7 /dev/sdb:0-7

       Creates a 5GiB RAID5 logical volume "vg00/my_lv", with 3 stripes (plus a parity drive for a total of 4 devices) and a stripesize of 64KiB:

       lvcreate --type raid5 -L 5G -i 3 -I 64 -n my_lv vg00

       Creates  a  RAID5 logical volume "vg00/my_lv", using all of the free space in the VG and spanning all the PVs in the VG (note that the com‐
       mand will fail if there's more than 8 PVs in the VG in which case -i 7 has to be used to get to the currently possible maximum of 8 devices
       including parity for RaidLVs):

       lvcreate --config allocation/raid_stripe_all_devices=1 --type raid5 -l 100%FREE -n my_lv vg00

       Creates  a  5GiB  RAID10  logical volume "vg00/my_lv", with 2 stripes on 2 2-way mirrors.  Note that the -i and -m arguments behave differ‐
       ently.  The -i specifies the number of stripes.  The -m specifies the number of additional copies:

       lvcreate --type raid10 -L 5G -i 2 -m 1 -n my_lv vg00

       Creates 100MiB pool logical volume for thin provisioning build with 2 stripes 64KiB and chunk size 256KiB together with  1TiB  thin  provi‐
       sioned logical volume "vg00/thin_lv":

       lvcreate -i 2 -I 64 -c 256 -L100M -T vg00/pool -V 1T --name thin_lv

       Creates  a  thin  snapshot volume "thinsnap" of thin volume "thinvol" that will share the same blocks within the thin pool.  Note: the size
       MUST NOT be specified, otherwise the non-thin snapshot is created instead:

       lvcreate -s vg00/thinvol --name thinsnap

       Creates a thin snapshot volume of read-only inactive volume "origin" which then becomes the thin external origin for the thin snapshot vol‐
       ume in vg00 that will use an existing thin pool "vg00/pool":

       lvcreate -s --thinpool vg00/pool origin

       Create a cache pool LV that can later be used to cache one logical volume.

       lvcreate --type cache-pool -L 1G -n my_lv_cachepool vg /dev/fast1

       If  there is an existing cache pool LV, create the large slow device (i.e. the origin LV) and link it to the supplied cache pool LV, creat‐
       ing a cache LV.

       lvcreate --cache -L 100G -n my_lv vg/my_lv_cachepool /dev/slow1

       If there is an existing logical volume, create the small and fast cache pool LV and link it to the supplied existing logical  volume  (i.e.
       the origin LV), creating a cache LV.

       lvcreate --type cache -L 1G -n my_lv_cachepool vg/my_lv /dev/fast1

SEE ALSO
       lvm(8),  lvm.conf(5),  lvmcache(7),  lvmthin(7),  lvconvert(8),  lvchange(8),  lvextend(8),  lvreduce(8),  lvremove(8), lvrename(8) lvs(8),
       lvscan(8), vgcreate(8), blkid(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             LVCREATE(8)
