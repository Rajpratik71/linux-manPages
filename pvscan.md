PVSCAN(8)                               System Manager's Manual                              PVSCAN(8)

NAME
       pvscan - List all physical volumes

SYNOPSIS
       pvscan option_args
           [ option_args ]
           [ position_args ]

DESCRIPTION
       When  called  without the --cache option, pvscan lists PVs on the system, like pvs(8) or pvdis‐
       play(8).

       When the --cache and -aay options are used, pvscan records which PVs are available on the  sys‐
       tem,  and  activates LVs in completed VGs.  A VG is complete when pvscan sees that the final PV
       in the VG has appeared.  This is used by event-based system startup (systemd, udev) to activate
       LVs.

       The four main variations of this are:

       pvscan --cache device

       If  device  is  present,  lvm  adds a record that the PV on device is online.  If device is not
       present, lvm removes the online record for the PV.  In most cases, the pvscan  will  only  read
       the named devices.

       pvscan --cache -aay device...

       This  begins  by performing the same steps as above.  Afterward, if the VG for the specified PV
       is complete, then pvscan will activate LVs in the VG (the same as vgchange  -aay  vgname  would
       do.)

       pvscan --cache

       This  first clears all existing PV online records, then scans all devices on the system, adding
       PV online records for any PVs that are found.

       pvscan --cache -aay

       This begins by performing the same steps as pvscan --cache.  Afterward, it activates LVs in any
       complete VGs.

       To  prevent  devices  from  being  scanned  by  pvscan  --cache,  add  them  to lvm.conf(5) de‐
       vices/global_filter.  For more information, see:
       lvmconfig --withcomments devices/global_filter

       Auto-activation of VGs or LVs can be enabled/disabled using:
       lvm.conf(5) activation/auto_activation_volume_list

       For more information, see:
       lvmconfig --withcomments activation/auto_activation_volume_list

       To disable auto-activation, explicitly set this  list  to  an  empty  list,  i.e.  auto_activa‐
       tion_volume_list = [ ].

       When this setting is undefined (e.g. commented), then all LVs are auto-activated.

USAGE
       Display PV information.

       pvscan
           [ -e|--exported ]
           [ -n|--novolumegroup ]
           [ -s|--short ]
           [ -u|--uuid ]
           [ COMMON_OPTIONS ]

       Autoactivate a VG when all PVs are online.

       pvscan --cache
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
           [    --nolocking ]
           [    --profile String ]
           [    --version ]

OPTIONS
       -a|--activate y|n|ay
              Auto-activate LVs in a VG when the PVs scanned have completed the VG.  (Only ay is ap‐
              plicable.)

       --cache
              Scan one or more devices and record that they are online.

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

       -e|--exported
              Only show PVs belonging to exported VGs.

       -h|--help
              Display help text.

       --ignorelockingfailure
              Allows a command to continue with read-only metadata operations after locking failures.

       --lockopt String
              Used to pass options for special cases to lvmlockd.  See lvmlockd(8) for more informa‐
              tion.

       --longhelp
              Display long help text.

       -j|--major Number
              The major number of a device.

       --minor Number
              The minor number of a device.

       --nolocking
              Disable locking.

       -n|--novolumegroup
              Only show PVs not belonging to any VG.

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

       -s|--short
              Short listing format.

       -t|--test
              Run in test mode. Commands will not update metadata.  This is implemented by disabling
              all metadata writing but nevertheless returning success to the calling function. This
              may lead to unusual error messages in multi-stage operations if a tool relies on reading
              back metadata it believes has changed but hasn't.

       -u|--uuid
              Show UUIDs in addition to device names.

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
              a  PV  positional arg generally accepts a suffix indicating a range (or multiple ranges)
              of physical extents (PEs). When the first PE is omitted, it defaults to the start of the
              device, and when the last PE is omitted it defaults to end.  Start and end range (inclu‐
              sive): PV[:PE-PE]...  Start and length range (counting from 0): PV[:PE+PE]...

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

Red Hat, Inc.                      LVM TOOLS 2.03.02(2) (2018-12-18)                         PVSCAN(8)
