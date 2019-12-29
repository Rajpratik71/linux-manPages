LVREDUCE(8)                             System Manager's Manual                            LVREDUCE(8)

NAME
       lvreduce - Reduce the size of a logical volume

SYNOPSIS
       lvreduce option_args position_args
           [ option_args ]

DESCRIPTION
       lvreduce reduces the size of an LV. The freed logical extents are returned to the VG to be used
       by other LVs. A copy-on-write snapshot LV can also be reduced if less space is needed  to  hold
       COW blocks. Use lvconvert(8) to change the number of data images in a RAID or mirrored LV.

       Be  careful  when  reducing an LV's size, because data in the reduced area is lost. Ensure that
       any file system on the LV is resized before running lvreduce so that the  removed  extents  are
       not in use by the file system.

       Sizes  will  be  rounded  if necessary. For example, the LV size must be an exact number of ex‐
       tents, and the size of a striped segment must be a multiple of the number of stripes.

       In the usage section below, --size Size can be replaced with --extents Number.   See  both  de‐
       scriptions the options section.

USAGE
       lvreduce -L|--size [-]Size[m|UNIT] LV
           [ -l|--extents [-]Number[PERCENT] ]
           [ -A|--autobackup y|n ]
           [ -f|--force ]
           [ -n|--nofsck ]
           [ -r|--resizefs ]
           [    --noudevsync ]
           [    --reportformat basic|json ]
           [ COMMON_OPTIONS ]

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

       --driverloaded y|n
              If set to no, the command will not attempt to use device-mapper.  For testing and debug‐
              ging.

       -l|--extents [-]Number[PERCENT]
              Specifies the new size of the LV in logical extents.  The --size and --extents options
              are alternate methods of specifying size.  The total number of physical extents used
              will be greater when redundant data is needed for RAID levels.  An alternate syntax al‐
              lows the size to be determined indirectly as a percentage of the size of a related VG,
              LV, or set of PVs. The suffix %VG denotes the total size of the VG, the suffix %FREE the
              remaining free space in the VG, and the suffix %PVS the free space in the specified PVs.
              For a snapshot, the size can be expressed as a percentage of the total size of the ori‐
              gin LV with the suffix %ORIGIN (100%ORIGIN provides space for the whole origin).  When
              expressed as a percentage, the size defines an upper limit for the number of logical ex‐
              tents in the new LV. The precise number of logical extents in the new LV is not deter‐
              mined until the command has completed.  When the plus + or minus - prefix is used, the
              value is not an absolute size, but is relative and added or subtracted from the current
              size.

       -f|--force ...
              Override various checks, confirmations and protections.  Use with extreme caution.

       -h|--help
              Display help text.

       --lockopt String
              Used to pass options for special cases to lvmlockd.  See lvmlockd(8) for more informa‐
              tion.

       --longhelp
              Display long help text.

       -n|--nofsck
              Do not perform fsck before resizing filesystem when filesystem requires it. You may need
              to use --force to proceed with this option.

       --nolocking
              Disable locking.

       --noudevsync
              Disables udev synchronisation. The process will not wait for notification from udev. It
              will continue irrespective of any possible udev processing in the background. Only use
              this if udev is not running or has rules that ignore the devices LVM creates.

       --profile String
              An alias for --commandprofile or --metadataprofile, depending on the command.

       -q|--quiet ...
              Suppress output and log messages. Overrides --debug and --verbose.  Repeat once to also
              suppress any prompts with answer 'no'.

       --reportformat basic|json
              Overrides current output format for reports which is defined globally by the report/out‐
              put_format setting in lvm.conf.  basic is the original format with columns and rows.  If
              there is more than one report per command, each report is prefixed with the report name
              for identification. json produces report output in JSON format. See lvmreport(7) for
              more information.

       -r|--resizefs
              Resize underlying filesystem together with the LV using fsadm(8).

       -L|--size [-]Size[m|UNIT]
              Specifies the new size of the LV.  The --size and --extents options are alternate meth‐
              ods of specifying size.  The total number of physical extents used will be greater when
              redundant data is needed for RAID levels.  When the plus + or minus - prefix is used,
              the value is not an absolute size, but is relative and added or subtracted from the cur‐
              rent size.

       -t|--test
              Run in test mode. Commands will not update metadata.  This is implemented by disabling
              all metadata writing but nevertheless returning success to the calling function. This
              may lead to unusual error messages in multi-stage operations if a tool relies on reading
              back metadata it believes has changed but hasn't.

       -v|--verbose ...
              Set verbose level. Repeat from 1 to 4 times to increase the detail of messages sent to
              stdout and stderr.

       --version
              Display version information.

       -y|--yes
              Do not prompt for confirmation interactively but always assume the answer yes. Use with
              extreme caution.  (For automatic no, see -qq.)

VARIABLES
       LV
              Logical  Volume  name.   See lvm(8) for valid names.  An LV positional arg generally in‐
              cludes the VG name and LV name, e.g. VG/LV.

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

EXAMPLES
       Reduce the size of an LV by 3 logical extents:
       lvreduce -l -3 vg00/lvol1

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

Red Hat, Inc.                      LVM TOOLS 2.03.02(2) (2018-12-18)                       LVREDUCE(8)
