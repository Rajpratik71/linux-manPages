LVCONVERT(8)                                                  System Manager's Manual                                                 LVCONVERT(8)

NAME
       lvconvert — change LV type and other utilities

SYNOPSIS
       lvconvert [OPTION]...  VolumeGroup/LogicalVolume

       OPTIONS:
       -b, --background
       --cachepolicy Policy
       --cachepool CachePoolLogicalVolume{Name|Path}
       --cachesettings Key=Value
       -c, --chunksize ChunkSize[b|B|s|S|k|K|m|M|g|G]
       --corelog
       --discards {ignore|nopassdown|passdown}
       -i, --interval Seconds
       --merge
       --mirrorlog {disk|core|mirrored}
       -m, --mirrors Number
       -n, --name Name
       --noudevsync
       --originname NewExternalOriginVolumeName
       --poolmetadata PoolMetadataLogicalVolume{Name|Path}
       --poolmetadatasize PoolMetadataSize[b|B|s|S|k|K|m|M|g|G]
       --poolmetadataspare {y|n}
       -r, --readahead {ReadAheadSectors|auto|none}
       -R, --regionsize MirrorLogRegionSize
       --repair
       --replace PhysicalVolume
       --splitcache
       --splitmirrors Number
       --splitsnapshot
       --stripes Number
       -I, --stripesize StripeSize
       --type striped
       --type snapshot | --snapshot | -s
       --type mirror
       --type raid*
       --type thin | --thin | -T
       --type cache | --cache | -H
       --type thin-pool
       --type cache-pool
       --thinpool ThinPoolLogicalVolume{Name|Path}
       --trackchanges
       --uncache
       -Z, --zero {y|n}

       Common options:
       -A, --alloc AllocationPolicy
       -f, --force
       --commandprofile ProfileName
       -h, -?, --help
       -v, --verbose
       -y, --yes
       --version

DESCRIPTION
       lvconvert changes the LV type and includes various LV utilities.

       To display the current LV type, run the command:

       lvs -o name,segtype VG/LV

       To change the LV type, run the command:

       lvconvert --type NewType VG/LV

   LV types
       The LV type is also called the "segment type" or "segtype".

       LVs with the following types can be modified by lvconvert: striped, snapshot, mirror, raid*, thin, cache, thin-pool, cache-pool.

       The specific operations available on each LV type are listed below.

       The linear type is equivalent to the striped type when one stripe exists.  In that case, the types can sometimes be used interchangably.

       In most cases, the mirror type is deprecated and the raid1 type should be used.  They are both implementations of mirroring.

       The raid* type refers to one of many raid levels, e.g.  raid1, raid5.

   LV layers
       In  some  cases,  an  LV  is a single device mapper (dm) layer above physical devices.  In other cases, hidden LVs (dm devices) are layered
       between the visible LV and physical devices.  LVs in the middle layers are sometimes called sub LVs.

       Changing the LV type will often change the composition of sub LVs.

       Sub LVs can be displayed with the command lvs -a.

       A command run on a visible LV sometimes operates on a sub LV rather than the specified LV.  These cases are noted below.

       Sometimes a sub LV must be specified directly on the command line, but this is a non-standard form.  These cases may change in  the  future
       to avoid the direct use of hidden LVs.

COMMANDS
   Operations on a StripedLV with type striped or linear:

       lvconvert --merge VG/StripedLV
       · Merge StripedLV into an LV when it is a previously split mirror.
       · Options --background, --interval.
       · See corresponding operation --splitmirrors.

       lvconvert --type snapshot VG/StripedLV VG/SnapshotLV
       · Recombine StripedLV with SnapshotLV which was previously split.
       · Options --chunksize, --zero.
       · See corresponding operation --splitsnapshot.

       lvconvert --type thin VG/StripedLV
       · Convert StripedLV to type thin with an external origin.
       · StripedLV becomes a read-only external origin LV with a new name.
       · Requires --thinpool to specify the thin pool to use.
       · Options --originname.

       lvconvert --type cache VG/StripedLV
       · Convert StripedLV to type cache.
       · Requires --cachepool to specify the cache pool to use.
       · Options --cachepolicy, --cachesettings.

       lvconvert --type thin-pool VG/StripedLV
       · Convert StripedLV to type thin-pool.
       · The StripedLV is used for thin pool data.
       · Options --chunksize, --discards, --poolmetadata{size,spare},
         --readahead, --zero.

       lvconvert --type cache-pool VG/StripedLV
       · Convert StripedLV to type cache-pool.
       · Options --chunksize, --poolmetadata{size,spare}.

       lvconvert --type mirror VG/StripedLV
       · Convert StripedLV to type mirror.
       · Requires --mirrors to specify the number of mirrors to use.
       · Options --mirrorlog, --regionsize.

       lvconvert --type raid* VG/StripedLV
       · Convert StripedLV to type raid*.
       · Required options depend on the raid level.

   Operations on RaidLV with type raid*:

       lvconvert --mirrors Number VG/RaidLV
       · Change the number of images in raid1 RaidLV.

       lvconvert --splitmirrors Number VG/RaidLV
       · Split images from raid1 RaidLV and use them to create a new LV.
       · Requires --name for the new LV, or the use of --trackchanges.

       lvconvert --merge VG/RaidLV
       · Merge RaidLV into an LV when it is a previously split mirror.
       · Options --background, --interval.
       · See corresponding operation --splitmirrors.

       lvconvert --repair VG/RaidLV
       · Options --background, --interval.
       · Replace failed PVs in RaidLV.

       lvconvert --replace PV VG/RaidLV
       · Replace specific PV(s) in a raid* LV with another PV.
       · The new PV(s) to use can be optionally specified after the LV.
       · Repeat to replace multiple: --replace PV1 --replace PV2 ...

       lvconvert --type snapshot VG/RaidLV VG/SnapshotLV
       · Combine RaidLV with SnapshotLV that was previously split.
       · Options --chunksize, --zero.
       · See corresponding operation --splitsnapshot.

       lvconvert --type thin VG/RaidLV
       · Convert RaidLV to type thin with an external origin.
       · RaidLV becomes a read-only external origin LV with a new name.
       · Requires --thinpool to specify the thin pool to use.
       · Options --originname.

       lvconvert --type cache VG/RaidLV
       · Convert RaidLV to type cache.
       · Requires --cachepool to specify the cache pool to use.
       · Options --cachepolicy, --cachesettings.

       lvconvert --type thin-pool VG/RaidLV
       · Convert RaidLV to type thin-pool.
       · The RaidLV is used for thin pool data.
       · Options --chunksize, --discards, --poolmetadata{size,spare},
         --readahead, --zero.

       lvconvert --type cache-pool VG/RaidLV
       · Convert RaidLV to type cache-pool.
       · Options --chunksize, --poolmetadata{size,spare}.

       lvconvert --type raid* VG/RaidLV
       · Convert RaidLV to use a different raid level.
       · Required options depend on the raid level.

       lvconvert --type mirror VG/RaidLV
       · Convert RaidLV to type mirror.

       lvconvert --type striped VG/RaidLV
       · Convert RaidLV to type striped.

       lvconvert --type linear VG/RaidLV
       · Convert RaidLV to type linear.

   Operations on MirrorLV with type mirror:

       lvconvert --mirrors Number VG/MirrorLV
       · Change the number of images in MirrorLV.

       lvconvert --splitmirrors Number VG/MirrorLV
       · Split images from MirrorLV and use them to create a new LV.
       · Requires --name for the new LV.

       lvconvert --mirrorlog LogType VG/MirrorLV
       · Change the type of log used by MirrorLV.

       lvconvert --repair VG/MirrorLV
       · Options --background, --interval.
       · Replace failed PVs in MirrorLV.

       lvconvert --type linear VG/MirrorLV
       · Convert MirrorLV to type linear.

       lvconvert --type raid* VG/MirrorLV
       · Convert MirrorLV to type raid*.
       · Required options depend on the raid level.

   Operations on CachePoolLV with type cache-pool:

       lvconvert --splitcache VG/CachePoolLV
       · Split the cache LV from CachePoolLV.
       · Equivalent to --splitcache on CacheLV.

   Operations on CacheLV with type cache:

       lvconvert --splitcache VG/CacheLV
       · Split and keep the cache pool from CacheLV.

       lvconvert --uncache VG/CacheLV
       · Split and remove the cache pool from CacheLV.

       lvconvert --splitmirrors Number VG/CacheLV
       · Split images from the mirrored origin of CacheLV to create a new LV.
       · Operates on mirror or raid1 sub LV.
       · Requires --name for the new LV, or the use of --trackchanges.

       lvconvert --type thin-pool VG/CacheLV
       · Convert CacheLV to type thin-pool.
       · The CacheLV is used for thin pool data.
       · Options --chunksize, --discards, --poolmetadata{size,spare},
         --readahead, --zero.

   Operations on ThinPoolLV with type thin-pool:

       lvconvert --splitcache VG/ThinPoolLV
       · Split and keep the cache pool from the data portion of ThinPoolLV.
       · Operates on the data sub LV of the thin pool LV.
       · The data sub LV of the thin pool must be a cache LV.

       lvconvert --uncache VG/ThinPoolLV
       · Split and remove the cache pool from the data portion of ThinPoolLV.
       · Operates on the data sub LV of the thin pool LV.
       · The data sub LV of the thin pool must be a cache LV.

       lvconvert --type cache VG/ThinPoolLV
       · Convert the data portion of ThinPoolLV to type cache.
       · Requires --cachepool to specify the cache pool to use.
       · Operates on the data sub LV of the thin pool LV.
       · Options --cachepolicy, --cachesettings.

       lvconvert --repair VG/ThinPoolLV
       · Repair ThinPoolLV.

   Operations on ThinLV with type thin:

       lvconvert --merge VG/ThinLV
       · Merge ThinLV into its origin LV.
       · ThinLV must have been created as a snapshot of another thin LV.
       · Options --background, --interval.

   Operations on SnapshotLV with type snapshot:

       lvconvert --splitsnapshot VG/SnapshotLV
       · Separate COW snapshot SnapshotLV from its origin LV.

       lvconvert --merge VG/SnapshotLV
       · Merge COW snapshot SnapshotLV into its origin.
       · Options --background, --interval.

OPTIONS
       See lvm(8) for common options.

       -b, --background
              If the operation requires polling, this option causes the command to return before the operation is complete, and polling is done in
              the background.

       --cachepolicy Policy
              Specifies the cache policy for a cache LV.  Also see lvmcache(7).

       --cachepool CachePoolLogicalVolume{Name|Path}
              Specifies the cache pool to use when converting an LV to a cache LV.  If CachePoolLogicalVolume is not yet a cache pool, the command
              will attempt to convert it into a cache pool prior to the cache LV conversion.  Also see lvmcache(7).

       --cachesettings Key=Value
              Specifies  tunable  values  for  a  cache  LV.   (The  default values should usually be adequate.)  The special string value default
              switches settings back to their default kernel values and removes them from the list of settings stored in LVM metadata.   Also  see
              lvmcache(7).

       -c, --chunksize ChunkSize[b|B|s|S|k|K|m|M|g|G]
              Sets the chunk size for a snapshot, cache pool or thin pool.  The default unit is in kilobytes.

              For snapshots, the value must be a power of 2 between 4KiB and 512KiB and the default value is 4.

              For a cache pool the value must be between 32KiB and 1GiB and the default value is 64.

              For a thin pool the value must be between 64KiB and 1GiB and the default value starts with 64 and scales up to fit the pool metadata
              size within 128MiB, if the pool metadata size is not specified.  The value must be a multiple of 64KiB.  (Early kernel support until
              thin  target  version  1.4  required the value to be a power of 2.  Discards were not supported for non-power of 2 values until thin
              target version 1.5.)

       --corelog
              Specifies or changes the log type for a mirror LV.  It is an alias for --mirrorlog core.  (This option does not apply to  the  raid1
              LV type.)

       --discards {ignore|nopassdown|passdown}
              Specifies  if  discards will be processed by the thin layer in the kernel and passed down to the Physical Volume.  This applies only
              to thin pools.  The default is passdown.  Also see lvmthin(7).

       -H, --cache
              Alias for --type cache.  See COMMANDS description for
              lvconvert --type cache.

       -i, --interval Seconds
              Report progress as a percentage at regular intervals.

       --merge
              Merges a snapshot that was split from an origin LV using --splitsnapshot, back into the origin LV.

              Merges a raid1 image that was split from a raid1 LV using --splitsnapshot and --trackchanges, back into the original raid1 LV.

              To check if the kernel supports the snapshot merge feature, look for "snapshot-merge" in the output of dmsetup targets.

              When merging a snapshot, if both the origin and snapshot LVs are not open, the merge will start immediately.  Otherwise,  the  merge
              will  start  the  first  time either the origin or snapshot LV are activated and both are closed.  Merging a snapshot into an origin
              that cannot be closed, for example a root filesystem, is deferred until the next time the origin volume is activated.  When  merging
              starts, the resulting LV will have the origin's name, minor number and UUID.  While the merge is in progress, reads or writes to the
              origin appear as being directed to the snapshot being merged.  When the merge finishes, the merged snapshot  is  removed.   Multiple
              snapshots  may  be  specified  on the command line or a @tag may be used to specify multiple snapshots be merged to their respective
              origin.

       --mirrorlog {disk|core|mirrored}
              Specifies or changes the log type for a mirror LV.  The default is disk, which is persistent and requires a small amount of  storage
              space,  usually on a separate device from the data being mirrored.  Core may be useful for short-lived mirrors.  It means the mirror
              is regenerated by copying the data from the first device again every time the device  is  activated  -  e.g.  possibly  after  every
              reboot.  Using mirrored will create a persistent log that is itself mirrored.  (This option does not apply to the raid1 LV type.)

       -m, --mirrors Number
              Specifies the number mirror images in addition to the original LV image, e.g. --mirrors 1 means two copies of the data, the original
              and one mirror image.

              The current maximum is 9 providing 10 raid1 images.

              This option is required when converting an LV to a raid1 or mirror LV.

              This option can be used alone to change the number of mirror images in an existing raid1 or mirror LV.

              The special case --mirrors 0 has been used historically to indicate a linear LV with no mirror images.

       -n, --name Name
              Specifies the name to use when the command is creating a new LV, e.g.  --splitmirrors.

       --noudevsync
              Disables udev synchronisation. The process will not wait for notification from udev.  It will continue irrespective of any  possible
              udev  processing  in  the background.  You should only use this if udev is not running or has rules that ignore the devices LVM cre‐
              ates.

       --originname NewExternalOriginVolumeName
              Specifies the name to use for the external origin LV when converting an LV to a thin LV.  The LV being converted becomes a read-only
              external origin with this name.
              Without this option, the default name of "lvol<n>" will be generated where <n> is the LVM internal number of the LV.

       --poolmetadata PoolMetadataLogicalVolume{Name|Path}
              Specifies the LV to use for thin pool metadata when converting an LV to a thin pool LV.
              Specifies the LV to use for cache pool metadata when converting an LV to a cache pool LV.
              The size should be between 2MiB and 16GiB.
              (This  option  can  also  be  used when a thin pool or cache pool are created as an auxiliary operation within a different command.)
              Also see lvmthin(7), and lvmcache(7).

       --poolmetadatasize PoolMetadataSize[b|B|s|S|k|K|m|M|g|G]
              Specifies the size of a cache pool metadata LV or a thin pool metadata LV.  This is used if a command creates  a  pool  metadata  LV
              automatically  as  part  of  the  operation.  This option is not used when an existing LV is specified as the pool metadata LV, i.e.
              --poolmetadata.  The default unit is megabytes.  Also see lvmthin(7), and lvmcache(7).

       --poolmetadataspare {y|n}
              Specifies if a spare pool metadata LV should be created.  A spare pool metadata LV will be used for pool  repair.   Only  one  spare
              pool metadata LV is maintained within a VG, with the size of the largest existing pool metadata LV.  The default is yes.

       -r, --readahead {ReadAheadSectors|auto|none}
              Specifies  the  read  ahead  sector count of a thin pool metadata LV.  The default value is auto which allows the kernel to choose a
              suitable value automatically.  None is equivalent to specifying zero.

       -R, --regionsize MirrorLogRegionSize
              A mirror LV is divided into regions of this size (in MB), and the mirror log uses this granularity to track  which  regions  are  in
              sync.  (This option does not apply to the raid1 LV type.)

       --repair
              Replaces  failed  PVs  in a raid1 or mirror LV with other PVs available in the VG.  By default, the original number of mirror images
              will be restored if possible.  Specify -y on the command line to skip the prompts.  Use -f if you do not want any replacement.   You
              may  use  --use-policies  to  use  the device replacement policy specified in lvm.conf(5), see activation/mirror_log_fault_policy or
              activation/mirror_device_fault_policy.

              When used with a thin pool LV, this option automates the use of the thin_repair(8) tool on the  thin  pool.   This  repairs  a  very
              limitted  number of problems.  Only inactive thin pools can be repaired.  There is no validation of metadata between kernel and LVM.
              This requires further manual work.  After successfull repair the old unmodified metadata are still available in "<pool>_meta<n>" LV.
              Also see lvmthin(7).

       --replace PhysicalVolume
              Remove the specified device PhysicalVolume and replace it with one that is available in the VG, or from a specific list of PVs spec‐
              ified on the command line following the LV name. This option may be repeated multiple times depending on the RaidLV type.

       -s, --snapshot
              Alias for --type snapshot.  See COMMANDS description for
              lvconvert --type snapshot.

       --split
              Separates SplitableLogicalVolume.  This option tries to detect the necessary split operation from its arguments.  Avoid  using  this
              option and use one of the following instead: --splitcache, --splitmirrors, --splitsnapshot.

       --splitcache
              Separates a cache pool from a cache LV, and keeps the unused cache pool LV.  Before the separation, the cache is flushed.  See simi‐
              lar option --uncache.  Also see lvmcache(7).

       --splitmirrors Number
              Splits the specified number of images from a raid1 or mirror LV and uses them to create a new LV.

              If --trackchanges is also specified, changes to the raid1 LV are tracked while the split LV remains detached.  lvconvert --merge can
              be used to recombine the split images with the original raid1 LV.

              A name can be specified for the new LV with --name (a name is required without --trackchanges).

       --splitsnapshot
              Separates a COW snapshot from its origin LV.  The LV that is split off contains the chunks that differ from the origin LV along with
              metadata describing them.  This LV can be wiped and then destroyed with lvremove.   See  corresponding  operation  lvconvert  --type
              snapshot.

       --stripes Number
              Specifies  the  number  of  stripes  in  a striped LV.  This is the number of physical volumes (devices) that a striped LV is spread
              across.  Data that appears sequential in the LV is spread across multiple devices in units of the stripe  size  (see  --stripesize).
              This does not apply to existing allocated space, only newly allocated space can be striped.

       -I, --stripesize StripeSize
              Specifies the stripe size in kilobytes for a striped LV.  The stripe size is the number of kilobytes written to each stripe, i.e. to
              one device, before writing to the next stripe/device.  StripeSize must be a power of 2 and cannot exceed the VG physical extent (PE)
              size.

       --type SegmentType
              Converts an LV from one segment type to another.  See COMMANDS section for a description of converting between each type.

       --thinpool ThinPoolLogicalVolume{Name|Path}
              Specifies  the  thin  pool  to use when converting an LV to a thin LV.  If ThinPoolLogicalVolume is not yet a thin pool, the command
              will attempt to convert it to a thin pool prior to the thin LV conversion.  Also see lvmthin(7).

       --trackchanges
              Can be used with --splitmirrors on a raid1 LV.  This causes changes to the original raid1 LV to be tracked while  the  split  images
              remain  detached.   This  allows  the  read-only  detached image(s) to be merged efficiently back into the raid1 LV later.  Only the
              regions with changed data are resynchronized during merge.  (This option only applies to the raid1 LV type.)

       -T, --thin
              Alias for --type thin.  See COMMANDS description for
              lvconvert --type thin.

       --uncache
              Separates a cache pool from a cache LV, and removes the unused cache pool LV.  Before the separation, the  cache  is  flushed.   See
              similar option --splitcache.  Also see lvmcache(7).

       -Z, --zero {y|n}
              For  snapshots,  this  controls zeroing of the first 4KiB of data in the snapshot.  If the LV is read-only, the snapshot will not be
              zeroed.

              For thin pools, this controls zeroing of provisioned blocks.  Provisioning of large zeroed chunks  negatively  impacts  performance.
              Also see lvmthin(7).

Examples
       Convert a linear LV to a two-way mirror LV:
       lvconvert --type mirror --mirrors 1 vg/lvol1

       Convert a linear LV to a two-way RAID1 LV:
       lvconvert --type raid1 --mirrors 1 vg/lvol1

       Convert a mirror LV to use an in-memory log:
       lvconvert --mirrorlog core vg/lvol1

       Convert a mirror LV to use a disk log:
       lvconvert --mirrorlog disk vg/lvol1

       Convert a mirror or raid1 LV to a linear LV:
       lvconvert --type linear vg/lvol1

       Convert a mirror LV to a raid1 LV with the same number of images:
       lvconvert --type raid1 vg/lvol1

       Convert a linear LV to a two-way mirror LV, allocating new extents from specific PV ranges:
       lvconvert --mirrors 1 vg/lvol1 /dev/sda:0-15 /dev/sdb:0-15

       Convert a mirror LV to a linear LV, freeing physical extents from a specific PV:
       lvconvert --type linear vg/lvol1 /dev/sda

       Split one image from a mirror or raid1 LV, making it a new LV:
       lvconvert --splitmirrors 1 --name lv_split vg/lvol1

       Split one image from a raid1 LV, and track changes made to the raid1 LV while the split image remains detached:
       lvconvert --splitmirrors 1 --trackchanges vg/lvol1

       Merge an image (that was previously created with --splitmirrors and --trackchanges) back into the original raid1 LV:
       lvconvert --merge vg/lvol1_rimage_1

       Replace PV /dev/sdb1 with PV /dev/sdf1 in a raid1/4/5/6/10 LV:
       lvconvert --replace /dev/sdb1 vg/lvol1 /dev/sdf1

       Replace 3 PVs /dev/sd[b-d]1 with PVs /dev/sd[f-h]1 in a raid1 LV:
       lvconvert --replace /dev/sdb1 --replace /dev/sdc1 --replace /dev/sdd1
              vg/lvol1 /dev/sd[fgh]1

       Replace the maximum of 2 PVs /dev/sd[bc]1 with PVs /dev/sd[gh]1 in a raid6 LV:
       lvconvert --replace /dev/sdb1 --replace /dev/sdc1 vg/lvol1 /dev/sd[gh]1

       Convert an LV into a thin LV in the specified thin pool.  The existing LV is used as an external read-only origin for the new thin LV.
       lvconvert --type thin --thinpool vg/tpool1 vg/lvol1

       Convert  an LV into a thin LV in the specified thin pool.  The existing LV is used as an external read-only origin for the new thin LV, and
       is renamed "external":
       lvconvert --type thin --thinpool vg/tpool1
              --originname external vg/lvol1

       Convert an LV to a cache pool LV using another specified LV for cache pool metadata:
       lvconvert --type cache-pool --poolmetadata vg/poolmeta1 vg/lvol1

       Convert an LV to a cache LV using the specified cache pool and chunk size:
       lvconvert --type cache --cachepool vg/cpool1 -c 128 vg/lvol1

       Detach and keep the cache pool from a cache LV:
       lvconvert --splitcache vg/lvol1

       Detach and remove the cache pool from a cache LV:
       lvconvert --uncache vg/lvol1

SEE ALSO
       lvm(8), lvm.conf(5), lvmcache(7), lvmthin(7), lvdisplay(8), lvextend(8), lvreduce(8),  lvremove(8),  lvrename(8),  lvscan(8),  vgcreate(8),
       cache_dump(8), cache_repair(8), cache_restore(8), thin_dump(8), thin_repair(8), thin_restore(8)

Red Hat, Inc                                            LVM TOOLS 2.02.168(2) (2016-11-30)                                            LVCONVERT(8)
