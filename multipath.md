MULTIPATH(8)                                                                             Linux Administrator's Manual                                                                            MULTIPATH(8)



NAME
       multipath - Device mapper target autoconfig

SYNOPSIS
       multipath [-v verbosity] [-b bindings_file] [-d] [-h|-l|-ll|-f|-t|-F|-B|-c|-q|-r|-r|-a|-A|-w|-W] [-p failover|multibus|group_by_serial|group_by_prio|group_by_node_name] [device]

DESCRIPTION
       multipath is used to detect multiple paths to devices for fail-over or performance reasons and coalesces them

OPTIONS
       -v  level
              verbosity, print all paths and multipaths

                   0           no output

                   1           print the created or updated multipath names only, for use to feed other tools like kpartx

                   2 +         print all info : detected paths, coalesced paths (ie multipaths) and device maps

       -h     print usage text

       -d     dry run, do not create or update devmaps

       -l     show the current multipath topology from information fetched in sysfs and the device mapper

       -ll    show the current multipath topology from all available information (sysfs, the device mapper, path checkers ...)

       -f     flush a multipath device map specified as parameter, if unused

       -F     flush all unused multipath device maps

       -t     print internal hardware table to stdout

       -r     force devmap reload

       -i     ignore wwids file when processing devices

       -B     treat the bindings file as read only

       -b  bindings_file
              set user_friendly_names bindings file location.  The default is /etc/multipath/bindings

       -c     check if a block device should be a path in a multipath device

       -q     allow device tables with queue_if_no_path when multipathd is not running

       -a     add the wwid for the specified device to the wwids file

       -A     add wwids from any kernel command line mpath.wwid parameters to the wwids file

       -w     remove the wwid for the specified device from the wwids file

       -W     reset the wwids file to only include the current multipath devices

       -T tm:valid
              check  if tm matches the multipathd configuration timestamp value from /run/multipathd/timestamp If so, return success if valid is 1. Otherwise, return failure. If the timestamp doesn't match
              continue with multipath execution.  This option is designed to be used with -c by the udev rules.

       -p policy
              force new maps to use the specified policy:

                   failover    1 path per priority group

                   multibus    all paths in 1 priority group

                   group_by_serial
                               1 priority group per serial

                   group_by_prio
                               1 priority group per priority value. Priorities are determined by callout programs specified as a global, per-controller or per-multipath option in the configuration file

                   group_by_node_name
                               1 priority group per target node name. Target node names are fetched in /sys/class/fc_transport/target*/node_name.

              Existing maps are not modified.

       device update only the devmap the path pointed by device is in.  device is in the /dev/sdb (as shown by udev in the $DEVNAME variable) or major:minor format.  device may alternatively be a multipath
              mapname

SEE ALSO
       multipathd(8), multipath.conf(5), kpartx(8), udev(8), dmsetup(8) hotplug(8)

AUTHORS
       multipath was developed by Christophe Varoqui, <christophe.varoqui@opensvc.com> and others.



                                                                                                  July 2006                                                                                      MULTIPATH(8)
