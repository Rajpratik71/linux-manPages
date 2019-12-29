LVCREATE(8)                             System Manager's Manual                            LVCREATE(8)

NAME
       lvcreate - Create a logical volume

SYNOPSIS
       lvcreate option_args position_args
           [ option_args ]
           [ position_args ]

        -a|--activate y|n|ay
           --addtag Tag
           --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit
        -A|--autobackup y|n
        -H|--cache
           --cachemetadataformat auto|1|2
           --cachemode writethrough|writeback|passthrough
           --cachepolicy String
           --cachepool LV
           --cachesettings String
        -c|--chunksize Size[k|UNIT]
           --commandprofile String
           --compression y|n
           --config String
        -C|--contiguous y|n
        -d|--debug
           --deduplication y|n
           --discards passdown|nopassdown|ignore
           --driverloaded y|n
           --errorwhenfull y|n
        -l|--extents Number[PERCENT]
        -h|--help
        -K|--ignoreactivationskip
           --ignoremonitoring
           --lockopt String
           --longhelp
        -j|--major Number
           --[raid]maxrecoveryrate Size[k|UNIT]
           --metadataprofile String
           --minor Number
           --[raid]minrecoveryrate Size[k|UNIT]
           --mirrorlog core|disk
        -m|--mirrors Number
           --monitor y|n
        -n|--name String
           --nolocking
           --nosync
           --noudevsync
        -p|--permission rw|r
        -M|--persistent y|n
           --poolmetadatasize Size[m|UNIT]
           --poolmetadataspare y|n
           --profile String
        -q|--quiet
        -r|--readahead auto|none|Number
        -R|--regionsize Size[m|UNIT]
           --reportformat basic|json
        -k|--setactivationskip y|n
        -L|--size Size[m|UNIT]
        -s|--snapshot
        -i|--stripes Number
        -I|--stripesize Size[k|UNIT]
        -t|--test
        -T|--thin
           --thinpool LV
           --type linear|striped|snapshot|mirror|raid|thin|cache|thin-pool|cache-pool
           --vdo
           --vdopool LV
        -v|--verbose
           --version
        -V|--virtualsize Size[m|UNIT]
        -W|--wipesignatures y|n
        -y|--yes
        -Z|--zero y|n

DESCRIPTION
       lvcreate  creates  a new LV in a VG. For standard LVs, this requires allocating logical extents
       from the VG's free physical extents. If there is not enough free space, the VG can be  extended
       with  other  PVs  (vgextend(8)),  or existing LVs can be reduced or removed (lvremove(8), lvre‐
       duce(8).)

       To control which PVs a new LV will use, specify one or more PVs as position args at the end  of
       the command line. lvcreate will allocate physical extents only from the specified PVs.

       lvcreate can also create snapshots of existing LVs, e.g. for backup purposes. The data in a new
       snapshot LV represents the content of the original LV from the time the snapshot was created.

       RAID LVs can be created by specifying an LV type when creating the LV (see lvmraid(7)). Differ‐
       ent RAID levels require different numbers of unique PVs be available in the VG for allocation.

       Thin pools (for thin provisioning) and cache pools (for caching) are represented by special LVs
       with types thin-pool and cache-pool (see lvmthin(7) and lvmcache(7)). The pool LVs are not  us‐
       able as standard block devices, but the LV names act as references to the pools.

       Thin  LVs  are  thinly provisioned from a thin pool, and are created with a virtual size rather
       than a physical size. A cache LV is the combination of a standard LV with a cache pool, used to
       cache active portions of the LV to improve performance.

   Usage notes
       In the usage section below, --size Size can be replaced with --extents Number. See descriptions
       in the options section.

       In the usage section below, --name is omitted from the required options, even though it is typ‐
       ically  used. When the name is not specified, a new LV name is generated with the "lvol" prefix
       and a unique numeric suffix.

USAGE
       Create an LV that returns VDO when used.

       lvcreate --type vdo -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -V|--virtualsize Size[m|UNIT] ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --vdo ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [    --compression y|n ]
           [    --deduplication y|n ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a linear LV.

       lvcreate -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --type linear ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a striped LV (infers --type striped).

       lvcreate -i|--stripes Number -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -I|--stripesize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a raid1 or mirror LV (infers --type raid1|mirror).

       lvcreate -m|--mirrors Number -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -R|--regionsize Size[m|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --mirrorlog core|disk ]
           [    --[raid]minrecoveryrate Size[k|UNIT] ]
           [    --[raid]maxrecoveryrate Size[k|UNIT] ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a raid LV (a specific raid level must be used, e.g. raid1).

       lvcreate --type raid -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -m|--mirrors Number ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [ -R|--regionsize Size[m|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --[raid]minrecoveryrate Size[k|UNIT] ]
           [    --[raid]maxrecoveryrate Size[k|UNIT] ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a raid10 LV.

       lvcreate -m|--mirrors Number -i|--stripes Number
             -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -I|--stripesize Size[k|UNIT] ]
           [ -R|--regionsize Size[m|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --[raid]minrecoveryrate Size[k|UNIT] ]
           [    --[raid]maxrecoveryrate Size[k|UNIT] ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a COW snapshot LV of an origin LV.

       lvcreate -s|--snapshot -L|--size Size[m|UNIT] LV
           [ -l|--extents Number[PERCENT] ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --type snapshot ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a thin pool.

       lvcreate --type thin-pool -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --thinpool LV_new ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a cache pool.

       lvcreate --type cache-pool -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -H|--cache ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --cachemode writethrough|writeback|passthrough ]
           [    --cachepolicy String ]
           [    --cachesettings String ]
           [    --cachemetadataformat auto|1|2 ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a thin LV in a thin pool (infers --type thin).

       lvcreate -V|--virtualsize Size[m|UNIT] --thinpool LV_thinpool VG
           [ -T|--thin ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --type thin ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
       -

       Create a thin LV that is a snapshot of an existing thin LV
       (infers --type thin).

       lvcreate -s|--snapshot LV_thin
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --type thin ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
       -

       Create a thin LV that is a snapshot of an external origin LV.

       lvcreate --type thin --thinpool LV_thinpool LV
           [ -T|--thin ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
       -

       Create a thin LV, first creating a thin pool for it,
       where the new thin pool is named by the --thinpool arg.

       lvcreate --type thin -V|--virtualsize Size[m|UNIT]
             -L|--size Size[m|UNIT] --thinpool LV_new
           [ -l|--extents Number[PERCENT] ]
           [ -T|--thin ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a cache LV, first creating a new origin LV,
       then combining it with the existing cache pool named
       by the --cachepool arg.

       lvcreate --type cache -L|--size Size[m|UNIT]
             --cachepool LV_cachepool VG
           [ -l|--extents Number[PERCENT] ]
           [ -H|--cache ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --cachemode writethrough|writeback|passthrough ]
           [    --cachepolicy String ]
           [    --cachesettings String ]
           [    --cachemetadataformat auto|1|2 ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Common options for command:

       Common options for lvm:
           [ -d|--debug ]
           [ -h|--help ]
           [ -q|--quiet ]
           [ -t|--test ]
           [ -v|--verbose ]
           [ -y|--yes ]
           [    --commandprofile String ]
           [    --config String ]
           [    --driverloaded y|n ]
           [    --lockopt String ]
           [    --longhelp ]
           [    --nolocking ]
           [    --profile String ]
           [    --version ]

OPTIONS
       -a|--activate y|n|ay
              Controls the active state of the new LV.  y makes the LV active, or available.  New LVs
              are made active by default.  n makes the LV inactive, or unavailable, only when possi‐
              ble.  In some cases, creating an LV requires it to be active.  For example, COW snap‐
              shots of an active origin LV can only be created in the active state (this does not ap‐
              ply to thin snapshots).  The --zero option normally requires the LV to be active.  If
              autoactivation ay is used, the LV is only activated if it matches an item in lvm.conf
              activation/auto_activation_volume_list.  ay implies --zero n and --wipesignatures n.
              See lvmlockd(8) for more information about activation options for shared VGs.

       --addtag Tag
              Adds a tag to a PV, VG or LV. This option can be repeated to add multiple tags at once.
              See lvm(8) for information about tags.

       --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit
              Determines the allocation policy when a command needs to allocate Physical Extents (PEs)
              from the VG. Each VG and LV has an allocation policy which can be changed with
              vgchange/lvchange, or overriden on the command line.  normal applies common sense rules
              such as not placing parallel stripes on the same PV.  inherit applies the VG policy to
              an LV.  contiguous requires new PEs be placed adjacent to existing PEs.  cling places
              new PEs on the same PV as existing PEs in the same stripe of the LV.  If there are suf‐
              ficient PEs for an allocation, but normal does not use them, anywhere will use them even
              if it reduces performance, e.g. by placing two stripes on the same PV.  Optional posi‐
              tional PV args on the command line can also be used to limit which PVs the command will
              use for allocation.  See lvm(8) for more information about allocation.

       -A|--autobackup y|n
              Specifies if metadata should be backed up automatically after a change.  Enabling this
              is strongly advised! See vgcfgbackup(8) for more information.

       -H|--cache
              Specifies the command is handling a cache LV or cache pool.  See --type cache and --type
              cache-pool.  See lvmcache(7) for more information about LVM caching.

       --cachemetadataformat auto|1|2
              Specifies the cache metadata format used by cache target.

       --cachemode writethrough|writeback|passthrough
              Specifies when writes to a cache LV should be considered complete.  writeback considers
              a write complete as soon as it is stored in the cache pool.  writethough considers a
              write complete only when it has been stored in both the cache pool and on the origin LV.
              While writethrough may be slower for writes, it is more resilient if something should
              happen to a device associated with the cache pool LV. With passthrough, all reads are
              served from the origin LV (all reads miss the cache) and all writes are forwarded to the
              origin LV; additionally, write hits cause cache block invalidates. See lvmcache(7) for
              more information.

       --cachepolicy String
              Specifies the cache policy for a cache LV.  See lvmcache(7) for more information.

       --cachepool LV
              The name of a cache pool LV.

       --cachesettings String
              Specifies tunable values for a cache LV in "Key = Value" form.  Repeat this option to
              specify multiple values.  (The default values should usually be adequate.)  The special
              string value default switches settings back to their default kernel values and removes
              them from the list of settings stored in LVM metadata.  See lvmcache(7) for more infor‐
              mation.

       -c|--chunksize Size[k|UNIT]
              The size of chunks in a snapshot, cache pool or thin pool.  For snapshots, the value
              must be a power of 2 between 4KiB and 512KiB and the default value is 4.  For a cache
              pool the value must be between 32KiB and 1GiB and the default value is 64.  For a thin
              pool the value must be between 64KiB and 1GiB and the default value starts with 64 and
              scales up to fit the pool metadata size within 128MiB, if the pool metadata size is not
              specified.  The value must be a multiple of 64KiB.  See lvmthin(7) and lvmcache(7) for
              more information.

       --commandprofile String
              The command profile to use for command configuration.  See lvm.conf(5) for more informa‐
              tion about profiles.

       --compression y|n
              Controls whether compression is enabled or disable for VDO volume.  See lvmvdo(7) for
              more information about VDO usage.

       --config String
              Config settings for the command. These override lvm.conf settings.  The String arg uses
              the same format as lvm.conf, or may use section/field syntax.  See lvm.conf(5) for more
              information about config.

       -C|--contiguous y|n
              Sets or resets the contiguous allocation policy for LVs.  Default is no contiguous allo‐
              cation based on a next free principle.  It is only possible to change a non-contiguous
              allocation policy to contiguous if all of the allocated physical extents in the LV are
              already contiguous.

       -d|--debug ...
              Set debug level. Repeat from 1 to 6 times to increase the detail of messages sent to the
              log file and/or syslog (if configured).

       --deduplication y|n
              Controls whether deduplication is enabled or disable for VDO volume.  See lvmvdo(7) for
              more information about VDO usage.

       --discards passdown|nopassdown|ignore
              Specifies how the device-mapper thin pool layer in the kernel should handle discards.
              ignore causes the thin pool to ignore discards.  nopassdown causes the thin pool to
              process discards itself to allow reuse of unneeded extents in the thin pool.  passdown
              causes the thin pool to process discards itself (like nopassdown) and pass the discards
              to the underlying device.  See lvmthin(7) for more information.

       --driverloaded y|n
              If set to no, the command will not attempt to use device-mapper.  For testing and debug‐
              ging.

       --errorwhenfull y|n
              Specifies thin pool behavior when data space is exhausted.  When yes, device-mapper will
              immediately return an error when a thin pool is full and an I/O request requires space.
              When no, device-mapper will queue these I/O requests for a period of time to allow the
              thin pool to be extended.  Errors are returned if no space is available after the time‐
              out.  (Also see dm-thin-pool kernel module option no_space_timeout.)  See lvmthin(7) for
              more information.

       -l|--extents Number[PERCENT]
              Specifies the size of the new LV in logical extents.  The --size and --extents options
              are alternate methods of specifying size.  The total number of physical extents used
              will be greater when redundant data is needed for RAID levels.  An alternate syntax al‐
              lows the size to be determined indirectly as a percentage of the size of a related VG,
              LV, or set of PVs. The suffix %VG denotes the total size of the VG, the suffix %FREE the
              remaining free space in the VG, and the suffix %PVS the free space in the specified PVs.
              For a snapshot, the size can be expressed as a percentage of the total size of the ori‐
              gin LV with the suffix %ORIGIN (100%ORIGIN provides space for the whole origin).  When
              expressed as a percentage, the size defines an upper limit for the number of logical ex‐
              tents in the new LV. The precise number of logical extents in the new LV is not deter‐
              mined until the command has completed.

       -h|--help
              Display help text.

       -K|--ignoreactivationskip
              Ignore the "activation skip" LV flag during activation to allow LVs with the flag set to
              be activated.

       --ignoremonitoring
              Do not interact with dmeventd unless --monitor is specified.  Do not use this if
              dmeventd is already monitoring a device.

       --lockopt String
              Used to pass options for special cases to lvmlockd.  See lvmlockd(8) for more informa‐
              tion.

       --longhelp
              Display long help text.

       -j|--major Number
              Sets the major number of an LV block device.

       --[raid]maxrecoveryrate Size[k|UNIT]
              Sets the maximum recovery rate for a RAID LV.  The rate value is an amount of data per
              second for each device in the array.  Setting the rate to 0 means it will be unbounded.
              See lvmraid(7) for more information.

       --metadataprofile String
              The metadata profile to use for command configuration.  See lvm.conf(5) for more infor‐
              mation about profiles.

       --minor Number
              Sets the minor number of an LV block device.

       --[raid]minrecoveryrate Size[k|UNIT]
              Sets the minimum recovery rate for a RAID LV.  The rate value is an amount of data per
              second for each device in the array.  Setting the rate to 0 means it will be unbounded.
              See lvmraid(7) for more information.

       --mirrorlog core|disk
              Specifies the type of mirror log for LVs with the "mirror" type (does not apply to the
              "raid1" type.)  disk is a persistent log and requires a small amount of storage space,
              usually on a separate device from the data being mirrored.  core is not persistent; the
              log is kept only in memory.  In this case, the mirror must be synchronized (by copying
              LV data from the first device to others) each time the LV is activated, e.g. after re‐
              boot.  mirrored is a persistent log that is itself mirrored, but should be avoided. In‐
              stead, use the raid1 type for log redundancy.

       -m|--mirrors Number
              Specifies the number of mirror images in addition to the original LV image, e.g. --mir‐
              rors 1 means there are two images of the data, the original and one mirror image.  Op‐
              tional positional PV args on the command line can specify the devices the images should
              be placed on.  There are two mirroring implementations: "raid1" and "mirror".  These are
              the names of the corresponding LV types, or "segment types".  Use the --type option to
              specify which to use (raid1 is default, and mirror is legacy) Use lvm.conf global/mir‐
              ror_segtype_default and global/raid10_segtype_default to configure the default types.
              See the --nosync option for avoiding initial image synchronization.  See lvmraid(7) for
              more information.

       --monitor y|n
              Start (yes) or stop (no) monitoring an LV with dmeventd.  dmeventd monitors kernel
              events for an LV, and performs automated maintenance for the LV in reponse to specific
              events.  See dmeventd(8) for more information.

       -n|--name String
              Specifies the name of a new LV.  When unspecified, a default name of "lvol#" is gener‐
              ated, where # is a number generated by LVM.

       --nolocking
              Disable locking.

       --nosync
              Causes the creation of mirror, raid1, raid4, raid5 and raid10 to skip the initial syn‐
              chronization. In case of mirror, raid1 and raid10, any data written afterwards will be
              mirrored, but the original contents will not be copied. In case of raid4 and raid5, no
              parity blocks will be written, though any data written afterwards will cause parity
              blocks to be stored.  This is useful for skipping a potentially long and resource inten‐
              sive initial sync of an empty mirror/raid1/raid4/raid5 and raid10 LV.  This option is
              not valid for raid6, because raid6 relies on proper parity (P and Q Syndromes) being
              created during initial synchronization in order to reconstruct proper user date in case
              of device failures.  raid0 and raid0_meta do not provide any data copies or parity sup‐
              port and thus do not support initial synchronization.

       --noudevsync
              Disables udev synchronisation. The process will not wait for notification from udev. It
              will continue irrespective of any possible udev processing in the background. Only use
              this if udev is not running or has rules that ignore the devices LVM creates.

       -p|--permission rw|r
              Set access permission to read only r or read and write rw.

       -M|--persistent y|n
              When yes, makes the specified minor number persistent.

       --poolmetadatasize Size[m|UNIT]
              Specifies the size of the new pool metadata LV.

       --poolmetadataspare y|n
              Enable or disable the automatic creation and management of a spare pool metadata LV in
              the VG. A spare metadata LV is reserved space that can be used when repairing a pool.

       --profile String
              An alias for --commandprofile or --metadataprofile, depending on the command.

       -q|--quiet ...
              Suppress output and log messages. Overrides --debug and --verbose.  Repeat once to also
              suppress any prompts with answer 'no'.

       -r|--readahead auto|none|Number
              Sets read ahead sector count of an LV.  auto is the default which allows the kernel to
              choose a suitable value automatically.  none is equivalent to zero.

       -R|--regionsize Size[m|UNIT]
              Size of each raid or mirror synchronization region.  lvm.conf activation/raid_re‐
              gion_size can be used to configure a default.

       --reportformat basic|json
              Overrides current output format for reports which is defined globally by the report/out‐
              put_format setting in lvm.conf.  basic is the original format with columns and rows.  If
              there is more than one report per command, each report is prefixed with the report name
              for identification. json produces report output in JSON format. See lvmreport(7) for
              more information.

       -k|--setactivationskip y|n
              Persistently sets (yes) or clears (no) the "activation skip" flag on an LV.  An LV with
              this flag set is not activated unless the --ignoreactivationskip option is used by the
              activation command.  This flag is set by default on new thin snapshot LVs.  The flag is
              not applied to deactivation.  The current value of the flag is indicated in the lvs
              lv_attr bits.

       -L|--size Size[m|UNIT]
              Specifies the size of the new LV.  The --size and --extents options are alternate meth‐
              ods of specifying size.  The total number of physical extents used will be greater when
              redundant data is needed for RAID levels.

       -s|--snapshot
              Create a snapshot. Snapshots provide a "frozen image" of an origin LV.  The snapshot LV
              can be used, e.g. for backups, while the origin LV continues to be used.  This option
              can create a COW (copy on write) snapshot, or a thin snapshot (in a thin pool.)  Thin
              snapshots are created when the origin is a thin LV and the size option is NOT specified.
              Thin snapshots share the same blocks in the thin pool, and do not allocate new space
              from the VG.  Thin snapshots are created with the "activation skip" flag, see --setacti‐
              vationskip.  A thin snapshot of a non-thin "external origin" LV is created when a thin
              pool is specified. Unprovisioned blocks in the thin snapshot LV are read from the exter‐
              nal origin LV. The external origin LV must be read-only.  See lvmthin(7) for more infor‐
              mation about LVM thin provisioning.  COW snapshots are created when a size is specified.
              The size is allocated from space in the VG, and is the amount of space that can be used
              for saving COW blocks as writes occur to the origin or snapshot.  The size chosen should
              depend upon the amount of writes that are expected; often 20% of the origin LV is
              enough. If COW space runs low, it can be extended with lvextend (shrinking is also al‐
              lowed with lvreduce.)  A small amount of the COW snapshot LV size is used to track COW
              block locations, so the full size is not available for COW data blocks.  Use lvs to
              check how much space is used, and see --monitor to to automatically extend the size to
              avoid running out of space.

       -i|--stripes Number
              Specifies the number of stripes in a striped LV. This is the number of PVs (devices)
              that a striped LV is spread across. Data that appears sequential in the LV is spread
              across multiple devices in units of the stripe size (see --stripesize). This does not
              change existing allocated space, but only applies to space being allocated by the com‐
              mand.  When creating a RAID 4/5/6 LV, this number does not include the extra devices
              that are required for parity. The largest number depends on the RAID type (raid0: 64,
              raid10: 32, raid4/5: 63, raid6: 62), and when unspecified, the default depends on the
              RAID type (raid0: 2, raid10: 2, raid4/5: 3, raid6: 5.)  To stripe a new raid LV across
              all PVs by default, see lvm.conf allocation/raid_stripe_all_devices.

       -I|--stripesize Size[k|UNIT]
              The amount of data that is written to one device before moving to the next in a striped
              LV.

       -t|--test
              Run in test mode. Commands will not update metadata.  This is implemented by disabling
              all metadata writing but nevertheless returning success to the calling function. This
              may lead to unusual error messages in multi-stage operations if a tool relies on reading
              back metadata it believes has changed but hasn't.

       -T|--thin
              Specifies the command is handling a thin LV or thin pool.  See --type thin, --type
              thin-pool, and --virtualsize.  See lvmthin(7) for more information about LVM thin provi‐
              sioning.

       --thinpool LV
              The name of a thin pool LV.

       --type linear|striped|snapshot|mirror|raid|thin|cache|thin-pool|cache-pool
              The LV type, also known as "segment type" or "segtype".  See usage descriptions for the
              specific ways to use these types.  For more information about redundancy and performance
              (raid<N>, mirror, striped, linear) see lvmraid(7).  For thin provisioning (thin,
              thin-pool) see lvmthin(7).  For performance caching (cache, cache-pool) see lvmcache(7).
              For copy-on-write snapshots (snapshot) see usage definitions.  Several commands omit an
              explicit type option because the type is inferred from other options or shortcuts (e.g.
              --stripes, --mirrors, --snapshot, --virtualsize, --thin, --cache).  Use inferred types
              with care because it can lead to unexpected results.

       --vdo
              Specifies the command is handling VDO LV.  See --type vdo.  See lvmvdo(7) for more in‐
              formation about VDO usage.

       --vdopool LV
              The name of a VDO pool LV.  See lvmvdo(7) for more information about VDO usage.

       -v|--verbose ...
              Set verbose level. Repeat from 1 to 4 times to increase the detail of messages sent to
              stdout and stderr.

       --version
              Display version information.

       -V|--virtualsize Size[m|UNIT]
              The virtual size of a new thin LV.  See lvmthin(7) for more information about LVM thin
              provisioning.  Using virtual size (-V) and actual size (-L) together creates a sparse
              LV.  lvm.conf global/sparse_segtype_default determines the default segment type used to
              create a sparse LV.  Anything written to a sparse LV will be returned when reading from
              it.  Reading from other areas of the LV will return blocks of zeros.  When using a snap‐
              shot to create a sparse LV, a hidden virtual device is created using the zero target,
              and the LV has the suffix _vorigin.  Snapshots are less efficient than thin provisioning
              when creating large sparse LVs (GiB).

       -W|--wipesignatures y|n
              Controls detection and subsequent wiping of signatures on new LVs.  There is a prompt
              for each signature detected to confirm its wiping (unless --yes is used to override con‐
              firmations.)  When not specified, signatures are wiped whenever zeroing is done (see
              --zero). This behaviour can be configured with lvm.conf allocation/wipe_signa‐
              tures_when_zeroing_new_lvs.  If blkid wiping is used (lvm.conf allocation/use_blkid_wip‐
              ing) and LVM is compiled with blkid wiping support, then the blkid(8) library is used to
              detect the signatures (use blkid -k to list the signatures that are recognized).  Other‐
              wise, native LVM code is used to detect signatures (only MD RAID, swap and LUKS signa‐
              tures are detected in this case.)  The LV is not wiped if the read only flag is set.

       -y|--yes
              Do not prompt for confirmation interactively but always assume the answer yes. Use with
              extreme caution.  (For automatic no, see -qq.)

       -Z|--zero y|n
              Controls zeroing of the first 4KiB of data in the new LV.  Default is y.  Snapshot COW
              volumes are always zeroed.  LV is not zeroed if the read only flag is set.  Warning:
              trying to mount an unzeroed LV can cause the system to hang.

VARIABLES
       VG
              Volume  Group  name.   See  lvm(8) for valid names.  For lvcreate, the required VG posi‐
              tional arg may be omitted when the VG name is included in another  option,  e.g.  --name
              VG/LV.

       LV
              Logical  Volume  name.   See lvm(8) for valid names.  An LV positional arg generally in‐
              cludes the VG name and LV name, e.g. VG/LV.  LV followed by _<type> indicates that an LV
              of the given type is required. (raid represents raid<N> type)

       PV
              Physical Volume name, a device path under /dev.  For commands managing physical extents,
              a PV positional arg generally accepts a suffix indicating a range (or  multiple  ranges)
              of physical extents (PEs). When the first PE is omitted, it defaults to the start of the
              device, and when the last PE is omitted it defaults to end.  Start and end range (inclu‐
              sive): PV[:PE-PE]...  Start and length range (counting from 0): PV[:PE+PE]...

       String
              See the option description for information about the string content.

       Size[UNIT]
              Size  is  an input number that accepts an optional unit.  Input units are always treated
              as base two values, regardless of capitalization, e.g. 'k' and 'K' both refer  to  1024.
              The default input unit is specified by letter, followed by |UNIT.  UNIT represents other
              possible input units: bBsSkKmMgGtTpPeE.  b|B is bytes, s|S is sectors of 512 bytes,  k|K
              is  kilobytes,  m|M  is megabytes, g|G is gigabytes, t|T is terabytes, p|P is petabytes,
              e|E is exabytes.  (This should not be confused with the output  control  --units,  where
              capital letters mean multiple of 1000.)

ENVIRONMENT VARIABLES
       See  lvm(8)  for information about environment variables used by lvm.  For example, LVM_VG_NAME
       can generally be substituted for a required VG parameter.

ADVANCED USAGE
       Alternate command forms, advanced command usage, and listing of all valid syntax for  complete‐
       ness.

       Create an LV that returns errors when used.

       lvcreate --type error -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
       -

       Create an VDO LV with VDO pool.

       lvcreate --vdo -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -V|--virtualsize Size[m|UNIT] ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [    --compression y|n ]
           [    --deduplication y|n ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create an VDO LV using existing VDO pool.

       lvcreate --vdopool LV -V|--virtualsize Size[m|UNIT] VG
           [    --vdo ]
           [    --type vdo ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create an LV that returns zeros when read.

       lvcreate --type zero -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
       -

       Create a linear LV.

       lvcreate --type linear -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a striped LV (also see lvcreate --stripes).

       lvcreate --type striped -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a mirror LV (also see --type raid1).

       lvcreate --type mirror -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -m|--mirrors Number ]
           [ -R|--regionsize Size[m|UNIT] ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --mirrorlog core|disk ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a COW snapshot LV of an origin LV
       (also see --snapshot).

       lvcreate --type snapshot -L|--size Size[m|UNIT] LV
           [ -l|--extents Number[PERCENT] ]
           [ -s|--snapshot ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a sparse COW snapshot LV of a virtual origin LV
       (also see --snapshot).

       lvcreate --type snapshot -L|--size Size[m|UNIT]
             -V|--virtualsize Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -s|--snapshot ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a sparse COW snapshot LV of a virtual origin LV.

       lvcreate -s|--snapshot -L|--size Size[m|UNIT]
             -V|--virtualsize Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --type snapshot ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a thin pool (infers --type thin-pool).

       lvcreate -T|--thin -L|--size Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --type thin-pool ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a thin pool named by the --thinpool arg
       (infers --type thin-pool).

       lvcreate -L|--size Size[m|UNIT] --thinpool LV_new VG
           [ -l|--extents Number[PERCENT] ]
           [ -T|--thin ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --type thin-pool ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a cache pool named by the --cachepool arg
       (variant, uses --cachepool in place of --name).

       lvcreate --type cache-pool -L|--size Size[m|UNIT]
             --cachepool LV_new VG
           [ -l|--extents Number[PERCENT] ]
           [ -H|--cache ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --cachemode writethrough|writeback|passthrough ]
           [    --cachepolicy String ]
           [    --cachesettings String ]
           [    --cachemetadataformat auto|1|2 ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a thin LV in a thin pool.

       lvcreate --type thin -V|--virtualsize Size[m|UNIT]
             --thinpool LV_thinpool VG
           [ -T|--thin ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
       -

       Create a thin LV in a thin pool named in the first arg
       (variant, also see --thinpool for naming pool).

       lvcreate --type thin -V|--virtualsize Size[m|UNIT] LV_thinpool
           [ -T|--thin ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
       -

       Create a thin LV in the thin pool named in the first arg
       (variant, infers --type thin, also see --thinpool for
       naming pool.)

       lvcreate -V|--virtualsize Size[m|UNIT] LV_thinpool
           [ -T|--thin ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --type thin ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
       -

       Create a thin LV that is a snapshot of an existing thin LV.

       lvcreate --type thin LV_thin
           [ -T|--thin ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
       -

       Create a thin LV that is a snapshot of an existing thin LV
       (infers --type thin).

       lvcreate -T|--thin LV_thin
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --type thin ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
       -

       Create a thin LV that is a snapshot of an external origin LV
       (infers --type thin).

       lvcreate -s|--snapshot --thinpool LV_thinpool LV
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [    --type thin ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
       -

       Create a thin LV, first creating a thin pool for it,
       where the new thin pool is named by the --thinpool arg
       (variant, infers --type thin).

       lvcreate -V|--virtualsize Size[m|UNIT] -L|--size Size[m|UNIT]
             --thinpool LV_new
           [ -l|--extents Number[PERCENT] ]
           [ -T|--thin ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a thin LV, first creating a thin pool for it,
       where the new thin pool is named by the --thinpool arg
       (variant, infers --type thin).

       lvcreate -V|--virtualsize Size[m|UNIT] -L|--size Size[m|UNIT]
             --thinpool LV_new VG
           [ -l|--extents Number[PERCENT] ]
           [ -T|--thin ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a thin LV, first creating a thin pool for it,
       where the new thin pool is named in the first arg,
       or the new thin pool name is generated when the first
       arg is a VG name.

       lvcreate --type thin -V|--virtualsize Size[m|UNIT]
             -L|--size Size[m|UNIT] VG|LV_new
           [ -l|--extents Number[PERCENT] ]
           [ -T|--thin ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a thin LV, first creating a thin pool for it,
       where the new thin pool is named in the first arg,
       or the new thin pool name is generated when the first
       arg is a VG name (variant, infers --type thin).

       lvcreate -T|--thin -V|--virtualsize Size[m|UNIT]
             -L|--size Size[m|UNIT] VG|LV_new
           [ -l|--extents Number[PERCENT] ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a thin LV, first creating a thin pool for it
       (infers --type thin).
       Create a sparse snapshot of a virtual origin LV
       (infers --type snapshot).
       Chooses --type thin or --type snapshot according to
       config setting sparse_segtype_default.

       lvcreate -L|--size Size[m|UNIT] -V|--virtualsize Size[m|UNIT] VG
           [ -l|--extents Number[PERCENT] ]
           [ -s|--snapshot ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --type snapshot ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --discards passdown|nopassdown|ignore ]
           [    --errorwhenfull y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a cache LV, first creating a new origin LV,
       then combining it with the existing cache pool named
       by the --cachepool arg (variant, infers --type cache).

       lvcreate -L|--size Size[m|UNIT] --cachepool LV_cachepool VG
           [ -l|--extents Number[PERCENT] ]
           [ -H|--cache ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --type cache ]
           [    --cachemode writethrough|writeback|passthrough ]
           [    --cachepolicy String ]
           [    --cachesettings String ]
           [    --cachemetadataformat auto|1|2 ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       Create a cache LV, first creating a new origin LV,
       then combining it with the existing cache pool named
       in the first arg (variant, also use --cachepool).

       lvcreate --type cache -L|--size Size[m|UNIT] LV_cachepool
           [ -l|--extents Number[PERCENT] ]
           [ -H|--cache ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --cachemode writethrough|writeback|passthrough ]
           [    --cachepolicy String ]
           [    --cachesettings String ]
           [    --cachemetadataformat auto|1|2 ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

       When LV is a cache pool, create a cache LV,
       first creating a new origin LV, then combining it with
       the existing cache pool named in the first arg
       (variant, infers --type cache, also use --cachepool).
       When LV is not a cache pool, convert the specified LV
       to type cache after creating a new cache pool LV to use
       (use lvconvert).

       lvcreate -H|--cache -L|--size Size[m|UNIT] LV
           [ -l|--extents Number[PERCENT] ]
           [ -c|--chunksize Size[k|UNIT] ]
           [ -A|--autobackup y|n ]
           [ -a|--activate y|n|ay ]
           [ -C|--contiguous y|n ]
           [ -K|--ignoreactivationskip ]
           [ -j|--major Number ]
           [ -n|--name String ]
           [ -p|--permission rw|r ]
           [ -M|--persistent y|n ]
           [ -r|--readahead auto|none|Number ]
           [ -k|--setactivationskip y|n ]
           [ -W|--wipesignatures y|n ]
           [ -Z|--zero y|n ]
           [ -i|--stripes Number ]
           [ -I|--stripesize Size[k|UNIT] ]
           [    --cachemode writethrough|writeback|passthrough ]
           [    --cachepolicy String ]
           [    --cachesettings String ]
           [    --cachemetadataformat auto|1|2 ]
           [    --poolmetadatasize Size[m|UNIT] ]
           [    --poolmetadataspare y|n ]
           [    --addtag Tag ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --ignoremonitoring ]
           [    --metadataprofile String ]
           [    --minor Number ]
           [    --monitor y|n ]
           [    --nosync ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ PV ... ]
       -

EXAMPLES
       Create a striped LV with 3 stripes, a stripe size of 8KiB and a size of 100MiB.  The LV name is
       chosen by lvcreate.
       lvcreate -i 3 -I 8 -L 100m vg00

       Create a raid1 LV with two images, and a useable size of 500 MiB. This operation  requires  two
       devices,  one  for each mirror image. RAID metadata (superblock and bitmap) is also included on
       the two devices.
       lvcreate --type raid1 -m1 -L 500m -n mylv vg00

       Create a mirror LV with two images, and a useable size of 500  MiB.   This  operation  requires
       three devices: two for mirror images and one for a disk log.
       lvcreate --type mirror -m1 -L 500m -n mylv vg00

       Create a mirror LV with 2 images, and a useable size of 500 MiB.  This operation requires 2 de‐
       vices because the log is in memory.
       lvcreate --type mirror -m1 --mirrorlog core -L 500m -n mylv vg00

       Create a copy-on-write snapshot of an LV:
       lvcreate --snapshot --size 100m --name mysnap vg00/mylv

       Create a copy-on-write snapshot with a size sufficient for overwriting 20% of the size  of  the
       original LV.
       lvcreate -s -l 20%ORIGIN -n mysnap vg00/mylv

       Create a sparse LV with 1TiB of virtual space, and actual space just under 100MiB.
       lvcreate --snapshot --virtualsize 1t --size 100m --name mylv vg00

       Create a linear LV with a usable size of 64MiB on specific physical extents.
       lvcreate -L 64m -n mylv vg00 /dev/sda:0-7 /dev/sdb:0-7

       Create  a RAID5 LV with a usable size of 5GiB, 3 stripes, a stripe size of 64KiB, using a total
       of 4 devices (including one for parity).
       lvcreate --type raid5 -L 5G -i 3 -I 64 -n mylv vg00

       Create a RAID5 LV using all of the free space in the VG and spanning all  the  PVs  in  the  VG
       (note  that  the  command  will fail if there are more than 8 PVs in the VG, in which case -i 7
       must be used to get to the current maximum of 8 devices including parity for RaidLVs).
       lvcreate --config allocation/raid_stripe_all_devices=1
              --type raid5 -l 100%FREE -n mylv vg00

       Create RAID10 LV with a usable size of 5GiB, using 2 stripes, each on a two-image mirror. (Note
       that  the -i and -m arguments behave differently: -i specifies the total number of stripes, but
       -m specifies the number of images in addition to the first image).
       lvcreate --type raid10 -L 5G -i 2 -m 1 -n mylv vg00

       Create a 1TiB thin LV, first creating a new thin pool for it, where the thin pool has 100MiB of
       space, uses 2 stripes, has a 64KiB stripe size, and 256KiB chunk size.
       lvcreate --type thin --name mylv --thinpool mypool
              -V 1t -L 100m -i 2 -I 64 -c 256 vg00

       Create  a  thin  snapshot  of  a  thin  LV (the size option must not be used, otherwise a copy-
       on-write snapshot would be created).
       lvcreate --snapshot --name mysnap vg00/thinvol

       Create a thin snapshot of the read-only inactive LV named "origin" which  becomes  an  external
       origin for the thin snapshot LV.
       lvcreate --snapshot --name mysnap --thinpool mypool vg00/origin

       Create  a  cache  pool from a fast physical device. The cache pool can then be used to cache an
       LV.
       lvcreate --type cache-pool -L 1G -n my_cpool vg00 /dev/fast1

       Create a cache LV, first creating a new origin LV on a slow physical device, then combining the
       new origin LV with an existing cache pool.
       lvcreate --type cache --cachepool my_cpool
              -L 100G -n mylv vg00 /dev/slow1

SEE ALSO
       lvm(8) lvm.conf(5) lvmconfig(8)

       pvchange(8) pvck(8) pvcreate(8) pvdisplay(8) pvmove(8) pvremove(8) pvresize(8) pvs(8) pvscan(8)

       vgcfgbackup(8)  vgcfgrestore(8) vgchange(8) vgck(8) vgcreate(8) vgconvert(8) vgdisplay(8) vgex‐
       port(8) vgextend(8) vgimport(8)  vgimportclone(8)  vgmerge(8)  vgmknodes(8)  vgreduce(8)  vgre‐
       move(8) vgrename(8) vgs(8) vgscan(8) vgsplit(8)

       lvcreate(8)  lvchange(8)  lvconvert(8)  lvdisplay(8)  lvextend(8) lvreduce(8) lvremove(8) lvre‐
       name(8) lvresize(8) lvs(8) lvscan(8)

       lvm-fullreport(8) lvm-lvpoll(8) lvm2-activation-generator(8) blkdeactivate(8) lvmdump(8)

       dmeventd(8) lvmpolld(8) lvmlockd(8) lvmlockctl(8) cmirrord(8) lvmdbusd(8)

       lvmsystemid(7) lvmreport(7) lvmraid(7) lvmthin(7) lvmcache(7)

Red Hat, Inc.                      LVM TOOLS 2.03.02(2) (2018-12-18)                       LVCREATE(8)
