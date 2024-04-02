MPATHCONF(8)                                                                             Linux Administrator's Manual                                                                            MPATHCONF(8)



NAME
       mpathconf - A tool for configuring device-mapper-multipath

SYNOPSIS
       mpathconf [commands] [options]

DESCRIPTION
       mpathconf is a utility that creates or modifies /etc/multipath.conf.  It can enable or disable multipathing and configure some common options.  mpathconf can also load the dm_multipath module, start
       and stop the multipathd daemon, and configure the multipathd service to start automatically or not. If mpathconf is called with no commands, it will display the current configuration, but  will  not
       create or modify /etc/multipath.conf

       The default options for mpathconf are --with_module The --with_multipathd option is not set by default.  Enabling multipathing will load the dm_multipath module but it will not immediately start it.
       This is so that users can manually edit their config file if necessary, before starting multipathd.

       If /etc/multipath.conf already exists, mpathconf will edit it. If it does not exist, mpathconf will use /usr/share/doc/device-mapper-multipath-0.4.9/multipath.conf as the starting  file.  This  file
       has  user_friendly_names set. If this file does not exist, mpathconf will create /etc/multipath.conf from scratch.  For most users, this means that user_friendly_names will be set by default, unless
       they use the --user_friendly_names n command.

COMMANDS
       --enable
              Removes any line that blacklists all device nodes from the /etc/multipath.conf blacklist section. Also, creates /etc/multipath.conf if it doesn't exist.

       --disable
              Adds a line that blacklists all device nodes to the /etc/multipath.conf blacklist section. If no blacklist section exists, it will create one.

       --allow <device>
              Modifies the /etc/multipath/conf blacklist to blacklist all wwids and the blacklist_exceptions to whitelist <device>. <device> can be in the form of MAJOR:MINOR, a wwid,  or  the  name  of  a
              device-mapper  device,  either  a multipath device, or any device on stacked on top of one or more multipath devices. This command can be used multiple times to allow multiple devices.  NOTE:
              This action will create a configuration file that mpathconf will not be able to revert back to its previous state. Because of this, --outfile is required when using --allow.

       --user_friendly_name  { y | n }
              If set to y, this adds the line user_friendly_names yes to the /etc/multipath.conf defaults section. If set to n, this removes the line, if present. This command can be used  along  with  any
              other command.

       --find_multipaths { y | n }
              If set to y, this adds the line find_multipaths yes to the /etc/multipath.conf defaults section. If set to n, this removes the line, if present. This command can be used aldong with any other
              command.

       --outfile <filename>
              Write the resulting multipath configuration to <filename> instead of /etc/multipath.conf.

OPTIONS
       --with_module { y | n }
              If set to y, this runs modprobe dm_multipath to install the multipath modules. This option only works with the --enable command. This option is set to y by default.

       --with_multipathd { y | n }
              If set to y, this runs service multipathd start to start the multipathd daemon on --enable, service multipathd stop to stop the multipathd daemon on --disable, and service  multipathd  reload
              to reconfigure multipathd on --user_frindly_names and --find_multipaths.  This option is set to n by default.

FILES
       /etc/multipath.conf

SEE ALSO
       multipath.conf(5), modprobe(8), multipath(8), multipathd(8), service(8),

AUTHOR
       Benjamin Marzinski <bmarzins@redhat.com>



                                                                                                  June 2010                                                                                      MPATHCONF(8)
