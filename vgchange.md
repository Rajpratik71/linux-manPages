VGCHANGE(8)                             System Manager's Manual                            VGCHANGE(8)

NAME
       vgchange - Change volume group attributes

SYNOPSIS
       vgchange option_args position_args
           [ option_args ]
           [ position_args ]

        -a|--activate y|n|ay
           --activationmode partial|degraded|complete
           --addtag Tag
           --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit
        -A|--autobackup y|n
           --commandprofile String
           --config String
        -d|--debug
           --deltag Tag
           --detachprofile
           --driverloaded y|n
        -f|--force
        -h|--help
        -K|--ignoreactivationskip
           --ignorelockingfailure
           --ignoremonitoring
           --lockopt String
           --lockstart
           --lockstop
           --locktype sanlock|dlm|none
        -l|--logicalvolume Number
           --longhelp
        -p|--maxphysicalvolumes Number
           --metadataprofile String
           --monitor y|n
           --nolocking
           --noudevsync
        -P|--partial
        -s|--physicalextentsize Size[m|UNIT]
           --poll y|n
           --profile String
           --pvmetadatacopies 0|1|2
        -q|--quiet
           --readonly
           --refresh
           --reportformat basic|json
        -x|--resizeable y|n
        -S|--select String
           --sysinit
           --systemid String
        -t|--test
        -u|--uuid
        -v|--verbose
           --version
           --[vg]metadatacopies all|unmanaged|Number
        -y|--yes

DESCRIPTION
       vgchange  changes VG attributes, changes LV activation in the kernel, and includes other utili‐
       ties for VG maintenance.

USAGE
       Change a general VG attribute.
       For options listed in parentheses, any one is
       required, after which the others are optional.

       vgchange
           ( -l|--logicalvolume Number,
             -p|--maxphysicalvolumes Number,
             -u|--uuid,
             -s|--physicalextentsize Size[m|UNIT],
             -x|--resizeable y|n,
                --addtag Tag,
                --deltag Tag,
                --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit,
                --pvmetadatacopies 0|1|2,
                --[vg]metadatacopies all|unmanaged|Number,
                --profile String,
                --detachprofile,
                --metadataprofile String )
           [ -A|--autobackup y|n ]
           [ -S|--select String ]
           [ -f|--force ]
           [    --poll y|n ]
           [    --ignoremonitoring ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ VG|Tag|Select ... ]
       -

       Start or stop monitoring LVs from dmeventd.

       vgchange --monitor y|n
           [ -A|--autobackup y|n ]
           [ -S|--select String ]
           [ -f|--force ]
           [    --sysinit ]
           [    --ignorelockingfailure ]
           [    --poll y|n ]
           [    --ignoremonitoring ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ VG|Tag|Select ... ]
       -

       Start or stop processing LV conversions.

       vgchange --poll y|n
           [ -A|--autobackup y|n ]
           [ -S|--select String ]
           [ -f|--force ]
           [    --ignorelockingfailure ]
           [    --ignoremonitoring ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ VG|Tag|Select ... ]
       -

       Activate or deactivate LVs.

       vgchange -a|--activate y|n|ay
           [ -K|--ignoreactivationskip ]
           [ -P|--partial ]
           [ -A|--autobackup y|n ]
           [ -S|--select String ]
           [ -f|--force ]
           [    --activationmode partial|degraded|complete ]
           [    --sysinit ]
           [    --readonly ]
           [    --ignorelockingfailure ]
           [    --monitor y|n ]
           [    --poll y|n ]
           [    --ignoremonitoring ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ VG|Tag|Select ... ]
       -

       Reactivate LVs using the latest metadata.

       vgchange --refresh
           [ -A|--autobackup y|n ]
           [ -S|--select String ]
           [ -f|--force ]
           [    --sysinit ]
           [    --ignorelockingfailure ]
           [    --poll y|n ]
           [    --ignoremonitoring ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]
           [ VG|Tag|Select ... ]
       -

       Change the system ID of a VG.

       vgchange --systemid String VG
           [ COMMON_OPTIONS ]
       -

       Start the lockspace of a shared VG in lvmlockd.

       vgchange --lockstart
           [ -S|--select String ]
           [ COMMON_OPTIONS ]
           [ VG|Tag|Select ... ]
       -

       Stop the lockspace of a shared VG in lvmlockd.

       vgchange --lockstop
           [ -S|--select String ]
           [ COMMON_OPTIONS ]
           [ VG|Tag|Select ... ]
       -

       Change the lock type for a shared VG.

       vgchange --locktype sanlock|dlm|none VG
           [ COMMON_OPTIONS ]
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
              Change the active state of LVs.  An active LV can be used through a block device, allow‐
              ing data on the LV to be accessed.  y makes LVs active, or available.  n makes LVs inac‐
              tive, or unavailable.  The block device for the LV is added or removed from the system
              using device-mapper in the kernel.  A symbolic link /dev/VGName/LVName pointing to the
              device node is also added/removed.  All software and scripts should access the device
              through the symbolic link and present this as the name of the device.  The location and
              name of the underlying device node may depend on the distribution, configuration (e.g.
              udev), or release version.  ay specifies autoactivation, in which case an LV is acti‐
              vated only if it matches an item in lvm.conf activation/auto_activation_volume_list.  If
              the list is not set, all LVs are considered to match, and if if the list is set but
              empty, no LVs match.  Autoactivation should be used during system boot to make it possi‐
              ble to select which LVs should be automatically activated by the system.  See lvm‐
              lockd(8) for more information about activation options ey and sy for shared VGs.

       --activationmode partial|degraded|complete
              Determines if LV activation is allowed when PVs are missing, e.g. because of a device
              failure.  complete only allows LVs with no missing PVs to be activated, and is the most
              restrictive mode.  degraded allows RAID LVs with missing PVs to be activated.  (This
              does not include the "mirror" type, see "raid1" instead.)  partial allows any LV with
              missing PVs to be activated, and should only be used for recovery or repair.  For de‐
              fault, see lvm.conf/activation_mode.  See lvmraid(7) for more information.

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

       --commandprofile String
              The command profile to use for command configuration.  See lvm.conf(5) for more informa‐
              tion about profiles.

       --config String
              Config settings for the command. These override lvm.conf settings.  The String arg uses
              the same format as lvm.conf, or may use section/field syntax.  See lvm.conf(5) for more
              information about config.

       -d|--debug ...
              Set debug level. Repeat from 1 to 6 times to increase the detail of messages sent to the
              log file and/or syslog (if configured).

       --deltag Tag
              Deletes a tag from a PV, VG or LV. This option can be repeated to delete multiple tags
              at once. See lvm(8) for information about tags.

       --detachprofile
              Detaches a metadata profile from a VG or LV.  See lvm.conf(5) for more information about
              profiles.

       --driverloaded y|n
              If set to no, the command will not attempt to use device-mapper.  For testing and debug‐
              ging.

       -f|--force ...
              Override various checks, confirmations and protections.  Use with extreme caution.

       -h|--help
              Display help text.

       -K|--ignoreactivationskip
              Ignore the "activation skip" LV flag during activation to allow LVs with the flag set to
              be activated.

       --ignorelockingfailure
              Allows a command to continue with read-only metadata operations after locking failures.

       --ignoremonitoring
              Do not interact with dmeventd unless --monitor is specified.  Do not use this if
              dmeventd is already monitoring a device.

       --lockopt String
              Used to pass options for special cases to lvmlockd.  See lvmlockd(8) for more informa‐
              tion.

       --lockstart
              Start the lockspace of a shared VG in lvmlockd.  lvmlockd locks becomes available for
              the VG, allowing LVM to use the VG.  See lvmlockd(8) for more information.

       --lockstop
              Stop the lockspace of a shared VG in lvmlockd.  lvmlockd locks become unavailable for
              the VG, preventing LVM from using the VG.  See lvmlockd(8) for more information.

       --locktype sanlock|dlm|none
              Change the VG lock type to or from a shared lock type used with lvmlockd.  See lvm‐
              lockd(8) for more information.

       -l|--logicalvolume Number
              Sets the maximum number of LVs allowed in a VG.

       --longhelp
              Display long help text.

       -p|--maxphysicalvolumes Number
              Sets the maximum number of PVs that can belong to the VG.  The value 0 removes any limi‐
              tation.  For large numbers of PVs, also see options --pvmetadatacopies, and --vgmetadat‐
              acopies for improving performance.

       --metadataprofile String
              The metadata profile to use for command configuration.  See lvm.conf(5) for more infor‐
              mation about profiles.

       --monitor y|n
              Start (yes) or stop (no) monitoring an LV with dmeventd.  dmeventd monitors kernel
              events for an LV, and performs automated maintenance for the LV in reponse to specific
              events.  See dmeventd(8) for more information.

       --nolocking
              Disable locking.

       --noudevsync
              Disables udev synchronisation. The process will not wait for notification from udev. It
              will continue irrespective of any possible udev processing in the background. Only use
              this if udev is not running or has rules that ignore the devices LVM creates.

       -P|--partial
              Commands will do their best to activate LVs with missing PV extents.  Missing extents
              may be replaced with error or zero segments according to the lvm.conf miss‐
              ing_stripe_filler setting.  Metadata may not be changed with this option.

       -s|--physicalextentsize Size[m|UNIT]
              Sets the physical extent size of PVs in the VG.  The value must be either a power of 2
              of at least 1 sector (where the sector size is the largest sector size of the PVs cur‐
              rently used in the VG), or at least 128KiB.  Once this value has been set, it is diffi‐
              cult to change without recreating the VG, unless no extents need moving.  Before in‐
              creasing the physical extent size, you might need to use lvresize, pvresize and/or pv‐
              move so that everything fits. For example, every contiguous range of extents used in a
              LV must start and end on an extent boundary.

       --poll y|n
              When yes, start the background transformation of an LV.  An incomplete transformation,
              e.g. pvmove or lvconvert interrupted by reboot or crash, can be restarted from the last
              checkpoint with --poll y.  When no, background transformation of an LV will not occur,
              and the transformation will not complete. It may not be appropriate to immediately poll
              an LV after activation, in which case --poll n can be used to defer polling until a
              later --poll y command.

       --profile String
              An alias for --commandprofile or --metadataprofile, depending on the command.

       --pvmetadatacopies 0|1|2
              The number of metadata areas to set aside on a PV for storing VG metadata.  When 2, one
              copy of the VG metadata is stored at the front of the PV and a second copy is stored at
              the end.  When 1, one copy of the VG metadata is stored at the front of the PV (starting
              in the 5th sector).  When 0, no copies of the VG metadata are stored on the given PV.
              This may be useful in VGs containing many PVs (this places limitations on the ability to
              use vgsplit later.)

       -q|--quiet ...
              Suppress output and log messages. Overrides --debug and --verbose.  Repeat once to also
              suppress any prompts with answer 'no'.

       --readonly
              Run the command in a special read-only mode which will read on-disk metadata without
              needing to take any locks. This can be used to peek inside metadata used by a virtual
              machine image while the virtual machine is running. No attempt will be made to communi‐
              cate with the device-mapper kernel driver, so this option is unable to report whether or
              not LVs are actually in use.

       --refresh
              If the LV is active, reload its metadata.  This is not necessary in normal operation,
              but may be useful if something has gone wrong, or if some form of manual LV sharing is
              being used.

       --reportformat basic|json
              Overrides current output format for reports which is defined globally by the report/out‐
              put_format setting in lvm.conf.  basic is the original format with columns and rows.  If
              there is more than one report per command, each report is prefixed with the report name
              for identification. json produces report output in JSON format. See lvmreport(7) for
              more information.

       -x|--resizeable y|n
              Enables or disables the addition or removal of PVs to/from a VG (by vgextend/vgreduce).

       -S|--select String
              Select objects for processing and reporting based on specified criteria.  The criteria
              syntax is described by --select help and lvmreport(7).  For reporting commands, one row
              is displayed for each object matching the criteria.  See --options help for selectable
              object fields.  Rows can be displayed with an additional "selected" field (-o selected)
              showing 1 if the row matches the selection and 0 otherwise.  For non-reporting commands
              which process LVM entities, the selection is used to choose items to process.

       --sysinit
              Indicates that vgchange/lvchange is being invoked from early system initialisation
              scripts (e.g. rc.sysinit or an initrd), before writable filesystems are available. As
              such, some functionality needs to be disabled and this option acts as a shortcut which
              selects an appropriate set of options. Currently, this is equivalent to using --ignore‐
              lockingfailure, --ignoremonitoring, --poll n, and setting env var LVM_SUPPRESS_LOCK‐
              ING_FAILURE_MESSAGES.  vgchange/lvchange skip autoactivation, and defer to pvscan au‐
              toactivation.

       --systemid String
              Changes the system ID of the VG.  Using this option requires caution because the VG may
              become foreign to the host running the command, leaving the host unable to access it.
              See lvmsystemid(7) for more information.

       -t|--test
              Run in test mode. Commands will not update metadata.  This is implemented by disabling
              all metadata writing but nevertheless returning success to the calling function. This
              may lead to unusual error messages in multi-stage operations if a tool relies on reading
              back metadata it believes has changed but hasn't.

       -u|--uuid
              Generate new random UUID for specified VGs.

       -v|--verbose ...
              Set verbose level. Repeat from 1 to 4 times to increase the detail of messages sent to
              stdout and stderr.

       --version
              Display version information.

       --[vg]metadatacopies all|unmanaged|Number
              Number of copies of the VG metadata that are kept.  VG metadata is kept in VG metadata
              areas on PVs in the VG, i.e. reserved space at the start and/or end of the PVs.  Keeping
              a copy of the VG metadata on every PV can reduce performance in VGs containing a large
              number of PVs.  When this number is set to a non-zero value, LVM will automatically
              choose PVs on which to store metadata, using the metadataignore flags on PVs to achieve
              the specified number.  The number can also be replaced with special string values: un‐
              managed causes LVM to not automatically manage the PV metadataignore flags.  all causes
              LVM to first clear the metadataignore flags on all PVs, and then to become unmanaged.

       -y|--yes
              Do not prompt for confirmation interactively but always assume the answer yes. Use with
              extreme caution.  (For automatic no, see -qq.)

VARIABLES
       VG
              Volume Group name.  See lvm(8) for valid names.

       Tag
              Tag name.  See lvm(8) for information about tag names and using tags in place of  a  VG,
              LV or PV.

       Select
              Select indicates that a required positional parameter can be omitted if the --select op‐
              tion is used.  No arg appears in this position.

       String
              See the option description for information about the string content.

       Size[UNIT]
              Size is an input number that accepts an optional unit.  Input units are  always  treated
              as  base  two values, regardless of capitalization, e.g. 'k' and 'K' both refer to 1024.
              The default input unit is specified by letter, followed by |UNIT.  UNIT represents other
              possible  input units: bBsSkKmMgGtTpPeE.  b|B is bytes, s|S is sectors of 512 bytes, k|K
              is kilobytes, m|M is megabytes, g|G is gigabytes, t|T is terabytes,  p|P  is  petabytes,
              e|E  is  exabytes.   (This should not be confused with the output control --units, where
              capital letters mean multiple of 1000.)

ENVIRONMENT VARIABLES
       See lvm(8) for information about environment variables used by lvm.  For  example,  LVM_VG_NAME
       can generally be substituted for a required VG parameter.

NOTES
       If  vgchange  recognizes  COW  snapshot LVs that were dropped because they ran out of space, it
       displays a message informing the administrator that the snapshots should be removed.

EXAMPLES
       Activate all LVs in all VGs on all existing devices.
       vgchange -a y

       Change the maximum number of LVs for an inactive VG.
       vgchange -l 128 vg00

SEE ALSO
       lvm(8) lvm.conf(5) lvmconfig(8)

       pvchange(8) pvck(8) pvcreate(8) pvdisplay(8) pvmove(8) pvremove(8) pvresize(8) pvs(8) pvscan(8)

       vgcfgbackup(8) vgcfgrestore(8) vgchange(8) vgck(8) vgcreate(8) vgconvert(8) vgdisplay(8)  vgex‐
       port(8)  vgextend(8)  vgimport(8)  vgimportclone(8)  vgmerge(8)  vgmknodes(8) vgreduce(8) vgre‐
       move(8) vgrename(8) vgs(8) vgscan(8) vgsplit(8)

       lvcreate(8) lvchange(8) lvconvert(8) lvdisplay(8)  lvextend(8)  lvreduce(8)  lvremove(8)  lvre‐
       name(8) lvresize(8) lvs(8) lvscan(8)

       lvm-fullreport(8) lvm-lvpoll(8) lvm2-activation-generator(8) blkdeactivate(8) lvmdump(8)

       dmeventd(8) lvmpolld(8) lvmlockd(8) lvmlockctl(8) cmirrord(8) lvmdbusd(8)

       lvmsystemid(7) lvmreport(7) lvmraid(7) lvmthin(7) lvmcache(7)

Red Hat, Inc.                      LVM TOOLS 2.03.02(2) (2018-12-18)                       VGCHANGE(8)
