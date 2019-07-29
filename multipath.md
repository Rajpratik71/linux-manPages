MULTIPATH(8)                                                                               System Manager's Manual                                                                               MULTIPATH(8)



NAME
       multipath - Device mapper target autoconfig.

SYNOPSIS
       multipath [-v verbosity] [-b bindings_file] [-d] [-h|-l|-ll|-f|-t|-F|-B|-c|-q|-r|-i|-a|-u|-w|-W] [-p failover|multibus|group_by_serial|group_by_prio|group_by_node_name] [-R retries] [device]

DESCRIPTION
       multipath is used to detect and coalesce multiple paths to devices, for fail-over or performance reasons.

OPTIONS
       -v level
              Verbosity, print all paths and multipaths:

                   0           No output.

                   1           Print the created or updated multipath names only, for use to feed other tools like kpartx.

                   2 +         Print all info: detected paths, coalesced paths (ie multipaths) and device maps.

       -h     Print usage text.

       -d     Dry run, do not create or update devmaps.

       -l     Show the current multipath topology from information fetched in sysfs and the device mapper.

       -ll    Show the current multipath topology from all available information (sysfs, the device mapper, path checkers ...).

       -f     Flush a multipath device map specified as parameter, if unused.

       -F     Flush all unused multipath device maps.

       -t     Print internal hardware table to stdout.

       -r     Force devmap reload.

       -i     Ignore WWIDs file when processing devices.

       -B     Treat the bindings file as read only.

       -b bindings_file
              Set user_friendly_names bindings file location.  The default is /etc/multipath/bindings.

       -c     Check if a block device should be a path in a multipath device.

       -q     Allow device tables with queue_if_no_path when multipathd is not running.

       -a     Add the WWID for the specified device to the WWIDs file.

       -u     Check if the device specified in the program environment should be a path in a multipath device.

       -w     Remove the WWID for the specified device from the WWIDs file.

       -W     Reset the WWIDs file to only include the current multipath devices.

       -p policy
              Force new maps to use the specified policy:

                   failover    One path per priority group.

                   multibus    All paths in one priority group.

                   group_by_serial
                               One priority group per serial number.

                   group_by_prio
                               One priority group per priority value. Priorities are determined by callout programs specified as a global, per-controller or per-multipath option in the configuration file.

                   group_by_node_name
                               One priority group per target node name. Target node names are fetched in /sys/class/fc_transport/target*/node_name.

              Existing maps are not modified.

       -R retries
              Number of times to retry flushing multipath devices that are in-use. The default is 0.

       device Update only the devmap specified by device, which is either:

                   ·      A devmap name.

                   ·      A path associated with the desired devmap; the path may be in one of the following formats:

                               ·      /dev/sdX

                               ·      major:minor

SEE ALSO
       multipathd(8), multipath.conf(5), kpartx(8), udev(8), dmsetup(8), hotplug(8).

AUTHORS
       multipath-tools was developed by Christophe Varoqui <christophe.varoqui@opensvc.com> and others.



Linux                                                                                             2016-10-26                                                                                     MULTIPATH(8)
