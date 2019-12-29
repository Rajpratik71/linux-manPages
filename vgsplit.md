VGSPLIT(8)                              System Manager's Manual                             VGSPLIT(8)

NAME
       vgsplit - Move physical volumes into a new or existing volume group

SYNOPSIS
       vgsplit option_args position_args
           [ option_args ]

DESCRIPTION
       vgsplit  moves  one  or more PVs from a source VG to a destination VG. The PVs can be specified
       explicitly or implicitly by naming an LV, in which case on PVs underlying the LV are moved.

       If the destination VG does not exist, a new VG is created (command options can be used to spec‐
       ify properties of the new VG, also see vgcreate(8).)

       LVs  cannot be split between VGs; each LV must be entirely on the PVs in the source or destina‐
       tion VG.

       vgsplit can only move complete PVs. (See pvmove(8) for moving part of a PV.)

USAGE
       Split a VG by specified PVs.

       vgsplit VG VG PV ...
           [ COMMON_OPTIONS ]

       Split a VG by PVs in a specified LV.

       vgsplit -n|--name LV VG VG
           [ COMMON_OPTIONS ]

       Common options for command:
           [ -A|--autobackup y|n ]
           [ -l|--maxlogicalvolumes Number ]
           [ -p|--maxphysicalvolumes Number ]
           [ -M|--metadatatype lvm2 ]
           [    --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit ]
           [    --[vg]metadatacopies all|unmanaged|Number ]

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

       --driverloaded y|n
              If set to no, the command will not attempt to use device-mapper.  For testing and debug‐
              ging.

       -h|--help
              Display help text.

       --lockopt String
              Used to pass options for special cases to lvmlockd.  See lvmlockd(8) for more informa‐
              tion.

       --longhelp
              Display long help text.

       -l|--maxlogicalvolumes Number
              Sets the maximum number of LVs allowed in a VG.

       -p|--maxphysicalvolumes Number
              Sets the maximum number of PVs that can belong to the VG.  The value 0 removes any limi‐
              tation.  For large numbers of PVs, also see options --pvmetadatacopies, and --vgmetadat‐
              acopies for improving performance.

       -M|--metadatatype lvm2
              Specifies the type of on-disk metadata to use.  lvm2 (or just 2) is the current, stan‐
              dard format.  lvm1 (or just 1) is no longer used.

       -n|--name String
              Move only PVs used by the named LV.

       --nolocking
              Disable locking.

       --profile String
              An alias for --commandprofile or --metadataprofile, depending on the command.

       -q|--quiet ...
              Suppress output and log messages. Overrides --debug and --verbose.  Repeat once to also
              suppress any prompts with answer 'no'.

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

Red Hat, Inc.                      LVM TOOLS 2.03.02(2) (2018-12-18)                        VGSPLIT(8)
