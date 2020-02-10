LVMCONFIG(8)                                                                                                                                                                                 LVMCONFIG(8)

NAME
       lvmconfig, lvm dumpconfig, lvm config — Display LVM configuration

SYNOPSIS
       lvmconfig  [-f|--file  filename]  [--type  {current|default|diff|full|list|missing|new|profilable|profilable-command|profilable-metadata} [--atversion version] [--ignoreadvanced] [--ignoreunsup‐
       ported] [--ignorelocal] [-l|--list] [--config ConfigurationString] [--commandprofile ProfileName] [--profile  ProfileName]  [--metadataprofile  ProfileName]  [--mergedconfig]  [--showdeprecated]
       [--showunsupported] [--validate] [--withsummary] [--withcomments] [--withspaces] [--withversions] [ConfigurationNode...]

DESCRIPTION
       lvmconfig produces formatted output from the LVM configuration tree.  The command was added in release 2.02.119 and has an identical longer form lvm dumpconfig.

OPTIONS
       -f, --file filename
              Send output to a file named 'filename'.

       -l, --list
              List configuration settings with summarizing comment. This is the same as using lvmconfig --type list --withsummary.

       --type {current|default|diff|full|missing|new|profilable|profilable-command|profilable-metadata}
              Select  the  type  of configuration to display. The configuration settings displayed have either default values or currently-used values assigned based on the type selected. If no type is
              selected, --type current is used by default. Whenever a configuration setting with a default value is commented out, it means the setting does not have any concrete default value defined.
              Output can be saved and used as a proper lvm.conf(5) file.

              current
                 Display the current lvm.conf configuration merged with any tag config if used. See also lvm.conf(5) for more info about LVM configuration methods.

              default
                 Display all possible configuration settings with default values assigned.

              diff
                 Display  all  configuration  settings  for which the values used differ from defaults.  The value assigned for each configuration setting is the value currently used.  This is actually
                 minimal LVM configuration which can be used without a change to current configured behaviour.

              full
                 Display full configuration tree - a combination of current configuration tree (--type current) and tree of settings for which default values are used (--type missing). This is  exactly
                 the configuration tree that LVM2 uses during command execution. Using this type also implies the use of --mergedconfig option. If comments are displayed (see --withcomments and --with‐
                 summary options), then for each setting found in existing configuration and for which defaults are not used, there's an extra comment line printed to denote this.

              list
                 Display plain list of configuration settings.

              missing
                 Display all configuration settings with default values assigned which are missing in the configuration currently used and for which LVM automatically fallbacks to using  these  default
                 values.

              new
                 Display all new configuration settings introduced in current LVM version or specific version as defined by --atversion option.

              profilable
                 Display all profilable configuration settings with default values assigned.  See lvm.conf(5) for more info about profile config method.

              profilable-command
                 Display all profilable configuration settings with default values assigned that can be used in command profile. This is a subset of settings displayed by --type --profilable.

              profilable-metadata
                 Display all profilable configuration settings with default values assigned that can be used in metadata profile. This is a subset of settings displayed by --type --profilable.

       --atversion version
              Specify an LVM version in x.y.z format where x is the major version, the y is the minor version and z is the patchlevel (e.g. 2.2.106).  When configuration is displayed, the configuration
              settings recognized at this LVM version will be considered only. This can be used to display a configuration that a certain LVM version understands and which does not  contain  any  newer
              settings for which LVM would issue a warning message when checking the configuration.

       --ignoreadvanced
              Exclude advanced configuration settings from the output.

       --ignoreunsupported
              Exclude  unsupported  configuration  settings from the output. These settings are either used for debugging and development purposes only or their support is not yet complete and they are
              not meant to be used in production. The current and diff types include unsupported settings in their output by default, all the other types ignore unsupported settings.

       --ignorelocal
              Ignore local section.

       --config ConfigurationString
              Use ConfigurationString to override existing configuration.  This configuration is then applied for the lvmconfig command itself.  See also lvm.conf(5) for more info about config cascade.

       --commandprofile ProfileName
              Use ProfileName to override existing configuration.  This configuration is then applied for the lvmconfig command itself.  See also --mergedconfig option and  lvm.conf(5)  for  more  info
              about config cascade.

       --profile ProfileName
              The same as using --commandprofile but the configuration is not applied for the lvmconfig command itself.

       --metadataprofile ProfileName
              Use  ProfileName  to  override  existing configuration.  The configuration defined in metadata profile has no effect for the lvmconfig command itself. lvmconfig displays the configuration
              only.  See also --mergedconfig option and lvm.conf(5) for more info about config cascade.

       --mergedconfig
              When the lvmconfig command is run with the --config option and/or --commandprofile (or using LVM_COMMAND_PROFILE environment variable), --profile, --metadataprofile option, merge all  the
              contents of the config cascade before displaying it.  Without the --mergeconfig option used, only the configuration at the front of the cascade is displayed. See also lvm.conf(5) for more
              info about config cascade.

       --showdeprecated
              Include deprecated configuration settings in the output. These settings are always deprecated since certain version. If concrete version is specified with --atversion  option,  deprecated
              settings  are automatically included if specified version is lower that the version in which the settings were deprecated. The current and diff types include deprecated settings int their
              output by default, all the other types ignore deprecated settings.

       --showunsupported
              Include unsupported configuration settings in the output. These settings are either used for debugging or development purposes only or their support is not yet complete and they  are  not
              meant to be used in production. The current and diff types include unsupported settings in their output by default, all the other types ignore unsupported settings.

       --validate
              Validate  current  configuration  used  and  exit with appropriate return code. The validation is done only for the configuration at the front of the config cascade. To validate the whole
              merged configuration tree, use also the --mergedconfig option.  The validation is done even if config/checks lvm.conf(5) option is disabled.

       --withsummary
              Display a one line comment for each configuration node.

       --withcomments
              Display a full comment for each configuration node. For deprecated settings, also display comments about deprecation in addition.

       --withspaces
              Where appropriate, add more spaces in output for better readability.

       --withversions
              Also display a comment containing the version of introduction for each configuration node. If the setting is deprecated, also display the version since which it is deprecated.

SEE ALSO
       lvm(8) lvmconf(8) lvm.conf(5)

Red Hat, Inc                                                                        LVM TOOLS 2.02.133(2) (2015-10-30)                                                                       LVMCONFIG(8)
