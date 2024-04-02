SOSREPORT(1)                                                                               General Commands Manual                                                                               SOSREPORT(1)



NAME
       sosreport - Collect and package diagnostic and support data

SYNOPSIS
       sosreport
                 [-l|--list-plugins]
                 [-n|--skip-plugins plugin-names]
                 [-e|--enable-plugins plugin-names]
                 [-o|--only-plugins plugin-names]
                 [-a|--alloptions] [-v|--verbose]
                 [-k plug.opt|--plugin-option plug.opt]
                 [--no-report] [--config-file conf]
                 [--preset preset] [--add-preset add_preset]
                 [--del-preset del_preset] [--desc description]
                 [--batch] [--build] [--debug] [--dry-run]
                 [--label label] [--case-id id] [--ticket-number nr]
                 [--threads threads]
                 [--plugin-timeout TIMEOUT]
                 [-s|--sysroot SYSROOT]
                 [-c|--chroot {auto|always|never}
                 [--tmp-dir directory]
                 [-p|--profile profile-name]
                 [--list-profiles]
                 [--verify]
                 [--log-size]
                 [--all-logs]
                 [-z|--compression-type method]
                 [--encrypt-key KEY]
                 [--encrypt-pass PASS]
                 [--experimental]
                 [-h|--help]


DESCRIPTION
       sosreport  generates  an archive of configuration and diagnostic information from the running system. The archive may be stored locally or centrally for recording or tracking purposes or may be sent
       to technical support representatives, developers or system administrators to assist with technical fault-finding and debugging.

       Sos is modular in design and is able to collect data from a wide range of subsystems and packages that may be installed. An XML or HTML report summarizing the  collected  information  is  optionally
       generated and stored within the archive.

OPTIONS
       -l, --list-plugins
              List all available plugins and their options. Plug-ins that would not be enabled by the current configuration are listed separately.

       -n, --skip-plugins PLUGNAME[,PLUGNAME]
              Disable the specified plugin(s). Multiple plug-ins may be specified by repeating the option or as a comma-separated list.

       -e, --enable-plugins PLUGNAME[,PLUGNAME]
              Enable the specified plugin(s). Multiple plug-ins may be specified by repeating the option or as a comma-separated list.

       -o, --only-plugins PLUGNAME[,PLUGNAME]
              Enable the specified plugin(s) only (all other plugins should be disabled). Multiple plugins may be specified by repeating the option or as a comma-separated list.

       -k PLUGNAME.PLUGOPT[=VALUE], --plugin-option=PLUGNAME.PLUGOPT[=VALUE]
              Specify plug-in options. The option PLUGOPT is enabled, or set to the specified value in the plug-in PLUGNAME.

       -a, --alloptions
              Set all boolean options to True for all enabled plug-ins.

       -v, --verbose
              Increase logging verbosity. May be specified multiple times to enable additional debugging messages.

       -q, --quiet
              Only log fatal errors to stderr.

       --no-report
              Disable HTML/XML report writing.

       --config-file CONFIG
              Specify alternate configuration file.

       --preset PRESET
              Specify an existing preset to use for sos options.

              Presets  are pre-configured sets of options for both sos and sos plugins. For example a preset may enable a certain set of plugins, disable others, or enable specific plugin options. They may
              also specify sos options such as log-size or package verification.

              User defined presets are saved under /var/lib/sos/presets as JSON-formatted files.

       --add-preset ADD_PRESET [options]
              Add a preset with name ADD_PRESET that enables [options] when called.

              For example, 'sosreport --add-preset mypreset --log-size=50 -n logs' will enable a user to run 'sosreport --preset mypreset' that sets the maximum log size to 50 and disables the logs plugin.

              Note: to set a description for the preset that is displayed with --list-presets use the --desc option.

       --del-preset DEL_PRESET
              Deletes the preset with name DEL_PRESET from the filesystem so that it can no longer be used.

       --list-presets
              Display a list of available presets and what options they carry.

       --desc DESCRIPTION
              When using --add-preset use this option to add a description of the preset that will be displayed when using --list-presets.

       -s, --sysroot SYSROOT
              Specify an alternate root file system path. Useful for collecting reports from containers and images.

       -c, --chroot {auto|always|never}
              Set the chroot mode. When --sysroot is used commands default to executing with SYSROOT as the root directory (unless disabled by a specific plugin). This can be overriden by setting  --chroot
              to "always" (always chroot) or "never" (always run in the host namespace).

       --tmp-dir DIRECTORY
              Specify alternate temporary directory to copy data as well as the compressed report.

       --list-profiles
              Display a list of available profiles and the plugins that they enable.

       -p, --profile NAME
              Only  run  plugins  that correspond to the given profile. Multple profiles may be specified as a comma-separated list; the set of plugins executed is the union of each of the profile's plugin
              sets. Currently defined profiles include: boot, cluster, desktop, debug, hardware, identity, network, openstack, packagemanager, security, services,  storage,  sysmgmt,  system,  performance,
              virt, and webserver.

       --verify
              Instructs  plugins  to perform plugin-specific verification during data collection. This may include package manager verification, log integrity testing or other plugin defined behaviour. Use
              of --verify may cause the time taken to generate a report to be considerably longer.

       --log-size
              Places a global limit on the size (in MiB) of any collected set of logs. The limit is applied separately for each set of logs collected by any plugin.

       --all-logs
              Tell plugins to collect all possible log data ignoring any size limits and including logs in non-default locations. This option may significantly increase the size of reports.

       -z, --compression-type METHOD
              Override the default compression type specified by the active policy.

       --encrypt-key KEY
              Encrypts the resulting archive that sosreport produces using GPG. KEY must be an existing key in the user's keyring as GPG does not allow for keyfiles.  KEY can be any value accepted by gpg's
              'recipient' option.

              Note  that the user running sosreport must match the user owning the keyring from which keys will be obtained. In particular this means that if sudo is used to run sosreport, the keyring must
              also be set up using sudo (or direct shell access to the account).

              Users should be aware that encrypting the final archive will result in sos using double the amount of temporary disk space - the encrypted archive must be written as a separate,  rather  than
              replacement,  file  within  the temp directory that sos writes the archive to. However, since the encrypted archive will be the same size as the original archive, there is no additional space
              consumption once the temporary directory is removed at the end of execution.

              This means that only the encrypted archive is present on disk after sos finishes running.

              If encryption fails for any reason, the original unencrypted archive is preserved instead.

       --encrypt-pass PASS
              The same as --encrypt-key, but use the provided PASS for symmetric encryption rather than key-pair encryption.

       --batch
              Generate archive without prompting for interactive input.

       --name NAME
              Deprecated. See --label

       --label LABEL
              Specify an arbitrary identifier to associate with the archive.  Labels will be appended after the system's short hostname and may contain alphanumeric characters.

       --threads THREADS
              Specify the number of threads sosreport will use for concurrency. Defaults to 4.

       --plugin-timeout TIMEOUT
              Specify a timeout in seconds to allow each plugin to run for. A value of 0 means no timeout will be set.

              Note that this options sets the timeout for all plugins. If you want to set a timeout for a specific plugin, use the 'timeout' plugin option available to all plugins  -  e.g.  '-k  logs.time‐
              out=600'.

              The plugin-specific timeout option will override this option. For example, using ´--plugin-timeout=60 -k logs.timeout=600´ will set a timeout of 600 seconds for the logs plugin and 60 seconds
              for all other enabled plugins.

       --case-id NUMBER
              Specify a case identifier to associate with the archive.  Identifiers may include alphanumeric characters, commas and periods ('.').  Synonymous with --ticket-number.

       --ticket-number NUMBER
              Specify a ticket number or other identifier to associate with the archive.  Identifiers may include alphanumeric characters, commas and periods ('.').  Synonymous with --case-id.

       --build
              Do not archive copied data. Causes sosreport to leave an uncompressed archive as a temporary file or directory tree.

       --debug
              Enable interactive debugging using the python debugger. Exceptions in sos or plug-in code will cause a trap to the pdb shell.

       --dry-run
              Execute plugins as normal, but do not collect any file content, command output, or string data from the system. The resulting logs may be used to understand the actions that  sos  would  have
              taken without the dry run option.

       --experimental
              Enable plugins marked as experimental. Experimental plugins may not have been tested for this port or may still be under active development.

       --help Display usage message.

MAINTAINER
       Bryn M. Reeves <bmr@redhat.com>

AUTHORS & CONTRIBUTORS
       See AUTHORS file in the package documentation.

TRANSLATIONS
       Translations are handled by transifex (https://fedorahosted.org/transifex/)



                                                                                               Mon Mar 25 2013                                                                                   SOSREPORT(1)
