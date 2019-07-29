LVCHANGE(8)                                                   System Manager's Manual                                                  LVCHANGE(8)

NAME
       lvchange — change attributes of a logical volume

SYNOPSIS
       lvchange [-a|--activate [a][e|s|l]{y|n}] [--activationmode {complete|degraded|partial}] [--addtag Tag] [-K|--ignoreactivationskip]
       [-k|--setactivationskip {y|n}] [--alloc AllocationPolicy] [-A|--autobackup {y|n}] [--rebuild PhysicalVolume] [--cachemode
       {passthrough|writeback|writethrough}] [--cachepolicy Policy] [--cachesettings Key=Value] [--commandprofile ProfileName] [-C|--contiguous
       {y|n}] [-d|--debug] [--deltag Tag] [--detachprofile] [--discards {ignore|nopassdown|passdown}] [--errorwhenfull {y|n}] [-h|-?|--help]
       [--ignorelockingfailure] [--ignoremonitoring] [--ignoreskippedcluster] [--metadataprofile ProfileName] [--monitor {y|n}] [--noudevsync]
       [-P|--partial] [-p|--permission {r|rw}] [-M|--persistent {y|n} [--major Major] [--minor Minor]] [--poll {y|n}] [--[raid]maxrecoveryrate
       Rate] [--[raid]minrecoveryrate Rate] [--[raid]syncaction {check|repair}] [--[raid]writebehind IOCount] [--[raid]writemostly PhysicalVol‐
       ume[:{y|n|t}]] [-r|--readahead {ReadAheadSectors|auto|none}] [--refresh] [--reportformat {basic|json}] [--resync] [-S|--select Selection]
       [--sysinit] [-t|--test] [-v|--verbose] [-Z|--zero {y|n}] [LogicalVolumePath...]

DESCRIPTION
       lvchange allows you to change the attributes of a logical volume including making them known to the kernel ready for use.

OPTIONS
       See lvm(8) for common options.

       -a|--activate [a][e|s|l]{y|n}
              Controls  the  availability  of  the logical volumes for use.  Communicates with the kernel device-mapper driver via libdevmapper to
              activate (-ay) or deactivate (-an) the logical volumes.
              Activation of a logical volume creates a symbolic link /dev/VolumeGroupName/LogicalVolumeName pointing to  the  device  node.   This
              link  is  removed on deactivation.  All software and scripts should access the device through this symbolic link and present this as
              the name of the device.  The location and name of the underlying device node may depend on the distribution and configuration  (e.g.
              udev) and might change from release to release.
              If  autoactivation  option is used (-aay), the logical volume is activated only if it matches an item in the activation/auto_activa‐
              tion_volume_list set in lvm.conf(5).  If this list is not set, then all volumes are  considered  for  activation.  The  -aay  option
              should  be  also  used  during  system  boot  so it's possible to select which volumes to activate using the activation/auto_activa‐
              tion_volume_list setting.
              In a clustered VG, clvmd is used for activation, and the following options are possible:

              With -aey, clvmd activates the LV in exclusive mode (with an exclusive lock), allowing a single node to activate the LV.

              With -asy, clvmd activates the LV in shared mode (with a shared lock), allowing multiple nodes to activate the LV concurrently.   If
              the LV type prohibits shared access, such as an LV with a snapshot, the 's' option is ignored and an exclusive lock is used.

              With  -ay  (no  mode specified), clvmd activates the LV in shared mode if the LV type allows concurrent access, such as a linear LV.
              Otherwise, clvmd activates the LV in exclusive mode.

              With -aey, -asy, and -ay, clvmd attempts to activate the LV on all nodes.  If exclusive mode is used, then only  one  of  the  nodes
              will be successful.

              With -an, clvmd attempts to deactivate the LV on all nodes.

              With  -aly,  clvmd activates the LV only on the local node, and -aln deactivates only on the local node.  If the LV type allows con‐
              current access, then shared mode is used, otherwise exclusive.

              LVs with snapshots are always activated exclusively because they can only be used on one node at once.

              For local VGs -ay, -aey, and -asy are all equivalent.

       --activationmode {complete|degraded|partial}
              The activation mode determines whether logical volumes are allowed to activate when there are physical volumes missing (e.g. due  to
              a  device  failure).  complete is the most restrictive; allowing only those logical volumes to be activated that are not affected by
              the missing PVs.  degraded allows RAID logical volumes to be activated even if they have PVs missing.  (Note that the "mirror"  seg‐
              ment  type  is not considered a RAID logical volume.  The "raid1" segment type should be used instead.)  Finally, partial allows any
              logical volume to be activated even if portions are missing due to a missing or failed PV.  This last option  should  only  be  used
              when performing recovery or repair operations.  degraded is the default mode.  To change it, modify activation_mode in lvm.conf(5).

       -K|--ignoreactivationskip
              Ignore the flag to skip Logical Volumes during activation.

       -k|--setactivationskip {y|n}
              Controls   whether  Logical  Volumes are persistently flagged to be skipped during activation. By default, thin snapshot volumes are
              flagged for activation skip.  To activate such volumes, an extra --ignoreactivationskip option  must  be  used.   The  flag  is  not
              applied  during deactivation. To see whether the flag is attached, use lvs(8) command where the state of the flag is reported within
              lv_attr bits.

       --cachemode {passthrough|writeback|writethrough}
              Specifying a cache mode determines when the writes to a cache LV are considered complete.  When writeback is specified, a  write  is
              considered  complete as soon as it is stored in the cache pool LV.  If writethough is specified, a write is considered complete only
              when it has been stored in the cache pool LV and on the origin LV.  While  writethrough  may  be  slower  for  writes,  it  is  more
              resilient if something should happen to a device associated with the cache pool LV. With passthrough mode, all reads are served from
              origin LV (all reads miss the cache) and all writes are forwarded to the origin LV;  additionally,  write  hits  cause  cache  block
              invalidates. See lvmcache(7) for more details.

       --cachepolicy Policy, --cachesettings Key=Value
              Only  applicable  to cached LVs; see also lvmcache(7). Sets the cache policy and its associated tunable settings. In most use-cases,
              default values should be adequate.

       -C|--contiguous {y|n}
              Tries to set or reset the contiguous allocation policy for logical volumes. It's only possible to change  a  non-contiguous  logical
              volume's allocation policy to contiguous, if all of the allocated physical extents are already contiguous.

       --detachprofile
              Detach  any  metadata  configuration profiles attached to given Logical Volumes. See lvm.conf(5) for more information about metadata
              profiles.

       --discards {ignore|nopassdown|passdown}
              Set this to ignore to ignore any discards received by a thin pool Logical Volume.  Set to nopassdown to process such discards within
              the thin pool itself and allow the no-longer-needed extents to be overwritten by new data.  Set to passdown (the default) to process
              them both within the thin pool itself and to pass them down the underlying device.

       --errorwhenfull {y|n}
              Sets thin pool behavior when data space is exhaused. See lvcreate(8) for information.

       --ignoremonitoring
              Make no attempt to interact with dmeventd unless --monitor is specified.  Do not use  this  if  dmeventd  is  already  monitoring  a
              device.

       --major Major
              Sets  the  major  number. This option is supported only on older systems (kernel version 2.4) and is ignored on modern Linux systems
              where major numbers are dynamically assigned.

       --minor Minor
              Set the minor number.

       --metadataprofile ProfileName
              Uses and attaches ProfileName configuration profile to the logical volume metadata. Whenever the logical volume  is  processed  next
              time,  the  profile  is  automatically applied. If the volume group has another profile attached, the logical volume profile is pre‐
              ferred.  See lvm.conf(5) for more information about metadata profiles.

       --monitor {y|n}
              Start or stop monitoring a mirrored or snapshot logical volume with dmeventd, if it is installed.  If a device used by  a  monitored
              mirror  reports  an  I/O  error,  the  failure  is handled according to mirror_image_fault_policy and mirror_log_fault_policy set in
              lvm.conf(5).

       --noudevsync
              Disable udev synchronisation. The process will not wait for notification from udev.  It will continue irrespective of  any  possible
              udev  processing  in the background.  You should only use this if udev is not running or has rules that ignore the devices LVM2 cre‐
              ates.

       -p|--permission {r|rw}
              Change access permission to read-only or read/write.

       -M|--persistent {y|n}
              Set to y to make the minor number specified persistent.  Change of persistent numbers is not supported for pool volumes.

       --poll {y|n}
              Without polling a logical volume's backgrounded transformation process will never complete.  If there is  an  incomplete  pvmove  or
              lvconvert  (for example, on rebooting after a crash), use --poll y to restart the process from its last checkpoint.  However, it may
              not be appropriate to immediately poll a logical volume when it is activated, use --poll n to defer and then --poll y to restart the
              process.

       --[raid]rebuild PhysicalVolume
              Option can be repeated multiple times.  Selects PhysicalVolume(s) to be rebuild in a RaidLV.  Use this option instead of --resync or
              --[raid]syncaction repair in case the PVs with corrupted data are known and their data should be reconstructed  rather  than  recon‐
              structing default (rotating) data.
              E.g. in a raid1 mirror, the master leg on /dev/sda may hold corrupt data due to a known transient disk error, thus
              lvchange --rebuild /dev/sda LV
              will  request the master leg to be rebuild rather than rebuilding all other legs from the master.  On a raid5 with rotating data and
              parity
              lvchange --rebuild /dev/sda LV
              will rebuild all data and parity blocks in the stripe on /dev/sda.

       --[raid]maxrecoveryrate Rate[b|B|s|S|k|K|m|M|g|G]
              Sets the maximum recovery rate for a RAID logical volume.  Rate is specified as an amount per second for each device in  the  array.
              If no suffix is given, then KiB/sec/device is assumed.  Setting the recovery rate to 0 means it will be unbounded.

       --[raid]minrecoveryrate Rate[b|B|s|S|k|K|m|M|g|G]
              Sets  the  minimum recovery rate for a RAID logical volume.  Rate is specified as an amount per second for each device in the array.
              If no suffix is given, then KiB/sec/device is assumed.  Setting the recovery rate to 0 means it will be unbounded.

       --[raid]syncaction {check|repair}
              This argument is used to initiate various RAID synchronization operations.  The check and repair options provide a way to check  the
              integrity  of  a RAID logical volume (often referred to as "scrubbing").  These options cause the RAID logical volume to read all of
              the data and parity blocks in the array and check for any discrepancies (e.g. mismatches between mirrors or  incorrect  parity  val‐
              ues).  If check is used, the discrepancies will be counted but not repaired.  If repair is used, the discrepancies will be corrected
              as they are encountered.  The lvs(8) command can be used to show the number of discrepancies found or repaired.

       --[raid]writebehind IOCount
              Specify the maximum number of outstanding writes that are allowed to devices in a RAID1 logical volume that  are  marked  as  write-
              mostly.  Once this value is exceeded, writes become synchronous (i.e. all writes to the constituent devices must complete before the
              array signals the write has completed).  Setting the value to zero clears the preference and allows the system to choose  the  value
              arbitrarily.

       --[raid]writemostly PhysicalVolume[:{y|n|t}]
              Mark  a  device  in  a RAID1 logical volume as write-mostly.  All reads to these drives will be avoided unless absolutely necessary.
              This keeps the number of I/Os to the drive to a minimum.  The default behavior is to set the write-mostly attribute for  the  speci‐
              fied physical volume in the logical volume.  It is possible to also remove the write-mostly flag by appending a ":n" to the physical
              volume or to toggle the value by specifying ":t".  The --writemostly argument can be specified more than one time in a  single  com‐
              mand; making it possible to toggle the write-mostly attributes for all the physical volumes in a logical volume at once.

       -r|--readahead {ReadAheadSectors|auto|none}
              Set  read ahead sector count of this logical volume.  For volume groups with metadata in lvm1 format, this must be a value between 2
              and 120 sectors.  The default value is "auto" which allows the kernel to choose a suitable value automatically.  "none"  is  equiva‐
              lent to specifying zero.

       --refresh
              If the logical volume is active, reload its metadata.  This is not necessary in normal operation, but may be useful if something has
              gone wrong or if you're doing clustering manually without a clustered lock manager.

       --resync
              Forces the complete resynchronization of a mirror.  In normal circumstances you should not need this option because  synchronization
              happens automatically.  Data is read from the primary mirror device and copied to the others, so this can take a considerable amount
              of time - and during this time you are without a complete redundant copy of your data.

       --sysinit
              Indicates that lvchange(8) is being invoked from early system initialisation scripts (e.g. rc.sysinit or an initrd),  before  write‐
              able filesystems are available. As such, some functionality needs to be disabled and this option acts as a shortcut which selects an
              appropriate set of options. Currently this is equivalent to using  --ignorelockingfailure, --ignoremonitoring, --poll n and  setting
              LVM_SUPPRESS_LOCKING_FAILURE_MESSAGES environment variable.

              If  --sysinit  is  used  in  conjunction with lvmetad(8) enabled and running, autoactivation is preferred over manual activation via
              direct lvchange call.  Logical volumes are autoactivated according to auto_activation_volume_list set in lvm.conf(5).

       -Z|--zero {y|n}
              Set zeroing mode for thin pool. Note: already provisioned blocks from pool in non-zero mode are not cleared in unwritten parts  when
              setting zero to y.

ENVIRONMENT VARIABLES
       LVM_SUPPRESS_LOCKING_FAILURE_MESSAGES
              Suppress locking failure messages.

Examples
       Changes the permission on volume lvol1 in volume group vg00 to be read-only:

       lvchange -pr vg00/lvol1

SEE ALSO
       lvm(8), lvmetad(8), lvs(8), lvcreate(8), vgchange(8), lvmcache(7), lvmthin(7), lvm.conf(5)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             LVCHANGE(8)
