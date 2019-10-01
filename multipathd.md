MULTIPATHD(8)                                                                              System Manager's Manual                                                                              MULTIPATHD(8)



NAME
       multipathd - multipath daemon


SYNOPSIS
       multipathd [options]


DESCRIPTION
       The  multipathd  daemon  is in charge of checking for failed paths. When this happens, it will reconfigure the multipath map the path belongs to, so that this map regains its maximum performance and
       redundancy.

       This daemon executes the external multipath config tool when events occur.  In turn, the multipath tool signals the multipathd daemon when it is done with devmap  reconfiguration,  so  that  it  can
       refresh its failed path list.


OPTIONS
       -d     Forground Mode. Don't daemonize, and print all messages to stdout and stderr.

       -v level
              Verbosity level. Print additional information while running multipathd. A  level of 0 means only print errors. A level of 3 or greater prints debugging information as well.

       -k     multipathd will enter interactive mode. From this mode, the available commands can be viewed by entering "help". When you are finished entering commands, press CTRL-D to quit.


COMMANDS
       The following commands can be used in interactive mode:

       list|show paths
              Show the paths that multipathd is monitoring, and their state.

       list|show paths format $format
              Show the paths that multipathd is monitoring, using a format string with path format wildcards.

       list|show maps|multipaths
              Show the multipath devices that the multipathd is monitoring.

       list|show daemon
              Show the current state of the multipathd daemon

       list|show maps|multipaths format $format
              Show the status of all multipath devices that the multipathd is monitoring, using a format string with multipath format wildcards.

       list|show maps|multipaths status
              Show the status of all multipath devices that the multipathd is monitoring.

       list|show maps|multipaths stats
              Show some statistics of all multipath devices that multipathd is monitoring.

       list|show maps|multipaths topology
              Show the current multipath topology. Same as "multipath -ll".

       list|show maps|multipaths json
              Show the multipath devices that multipathd is monitoring, using JSON formatted output.

       list|show topology
              Show the current multipath topology. Same as "multipath -ll".

       list|show map|multipath $map topology
              Show topology of a single multipath device specified by $map, e.g. 36005076303ffc56200000000000010aa.  This map could be obtained from "list maps".

       list|show map|multipath $map json
              Show a single multipath device specified by $map, using JSON formatted output.

       list|show wildcards
              Show the format wildcards used in interactive commands taking $format

       list|show config
              Show the currently used configuration, derived from default values and values specified within the configuration file /etc/multipath.conf.

       list|show blacklist
              Show the currently used blacklist rules, derived from default values and values specified within the configuration file /etc/multipath.conf.

       list|show devices
              Show all available block devices by name including the information if they are blacklisted or not.

       list|show status
              Show the number of path checkers in each possible state, the number of monitored paths, and whether multipathd is currently handling a uevent.

       reset maps|multipaths stats
              Reset the stat counters for all multipath devices.

       reset map|multipath $map stats
              Reset the stat counters for a specific multipath device.

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
              Resizes map $map to the given size

       switch|switchgroup map|multipath $map group $group
              Force a multipath device to switch to a specific path group. $group is the path group index, starting with 1.

       reconfigure
              Reconfigures the multipaths. This should be triggered automatically after any hotplug event.

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
              Disable queuing on multipathed map $map

       restorequeueing map|multipath $map
              Restore queuing on multipathed map $map

       forcequeueing daemon
              Forces multipathd into queue_without_daemon mode, so that no_path_retry queueing will not be disabled when the daemon stops

       restorequeueing daemon
              Restores configured queue_without_daemon mode

       map|multipath $map setprstatus
              Enable persistent reservation management on $map

       map|multipath $map unsetprstatus
              Disable persistent reservation management on $map

       map|multipath $map getprstatus
              Get the current persistent reservation management status of $map

       map|multipath $map getprkey
              Get the current persistent reservation key associated with $map.

       map|multipath $map setprkey key $key
              Set the persistent reservation key associated with $map to $key in the prkeys_file. This key will only be used by multipathd if reservation_key is set to file in /etc/multipath.conf.

       map|multipath $map unsetprkey
              Remove the persistent reservation key associated with $map from the prkeys_file. This will only unset the key used by multipathd if reservation_key is set to file in /etc/multipath.conf.

       quit|exit
              End interactive session.

       shutdown
              Stop multipathd.


SEE ALSO
       multipath(8) kpartx(8) hotplug(8)

AUTHORS
       multipathd was developed by Christophe Varoqui, <christophe.varoqui@opensvc.com> and others.



Linux Administrator's Manual                                                                    November 2009                                                                                   MULTIPATHD(8)
