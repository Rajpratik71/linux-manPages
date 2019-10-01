TEAMDCTL(8)                                                                                     teamd control                                                                                     TEAMDCTL(8)



NAME
       teamdctl — team daemon control tool

SYNOPSIS
       teamdctl [options] team_device command [command_args...]
       teamdctl -h

DESCRIPTION
       teamdctl is a tool that allows a user to interact with a running teamd instance.  It defaults to using Unix Domain Sockets, but will fall back to using the D-Bus API, to ensure reliable operation in
       all environments.

OPTIONS
       -h, --help
              Print help text to console and exit.

       -v, --verbosity
              Increase output verbosity.

       -o, --oneline
              Force output to one line if possible.

       -D, --force-dbus
              Force to use D-Bus interface.

       -Z address, --force-zmq address
              Force to use ZMQ interface. Possible address formats are "tcp://ip:port", "ipc://path" and others. Detailed description of ZMQ library is in page http://zguide.zeromq.org/page:all.

       -U, --force-usock
              Force to use UNIX domain socket interface. This is the default behavior.

COMMAND
       config dump
              Dumps teamd JSON config.

       config dump noports
              Dumps teamd JSON configuration without "ports" section included.

       config dump actual
              Dumps teamd actual JSON configuration. It includes ports which are currently present.

       state dump | state
              Dumps teamd JSON state document.

       state view
              Prints out state of teamd parsed from JSON state document.

       state item get state_item_path
              Finds state item in JSON state document and returns its value.

              If PORTIFNAME in state_item_path has any sensitive character, use double quotation marks to escape it, like: ports."eth1.1".link_watches.up. To process state_item_path of 'state item set'  is
              the same as here.

       state item set state_item_path value
              Finds state item in JSON state document and sets its value by value parameter. This is available only for a limited number of paths:

              setup.debug_level — User can set debug level. Higher level is more verbose.

              ports.PORTIFNAME.runner.aggregator.selected — This is available for lacp runner. User can manually select the aggregator.

              runner.active_port — This is available for activebackup runner. User can manually select the active port.

       port add portdev
              Takes port device name as argument. Adds port device into team.

       port remove portdev
              Takes port device name as argument. Removes port device from team.

       port present portdev
              Takes port device name as argument. Checks if the port device is present in team.

       port config update portdev portconfig-string
              Takes port device name as the first argument and JSON format configuration string as the second argument. Updates port device configuration.

       port config dump portdev
              Takes port device name as the first argument. Dumps port device JSON configuration to standard output.

SEE ALSO
       teamd(8), teamnl(8), teamd.conf(5)

AUTHOR
       Jiri Pirko is the original author and current maintainer of libteam.



libteam                                                                                           2013-05-24                                                                                      TEAMDCTL(8)
