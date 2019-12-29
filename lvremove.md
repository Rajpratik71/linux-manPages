LVREMOVE(8)                             System Manager's Manual                            LVREMOVE(8)

NAME
       lvremove - Remove logical volume(s) from the system

SYNOPSIS
       lvremove position_args
           [ option_args ]

DESCRIPTION
       lvremove  removes one or more LVs. For standard LVs, this returns the logical extents that were
       used by the LV to the VG for use by other LVs.

       Confirmation will be requested before deactivating any active LV prior to removal.  LVs  cannot
       be deactivated or removed while they are open (e.g.  if they contain a mounted filesystem). Re‐
       moving an origin LV will also remove all dependent snapshots.

       When a single force option is used, LVs are removed without confirmation, and the command  will
       try to deactivate unused LVs.

       To remove damaged LVs, two force options may be required (-ff).

       Historical LVs

       If  the  configuration  setting metadata/record_lvs_history is enabled and the LV being removed
       forms part of the history of at least one LV that is still present, then a simplified represen‐
       tation of the LV will be retained. This includes the time of removal (lv_time_removed reporting
       field), creation time (lv_time), name (lv_name), LV uuid (lv_uuid) and VG name (vg_name).  This
       allows  later reporting to see the ancestry chain of thin snapshot volumes, even after some in‐
       termediate LVs have been removed. The names of such historical LVs acquire a hyphen as a prefix
       (e.g. '-lvol1') and cannot be reactivated.  Use lvremove a second time, with the hyphen, to re‐
       move the record of the former LV completely.

USAGE
       lvremove VG|LV|Tag|Select ...
           [ -A|--autobackup y|n ]
           [ -f|--force ]
           [ -S|--select String ]
           [    --nohistory ]
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

       -f|--force ...
              Override various checks, confirmations and protections.  Use with extreme caution.

       -h|--help
              Display help text.

       --lockopt String
              Used to pass options for special cases to lvmlockd.  See lvmlockd(8) for more informa‐
              tion.

       --longhelp
              Display long help text.

       --nohistory
              Do not record history of LVs being removed.  This has no effect unless the configuration
              setting metadata/record_lvs_history is enabled.

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

       -S|--select String
              Select objects for processing and reporting based on specified criteria.  The criteria
              syntax is described by --select help and lvmreport(7).  For reporting commands, one row
              is displayed for each object matching the criteria.  See --options help for selectable
              object fields.  Rows can be displayed with an additional "selected" field (-o selected)
              showing 1 if the row matches the selection and 0 otherwise.  For non-reporting commands
              which process LVM entities, the selection is used to choose items to process.

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
       VG
              Volume Group name.  See lvm(8) for valid names.

       LV
              Logical  Volume  name.   See lvm(8) for valid names.  An LV positional arg generally in‐
              cludes the VG name and LV name, e.g. VG/LV.

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

EXAMPLES
       Remove an active LV without asking for confirmation.
       lvremove -f vg00/lvol1

       Remove all LVs the specified VG.
       lvremove vg00

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

Red Hat, Inc.                      LVM TOOLS 2.03.02(2) (2018-12-18)                       LVREMOVE(8)
