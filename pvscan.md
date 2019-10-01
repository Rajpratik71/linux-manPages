PVSCAN(8)                                                                                  System Manager's Manual                                                                                  PVSCAN(8)



NAME
       pvscan - List all physical volumes

SYNOPSIS
       pvscan option_args
           [ option_args ]
           [ position_args ]

DESCRIPTION
       pvscan scans all supported LVM block devices in the system for PVs.

       Scanning with lvmetad

       pvscan operates differently when used with the lvmetad(8) daemon.

       Scanning  disks  is  required  to read LVM metadata and identify LVM PVs.  Once read, lvmetad caches the metadata so that LVM commands can read it without repeatedly scanning disks.  This is helpful
       because scanning disks is time consuming, and frequent scanning may interfere with the normal work of the system and disks.

       When lvmetad is not used, LVM commands revert to scanning disks to read metadata.  Any LVM command that needs metadata will scan disks for it; running the pvscan command is  not  necessary  for  the
       sake of other LVM commands.

       When  lvmetad  is  used, LVM commands avoid scanning disks by reading metadata from lvmetad.  When new disks appear, they must be scanned so their metadata can be cached in lvmetad.  This is done by
       the command pvscan --cache, which scans disks and passes the metadata to lvmetad.

       The pvscan --cache command is typically run automatically by system services when a new device appears.  Users do not generally need to run this command if the system and lvmetad are  running  prop‐
       erly.

       Many  scripts  contain unnecessary pvscan (or vgscan) commands for historical reasons.  To avoid disrupting the system with extraneous disk scanning, an ordinary pvscan (without --cache) will simply
       read metadata from lvmetad like other LVM commands.  It does not do anything beyond displaying the current state of the cache.

       · When given specific device name arguments, pvscan --cache will only read the named devices.

       · LVM udev rules and systemd services are used to initiate automatic device scanning.

       · To prevent devices from being scanned by pvscan --cache, add them to lvm.conf(5) devices/global_filter.  The devices/filter setting does not apply to system level scanning.  For more  information,
         see:
         lvmconfig --withcomments devices/global_filter

       · If lvmetad is started or restarted after devices are visible, or if the global_filter has changed, then all devices must be rescanned for metadata with the command pvscan --cache.

       · lvmetad does not cache older metadata formats, e.g. lvm1, and will be temporarily disabled if they are seen.

       · To notify lvmetad about a device that is no longer present, the major and minor numbers must be given, not the path.

       Automatic activation

       When event-driven system services detect a new LVM device, the first step is to automatically scan and cache the metadata from the device.  This is done by pvscan --cache.  A second step is to auto‐
       matically activate LVs that are present on the new device.  This auto-activation is done by the same pvscan --cache command when the option --activate ay is included.

       Auto-activation of VGs or LVs can be enabled/disabled using:
       lvm.conf(5) activation/auto_activation_volume_list

       For more information, see:
       lvmconfig --withcomments activation/auto_activation_volume_list

       When this setting is undefined, all LVs are auto-activated (when lvm is fully integrated with the event-driven system services.)

       When a VG or LV is not auto-activated, traditional activation using vgchange or lvchange --activate is needed.

       · pvscan auto-activation can be only done in combination with --cache.

       · Auto-activation is designated by the "a" argument in --activate ay.  This is meant to distinguish system generated commands from explicit user commands, although it can be used in  any  activation
         command.  Whenever it is used, the auto_activation_volume_list is applied.

       · Auto-activation is not yet supported for LVs that are part of partial or clustered volume groups.

USAGE
       Display PV information.

       pvscan
           [ -e|--exported ]
           [ -n|--novolumegroup ]
           [ -s|--short ]
           [ -u|--uuid ]
           [ COMMON_OPTIONS ]

       Populate the lvmetad cache by scanning PVs.

       pvscan --cache
           [ -b|--background ]
           [ -a|--activate ay ]
           [ -j|--major Number ]
           [    --minor Number ]
           [ COMMON_OPTIONS ]
           [ String|PV ... ]

       Common options for command:
           [    --ignorelockingfailure ]
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
           [    --profile String ]
           [    --version ]

OPTIONS
       -a|--activate y|n|ay
              Auto-activate LVs in a VG when the PVs scanned have completed the VG.  (Only ay is applicable.)

       -b|--background
              If the operation requires polling, this option causes the command to return before the operation is complete, and polling is done in the background.

       --cache
              Scan one or more devices and send the metadata to lvmetad.

       --commandprofile String
              The command profile to use for command configuration.  See lvm.conf(5) for more information about profiles.

       --config String
              Config settings for the command. These override lvm.conf settings.  The String arg uses the same format as lvm.conf, or may use section/field syntax.  See lvm.conf(5) for more information
              about config.

       -d|--debug ...
              Set debug level. Repeat from 1 to 6 times to increase the detail of messages sent to the log file and/or syslog (if configured).

       --driverloaded y|n
              If set to no, the command will not attempt to use device-mapper.  For testing and debugging.

       -e|--exported
              Only show PVs belonging to exported VGs.

       -h|--help
              Display help text.

       --ignorelockingfailure
              Allows a command to continue with read-only metadata operations after locking failures.

       --lockopt String
              Used to pass options for special cases to lvmlockd.  See lvmlockd(8) for more information.

       --longhelp
              Display long help text.

       -j|--major Number
              The major number of a device.

       --minor Number
              The minor number of a device.

       -n|--novolumegroup
              Only show PVs not belonging to any VG.

       --profile String
              An alias for --commandprofile or --metadataprofile, depending on the command.

       -q|--quiet ...
              Suppress output and log messages. Overrides --debug and --verbose.  Repeat once to also suppress any prompts with answer 'no'.

       --reportformat basic|json
              Overrides current output format for reports which is defined globally by the report/output_format setting in lvm.conf.  basic is the original format with columns and rows.  If there is more
              than one report per command, each report is prefixed with the report name for identification. json produces report output in JSON format. See lvmreport(7) for more information.

       -s|--short
              Short listing format.

       -t|--test
              Run in test mode. Commands will not update metadata.  This is implemented by disabling all metadata writing but nevertheless returning success to the calling function. This may lead to
              unusual error messages in multi-stage operations if a tool relies on reading back metadata it believes has changed but hasn't.

       -u|--uuid
              Show UUIDs in addition to device names.

       -v|--verbose ...
              Set verbose level. Repeat from 1 to 4 times to increase the detail of messages sent to stdout and stderr.

       --version
              Display version information.

       -y|--yes
              Do not prompt for confirmation interactively but always assume the answer yes. Use with extreme caution.  (For automatic no, see -qq.)

VARIABLES
       PV
              Physical Volume name, a device path under /dev.  For commands managing physical extents, a PV positional arg generally accepts a suffix indicating a range (or  multiple  ranges)  of  physical
              extents (PEs). When the first PE is omitted, it defaults to the start of the device, and when the last PE is omitted it defaults to end.  Start and end range (inclusive): PV[:PE-PE]...  Start
              and length range (counting from 0): PV[:PE+PE]...

       String
              See the option description for information about the string content.

       Size[UNIT]
              Size is an input number that accepts an optional unit.  Input units are always treated as base two values, regardless of capitalization, e.g. 'k' and 'K' both  refer  to  1024.   The  default
              input  unit  is  specified  by  letter,  followed by |UNIT.  UNIT represents other possible input units: bBsSkKmMgGtTpPeE.  b|B is bytes, s|S is sectors of 512 bytes, k|K is kilobytes, m|M is
              megabytes, g|G is gigabytes, t|T is terabytes, p|P is petabytes, e|E is exabytes.  (This should not be confused with the output control --units, where capital letters mean multiple of 1000.)

ENVIRONMENT VARIABLES
       See lvm(8) for information about environment variables used by lvm.  For example, LVM_VG_NAME can generally be substituted for a required VG parameter.

SEE ALSO
       lvm(8) lvm.conf(5) lvmconfig(8)

       pvchange(8) pvck(8) pvcreate(8) pvdisplay(8) pvmove(8) pvremove(8) pvresize(8) pvs(8) pvscan(8)

       vgcfgbackup(8) vgcfgrestore(8) vgchange(8) vgck(8) vgcreate(8) vgconvert(8)  vgdisplay(8)  vgexport(8)  vgextend(8)  vgimport(8)  vgimportclone(8)  vgmerge(8)  vgmknodes(8)  vgreduce(8)  vgremove(8)
       vgrename(8) vgs(8) vgscan(8) vgsplit(8)

       lvcreate(8) lvchange(8) lvconvert(8) lvdisplay(8) lvextend(8) lvreduce(8) lvremove(8) lvrename(8) lvresize(8) lvs(8) lvscan(8)

       lvm-fullreport(8) lvm-lvpoll(8) lvm2-activation-generator(8) blkdeactivate(8) lvmdump(8)

       dmeventd(8) lvmetad(8) lvmpolld(8) lvmlockd(8) lvmlockctl(8) clvmd(8) cmirrord(8) lvmdbusd(8)

       lvmsystemid(7) lvmreport(7) lvmraid(7) lvmthin(7) lvmcache(7)



Red Hat, Inc.                                                                      LVM TOOLS 2.02.185(2)-RHEL7 (2019-05-13)                                                                         PVSCAN(8)
