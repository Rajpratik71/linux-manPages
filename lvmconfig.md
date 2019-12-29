LVMCONFIG(8)                            System Manager's Manual                           LVMCONFIG(8)

NAME
       lvmconfig - Display and manipulate configuration information

SYNOPSIS
       lvmconfig
           [ option_args ]
           [ position_args ]

DESCRIPTION
       lvmconfig,  lvm  config,  lvm  dumpconfig (for compatibility reasons, to be phased out) produce
       formatted output from the LVM configuration tree. The sources of the configuration data include
       lvm.conf(5) and command line settings from --config.

USAGE
       lvmconfig
           [ -f|--file String ]
           [ -l|--list ]
           [    --atversion String ]
           [    --typeconfig current|default|diff|full|list|missing|new|profilable|profilable-com‐
           mand|profilable-metadata ]
           [    --ignoreadvanced ]
           [    --ignoreunsupported ]
           [    --ignorelocal ]
           [    --mergedconfig ]
           [    --metadataprofile String ]
           [    --sinceversion String ]
           [    --showdeprecated ]
           [    --showunsupported ]
           [    --validate ]
           [    --withsummary ]
           [    --withcomments ]
           [    --withgeneralpreamble ]
           [    --withlocalpreamble ]
           [    --withspaces ]
           [    --unconfigured ]
           [    --withversions ]
           [ COMMON_OPTIONS ]
           [ String ... ]

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
       --atversion String
              Specify an LVM version in x.y.z format where x is the major version, the y is the minor
              version and z is the patchlevel (e.g. 2.2.106).  When configuration is displayed, the
              configuration settings recognized at this LVM version will be considered only. This can
              be used to display a configuration that a certain LVM version understands and which does
              not contain any newer settings for which LVM would issue a warning message when checking
              the configuration.

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

       -f|--file String
              Write output to the named file.

       -h|--help
              Display help text.

       --ignoreadvanced
              Exclude advanced configuration settings from the output.

       --ignorelocal
              Ignore the local section. The local section should be defined in the lvmlocal.conf file,
              and should contain config settings specific to the local host which should not be copied
              to other hosts.

       --ignoreunsupported
              Exclude unsupported configuration settings from the output. These settings are either
              used for debugging and development purposes only or their support is not yet complete
              and they are not meant to be used in production. The current and diff types include un‐
              supported settings in their output by default, all the other types ignore unsupported
              settings.

       -l|--list
              List config settings with summarizing comment. This is the same as using options --type‐
              config list --withsummary.

       --lockopt String
              Used to pass options for special cases to lvmlockd.  See lvmlockd(8) for more informa‐
              tion.

       --longhelp
              Display long help text.

       --mergedconfig
              When the command is run with --config and/or --commandprofile (or using LVM_COMMAND_PRO‐
              FILE environment variable), --profile, or --metadataprofile, merge all the contents of
              the "config cascade" before displaying it.  Without merging, only the configuration at
              the front of the cascade is displayed.  See lvm.conf(5) for more information about con‐
              fig.

       --metadataprofile String
              The metadata profile to use for command configuration.  See lvm.conf(5) for more infor‐
              mation about profiles.

       --nolocking
              Disable locking.

       --profile String
              An alias for --commandprofile or --metadataprofile, depending on the command.

       -q|--quiet ...
              Suppress output and log messages. Overrides --debug and --verbose.  Repeat once to also
              suppress any prompts with answer 'no'.

       --showdeprecated
              Include deprecated configuration settings in the output. These settings are deprecated
              after a certain version. If a concrete version is specified with --atversion, deprecated
              settings are automatically included if the specified version is lower than the version
              in which the settings were deprecated. The current and diff types include deprecated
              settings in their output by default, all the other types ignore deprecated settings.

       --showunsupported
              Include unsupported configuration settings in the output. These settings are either used
              for debugging or development purposes only, or their support is not yet complete and
              they are not meant to be used in production. The current and diff types include unsup‐
              ported settings in their output by default, all the other types ignore unsupported set‐
              tings.

       --sinceversion String
              Specify an LVM version in x.y.z format where x is the major version, the y is the minor
              version and z is the patchlevel (e.g. 2.2.106).  This option is currently applicable
              only with --typeconfig new to display all configuration settings introduced since given
              version.

       -t|--test
              Run in test mode. Commands will not update metadata.  This is implemented by disabling
              all metadata writing but nevertheless returning success to the calling function. This
              may lead to unusual error messages in multi-stage operations if a tool relies on reading
              back metadata it believes has changed but hasn't.

       --typeconfig current|default|diff|full|list|missing|new|profilable|profilable-command|profil‐
              able-metadata
              current prints the config settings that would be applied to an lvm command (assuming the
              command does not override them on the command line.) This includes: settings that have
              been modified in lvm config files, settings that get their default values from config
              files, and default settings that have been uncommented in config files.  default prints
              all settings with their default values.  Changes made in lvm config files are not re‐
              flected in the output.  Some settings get their default values internally, and these
              settings are printed as comments.  Other settings get their default values from config
              files, and these settings are not printed as comments.  diff prints only config settings
              that have been modified from their default values in config files (the difference be‐
              tween current and default.)  full prints every setting uncommented and set to the cur‐
              rent value, i.e. how it would be used by an lvm command.  This includes settings modi‐
              fied in config files, settings that usually get defaults internally, and settings that
              get defaults from config files.  list prints all config names without values.  missing
              prints settings that are missing from the lvm config files. A missing setting that usu‐
              ally gets its default from config files is printed uncommented and set to the internal
              default.  Settings that get their default internally and are not set in config files are
              printed commented with the internal default.  new prints config settings that have been
              added since the lvm version specified by --sinceversion. They are printed with their de‐
              fault values.  profilable prints settings with their default values that can be set from
              a profile.  profilable-command prints settings with their default values that can be set
              from a command profile.  profilable-metadata prints settings with their default values
              that can be set from a metadata profile.  Also see lvm.conf(5).

       --unconfigured
              Internal option used for generating config file during build.

       --validate
              Validate current configuration used and exit with appropriate return code. The valida‐
              tion is done only for the configuration at the front of the "config cascade". To vali‐
              date the whole merged configuration tree, also use --mergedconfig.  The validation is
              done even if lvm.conf config/checks is disabled.

       -v|--verbose ...
              Set verbose level. Repeat from 1 to 4 times to increase the detail of messages sent to
              stdout and stderr.

       --version
              Display version information.

       --withcomments
              Display a full comment for each configuration node. For deprecated settings, also dis‐
              play comments about deprecation.

       --withgeneralpreamble
              Include general config file preamble.

       --withlocalpreamble
              Include local config file preamble.

       --withspaces
              Where appropriate, add more spaces in output for better readability.

       --withsummary
              Display a one line comment for each configuration node.

       --withversions
              Also display a comment containing the version of introduction for each configuration
              node. If the setting is deprecated, also display the version since which it is depre‐
              cated.

       -y|--yes
              Do not prompt for confirmation interactively but always assume the answer yes. Use with
              extreme caution.  (For automatic no, see -qq.)

VARIABLES
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

Red Hat, Inc.                      LVM TOOLS 2.03.02(2) (2018-12-18)                      LVMCONFIG(8)
