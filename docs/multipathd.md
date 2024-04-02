MULTIPATHD(8)                                                                              System Manager's Manual                                                                              MULTIPATHD(8)



NAME
       multipathd - Multipath daemon.

SYNOPSIS
       multipathd [-d|-k] [-s] [-v verbosity] [-B] [-n]

DESCRIPTION
       The  multipathd  daemon  is in charge of checking for failed paths. When this happens, it will reconfigure the multipath map the path belongs to, so that this map regains its maximum performance and
       redundancy.

       This daemon executes the external multipath tool when events occur.  In turn, the multipath tool signals the multipathd daemon when it is done with devmap reconfiguration, so that it can refresh its
       failed path list.

OPTIONS
       -d     Foreground Mode. Don't daemonize, and print all messages to stdout and stderr.

       -s     Suppress timestamps. Do not prefix logging messages with a timestamp.

       -v level
              Verbosity level. Print additional information while running multipathd. A  level of 0 means only print errors. A level of 3 or greater prints debugging information as well.

       -B     Read-only bindings file. multipathd will not write to the user_friendly_names bindings file. If a user_friendly_name doesn't already exist for a device, it will use its WWID as its alias.

       -k     multipathd will enter interactive mode. From this mode, the available commands can be viewed by entering 'help'. When you are finished entering commands, press CTRL-D to quit.

       -n     Ignore new devices. multipathd will not create a multipath device unless the WWID for the device is already listed in the WWIDs file.

COMMANDS
       The following commands can be used in interactive mode:

       list|show paths
              Show the paths that multipathd is monitoring, and their state.

       list|show paths format $format
              Show the paths that multipathd is monitoring, using a format string with path format wildcards.

       list|show maps|multipaths
              Show the multipath devices that the multipathd is monitoring.

       list|show maps|multipaths format $format
              Show the status of all multipath devices that the multipathd is monitoring, using a format string with multipath format wildcards.

       list|show maps|multipaths status
              Show the status of all multipath devices that the multipathd is monitoring.

       list|show maps|multipaths stats
              Show some statistics of all multipath devices that the multipathd is monitoring.

       list|show maps|multipaths topology
              Show the current multipath topology. Same as 'multipath -ll'.

       list|show topology
              Show the current multipath topology. Same as 'multipath -ll'.

       list|show map|multipath $map topology
              Show topology of a single multipath device specified by $map, for example 36005076303ffc56200000000000010aa. This map could be obtained from

       list|show wildcards
              Show the format wildcards used in interactive commands taking $format.

       list|show config
              Show the currently used configuration, derived from default values and values specified within the configuration file /etc/multipath.conf.

       list|show blacklist
              Show the currently used blacklist rules, derived from default values and values specified within the configuration file /etc/multipath.conf.

       list|show devices
              Show all available block devices by name including the information if they are blacklisted or not.

       list|show status
              Show the number of path checkers in each possible state, the number of monitored paths, and whether multipathd is currently handling a uevent.

       list|show daemon
              Show the current state of the multipathd daemon.

       add path $path
              Add a path to the list of monitored paths. $path is as listed in /sys/block (e.g. sda).

       remove|del path $path
              Stop monitoring a path. $path is as listed in /sys/block (e.g. sda).

       add map|multipath $map
              Add  a  multipath  device to the list of monitored devices. $map can either be a device-mapper device as listed in /sys/block (e.g. dm-0) or it can be the alias for the multipath device (e.g.
              mpath1) or the uid of the multipath device (e.g. 36005076303ffc56200000000000010aa).

       remove|del map|multipath $map
              Stop monitoring a multipath device.

       resize map|multipath $map
              Resizes map $map to the given size.

       switch|switchgroup map|multipath $map group $group
              Force a multipath device to switch to a specific path group. $group is the path group index, starting with 1.

       reconfigure
              Reconfigures the multipaths. This should be triggered automatically after anyi hotplug event.

       suspend map|multipath $map
              Sets map $map into suspend state.

       resume map|multipath $map
              Resumes map $map from suspend state.

       reset map|multipath $map
              Reassign existing device-mapper table(s) use use the multipath device, instead of its path devices.

       reload map|multipath $map
              Reload a multipath device.

       fail path $path
              Sets path $path into failed state.

       reinstate path $path
              Resumes path $path from failed state.

       disablequeueing maps|multipaths
              Disable queueing on all multipath devices.

       restorequeueing maps|multipaths
              Restore queueing on all multipath devices.

       disablequeueing map|multipath $map
              Disable queuing on multipathed map $map.

       restorequeueing map|multipath $map
              Restore queuing on multipahted map $map.

       forcequeueing daemon
              Forces multipathd into queue_without_daemon mode, so that no_path_retry queueing will not be disabled when the daemon stops.

       restorequeueing daemon
              Restores configured queue_without_daemon mode.

       map|multipath $map setprstatus
              Enable persistent reservation management on $map.

       map|multipath $map unsetprstatus
              Disable persistent reservation management on $map.

       map|multipath $map getprstatus
              Get the current persistent reservation management status of $map.

       quit|exit
              End interactive session.

       shutdown
              Stop multipathd.

SYSTEMD INTEGRATION
       When compiled with systemd support two systemd service files are installed, multipathd.service and multipathd.socket The multipathd.socket service instructs systemd  to  intercept  the  CLI  command
       socket,  so that any call to the CLI interface will start-up the daemon if required.  The multipathd.service file carries the definitions for controlling the multipath daemon. The daemon itself uses
       the sd_notify(3) interface to communicate with systemd. The following unit keywords are recognized:

       WatchdogSec=
              Enables the internal watchdog from systemd. multipath will send a notification via sd_notify(3) to systemd to reset the watchdog. If specified the  polling_interval  and  max_polling_interval
              settings  will  be  overridden  by  the watchdog settings.  Please note that systemd prior to version 207 has issues which prevent the systemd-provided watchdog from working correctly. So the
              watchdog is not enabled per default, but has to be enabled manually by updating the multipathd.service file.

       OOMScoreAdjust=
              Overrides the internal OOM adjust mechanism.

       LimitNOFILE=
              Overrides the max_fds configuration setting.

SEE ALSO
       multipath(8), kpartx(8), sd_notify(3), system.service(5).

AUTHORS
       multipath-tools was developed by Christophe Varoqui <christophe.varoqui@opensvc.com> and others.



Linux                                                                                             2016-10-27                                                                                    MULTIPATHD(8)
