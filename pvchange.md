PVCHANGE(8)                             System Manager's Manual                            PVCHANGE(8)

NAME
       pvchange - Change attributes of physical volume(s)

SYNOPSIS
       pvchange option_args position_args
           [ option_args ]

DESCRIPTION
       pvchange changes PV attributes in the VG.

       For options listed in parentheses, any one is required, after which the others are optional.

USAGE
       Change properties of all PVs.

       pvchange
           ( -x|--allocatable y|n,
             -u|--uuid,
             -a|--all,
                --addtag Tag,
                --deltag Tag,
                --metadataignore y|n )
           [ COMMON_OPTIONS ]

       Change properties of specified PVs.

       pvchange
           ( -x|--allocatable y|n,
             -u|--uuid,
                --addtag Tag,
                --deltag Tag,
                --metadataignore y|n )
            PV|Select ...
           [ -S|--select String ]
           [ COMMON_OPTIONS ]

       Common options for command:
           [ -A|--autobackup y|n ]
           [ -f|--force ]
           [ -u|--uuid ]
           [    --reportformat basic|json ]

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
       --addtag Tag
              Adds a tag to a PV, VG or LV. This option can be repeated to add multiple tags at once.
              See lvm(8) for information about tags.

       -a|--all
              Change all visible PVs.

       -x|--allocatable y|n
              Enable or disable allocation of physical extents on this PV.

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

       --metadataignore y|n
              Specifies the metadataignore property of a PV.  If yes, metadata areas on the PV are ig‐
              nored, and lvm will not store metadata in the metadata areas of the PV.  If no, lvm will
              store metadata on the PV.

       --nolocking
              Disable locking.

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

       -u|--uuid
              Generate new random UUID for specified PVs.

       -v|--verbose ...
              Set verbose level. Repeat from 1 to 4 times to increase the detail of messages sent to
              stdout and stderr.

       --version
              Display version information.

       -y|--yes
              Do not prompt for confirmation interactively but always assume the answer yes. Use with
              extreme caution.  (For automatic no, see -qq.)

VARIABLES
       PV
              Physical Volume name, a device path under /dev.  For commands managing physical extents,
              a PV positional arg generally accepts a suffix indicating a range (or  multiple  ranges)
              of physical extents (PEs). When the first PE is omitted, it defaults to the start of the
              device, and when the last PE is omitted it defaults to end.  Start and end range (inclu‐
              sive): PV[:PE-PE]...  Start and length range (counting from 0): PV[:PE+PE]...

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
       Disallow the allocation of physical extents on a PV (e.g. because of disk errors, or because it
       will be removed after freeing it).
       pvchange -x n /dev/sdk1

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

Red Hat, Inc.                      LVM TOOLS 2.03.02(2) (2018-12-18)                       PVCHANGE(8)
