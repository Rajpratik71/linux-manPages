VGCHANGE(8)                                                                              System Manager's Manual                                                                              VGCHANGE(8)

NAME
       vgchange — change attributes of a volume group

SYNOPSIS
       vgchange  [--addtag  Tag] [--alloc AllocationPolicy] [-A|--autobackup {y|n}] [-a|--activate [a|e|s|l] {y|n}] [--activationmode {complete|degraded|partial}] [-K|--ignoreactivationskip] [--monitor
       {y|n}] [--poll {y|n}] [-c|--clustered {y|n}] [-u|--uuid] [--commandprofile ProfileName] [-d|--debug] [--deltag Tag] [--detachprofile]  [-h|--help]  [--ignorelockingfailure]  [--ignoremonitoring]
       [--ignoreskippedcluster]  [--sysinit]  [--noudevsync]  [--lock-start]  [--lock-stop]  [--lock-type  LockType]  [-l|--logicalvolume MaxLogicalVolumes] [-p|--maxphysicalvolumes MaxPhysicalVolumes]
       [--metadataprofile ProfileName] [--[vg]metadatacopies] NumberOfCopies|unmanaged|all] [-P|--partial] [-s|--physicalextentsize PhysicalExtentSize[bBsSkKmMgGtTpPeE]] [-S|--select Selection] [--sys‐
       temid SystemID] [--refresh] [-t|--test] [-v|--verbose] [--version] [-x|--resizeable {y|n}] [VolumeGroupName...]

DESCRIPTION
       vgchange allows you to change the attributes of one or more volume groups. Its main purpose is to activate and deactivate VolumeGroupName, or all volume groups if none is specified.  Only active
       volume groups are subject to changes and allow access to their logical volumes.  [Not yet implemented: During volume group activation, if vgchange recognizes snapshot logical volumes which  were
       dropped because they ran out of space, it displays a message informing the administrator that such snapshots should be removed (see lvremove(8)).  ]

OPTIONS
       See lvm(8) for common options.

       -A, --autobackup {y|n}
              Controls automatic backup of metadata after the change.  See vgcfgbackup(8).  Default is yes.

       -a, --activate [a|e|s|l]{y|n}
              Controls the availability of the logical volumes in the volume group for input/output.  In other words, makes the logical volumes known/unknown to the kernel.  If autoactivation option is
              used (-aay), each logical volume in the volume group is activated only if it matches an item in the activation/auto_activation_volume_list set in lvm.conf. If this list is not  set,  then
              all  volumes  are considered for activation.  The -aay option should be also used during system boot so it's possible to select which volumes to activate using the activation/auto_activa‐
              tion_volume_list settting.

              Activation of a logical volume creates a symbolic link /dev/VolumeGroupName/LogicalVolumeName pointing to the device node.  This link is removed on deactivation.  All software and scripts
              should  access  the  device  through this symbolic link and present this as the name of the device.  The location and name of the underlying device node may depend on the distribution and
              configuration (e.g. udev) and might change from release to release.

              In a clustered VG, clvmd is used for activation, and the following options are possible:

              With -aey, clvmd activates the LV in exclusive mode (with an exclusive lock), allowing a single node to activate the LV.

              With -asy, clvmd activates the LV in shared mode (with a shared lock), allowing multiple nodes to activate the LV concurrently.  If the LV type prohibits shared access, such as an LV with
              a snapshot, the 's' option is ignored and an exclusive lock is used.

              With -ay (no mode specified), clvmd activates the LV in shared mode if the LV type allows concurrent access, such as a linear LV.  Otherwise, clvmd activates the LV in exclusive mode.

              With -aey, -asy, and -ay, clvmd attempts to activate the LV on all nodes.  If exclusive mode is used, then only one of the nodes will be successful.

              With -an, clvmd attempts to deactivate the LV on all nodes.

              With -aly, clvmd activates the LV only on the local node, and -aln deactivates only on the local node.  If the LV type allows concurrent access, then shared mode is used, otherwise exclu‐
              sive.

              LVs with snapshots are always activated exclusively because they can only be used on one node at once.

              For local VGs, -ay, -aey, and -asy are all equivalent.

              In a shared VG, lvmlockd is used for locking, and the following options are possible:

              With -aey, the command activates the LV in exclusive mode, allowing a single host to activate the LV (the host running the command).  Before activating the LV, the command  uses  lvmlockd
              to acquire an exclusive lock on the LV.  If the lock cannot be acquired, the LV is not activated and an error is reported.  This would happen if the LV is active on another host.

              With  -asy,  the command activates the LV in shared mode, allowing multiple hosts to activate the LV concurrently.  Before activating the LV, the command uses lvmlockd to acquire a shared
              lock on the LV.  If the lock cannot be acquired, the LV is not activated and an error is reported.  This would happen if the LV is active exclusively on another host.  If the LV type pro‐
              hibits shared access, such as a snapshot, the command will report an error and fail.

              With -an, the command deactivates the LV on the host running the command.  After deactivating the LV, the command uses lvmlockd to release the current lock on the LV.

              With lvmlockd, an unspecified mode is always exclusive, -ay defaults to -aey.

       --activationmode {complete|degraded|partial}
              The  activation  mode determines whether logical volumes are allowed to activate when there are physical volumes missing (e.g. due to a device failure).  complete is the most restrictive;
              allowing only those logical volumes to be activated that are not affected by the missing PVs.  degraded allows RAID logical volumes to be activated even if they have PVs  missing.   (Note
              that the "mirror" segment type is not considered a RAID logical volume.  The "raid1" segment type should be used instead.)  Finally, partial allows any logical volume to be activated even
              if portions are missing due to a missing or failed PV.  This last option should only be used when performing recovery or repair operations.  degraded is the default mode.  To  change  it,
              modify activation_mode in lvm.conf(5).

       -K, --ignoreactivationskip
              Ignore the flag to skip Logical Volumes during activation.

       -c, --clustered {y|n}
              If  clustered  locking  is  enabled, this indicates whether this Volume Group is shared with other nodes in the cluster or whether it contains only local disks that are not visible on the
              other nodes.  If the cluster infrastructure is unavailable on a particular node at a particular time, you may still be able to use Volume Groups that are not marked as clustered.

       --detachprofile
              Detach any metadata configuration profiles attached to given Volume Groups. See lvm.conf(5) for more information about metadata profiles.

       -u, --uuid
              Generate new random UUID for specified Volume Groups.

       --monitor {y|n}
              Start or stop monitoring a mirrored or snapshot logical volume with dmeventd, if it is installed.  If a device used by a monitored mirror reports an I/O  error,  the  failure  is  handled
              according to mirror_image_fault_policy and mirror_log_fault_policy set in lvm.conf(5).

       --poll {y|n}
              Without  polling  a logical volume's backgrounded transformation process will never complete.  If there is an incomplete pvmove or lvconvert (for example, on rebooting after a crash), use
              --poll y to restart the process from its last checkpoint.  However, it may not be appropriate to immediately poll a logical volume when it is activated, use --poll n  to  defer  and  then
              --poll y to restart the process.

       --sysinit
              Indicates  that vgchange(8) is being invoked from early system initialisation scripts (e.g. rc.sysinit or an initrd), before writeable filesystems are available. As such, some functional‐
              ity needs to be disabled and this option acts as a shortcut which selects an appropriate set of options. Currently this is equivalent to using --ignorelockingfailure,  --ignoremonitoring,
              --poll n and setting LVM_SUPPRESS_LOCKING_FAILURE_MESSAGES environment variable.

              If  --sysinit  is  used in conjunction with lvmetad(8) enabled and running, autoactivation is preferred over manual activation via direct vgchange call.  Logical volumes are autoactivated
              according to auto_activation_volume_list set in lvm.conf(5).

       --noudevsync
              Disable udev synchronisation. The process will not wait for notification from udev.  It will continue irrespective of any possible udev processing in the background.  You should only  use
              this if udev is not running or has rules that ignore the devices LVM2 creates.

       --ignoremonitoring
              Make no attempt to interact with dmeventd unless --monitor is specified.  Do not use this if dmeventd is already monitoring a device.

       --lock-start
              Start the lockspace of a shared VG in lvmlockd.  lvmlockd locks becomes available for the VG, allowing LVM to use the VG.  See lvmlockd(8).

       --lock-stop
              Stop the lockspace of a shared VG in lvmlockd.  lvmlockd locks become unavailable for the VG, preventing LVM from using the VG.  See lvmlockd(8).

       --lock-type LockType
              Change the VG lock type to or from a shared lock type used with lvmlockd.  See lvmlockd(8).

       -l, --logicalvolume MaxLogicalVolumes
              Changes the maximum logical volume number of an existing inactive volume group.

       -p, --maxphysicalvolumes MaxPhysicalVolumes
              Changes  the maximum number of physical volumes that can belong to this volume group.  For volume groups with metadata in lvm1 format, the limit is 255.  If the metadata uses lvm2 format,
              the value 0 removes this restriction: there is then no limit.  If you have a large number of physical volumes in a volume group with metadata in lvm2 format, for tool performance reasons,
              you should consider some use of --pvmetadatacopies 0 as described in pvcreate(8), and/or use --vgmetadatacopies.

       --metadataprofile ProfileName
              Uses  and  attaches  ProfileName configuration profile to the volume group metadata. Whenever the volume group is processed next time, the profile is automatically applied. The profile is
              inherited by all logical volumes in the volume group unless the logical volume itself has its own profile attached. See lvm.conf(5) for more information about metadata profiles.

       --[vg]metadatacopies NumberOfCopies|unmanaged|all
              Sets the desired number of metadata copies in the volume group.  If set to a non-zero value, LVM will automatically manage the 'metadataignore' flags on the physical volumes (see pvchange
              or  pvcreate  --metadataignore)  in order to achieve NumberOfCopies copies of metadata.  If set to unmanaged, LVM will not automatically manage the 'metadataignore' flags.  If set to all,
              LVM will first clear all of the 'metadataignore' flags on all metadata areas in the volume group, then set the value to unmanaged.  The vgmetadatacopies option is useful for volume groups
              containing large numbers of physical volumes with metadata as it may be used to minimize metadata read and write overhead.

       -s, --physicalextentsize PhysicalExtentSize[BbBsSkKmMgGtTpPeE]
              Changes  the  physical  extent  size on physical volumes of this volume group.  A size suffix (k for kilobytes up to t for terabytes) is optional, megabytes is the default if no suffix is
              present.  For LVM2 format, the value must be a power of 2 of at least 1 sector (where the sector size is the largest sector size of the PVs currently used in the VG) or, if not a power of
              2, at least 128KiB.  For the older LVM1 format, it must be a power of 2 of at least 8KiB.  The default is 4 MiB.

              Before increasing the physical extent size, you might need to use lvresize, pvresize and/or pvmove so that everything fits.  For example, every contiguous range of extents used in a logi‐
              cal volume must start and end on an extent boundary.

              If the volume group metadata uses lvm1 format, extents can vary in size from 8KiB to 16GiB and there is a limit of 65534 extents in each logical volume.  The default of 4 MiB leads  to  a
              maximum logical volume size of around 256GiB.

              If  the  volume group metadata uses lvm2 format those restrictions do not apply, but having a large number of extents will slow down the tools but have no impact on I/O performance to the
              logical volume.  The smallest PE is 1KiB.

              The 2.4 kernel has a limitation of 2TiB per block device.

       --systemid SystemID
              Changes the system ID of the VG.  Using this option requires caution because the VG may become foreign to the host running the command, leaving the host unable to access it.  See  lvmsys‐
              temid(7).

       --refresh
              If  any  logical  volume  in  the volume group is active, reload its metadata.  This is not necessary in normal operation, but may be useful if something has gone wrong or if you're doing
              clustering manually without a clustered lock manager.

       -x, --resizeable {y|n}
              Enables or disables the extension/reduction of this volume group with/by physical volumes.

Examples
       To activate all known volume groups in the system:

       vgchange -a y

       To change the maximum number of logical volumes of inactive volume group vg00 to 128.

       vgchange -l 128 /dev/vg00

SEE ALSO
       lvchange(8), lvm(8), vgcreate(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                        VGCHANGE(8)
