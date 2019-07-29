UDEVADM(8)                         udevadm                         UDEVADM(8)

NAME
       udevadm - udev management tool

SYNOPSIS
       udevadm [--debug] [--version] [--help]

       udevadm info [options] [devpath]

       udevadm trigger [options] [devpath]

       udevadm settle [options]

       udevadm control option

       udevadm monitor [options]

       udevadm test [options] devpath

       udevadm test-builtin [options] command devpath

DESCRIPTION
       udevadm expects a command and command specific options. It controls
       the runtime behavior of systemd-udevd, requests kernel events, manages
       the event queue, and provides simple debugging mechanisms.

OPTIONS
       -d, --debug
           Print debug messages to standard error.

       --version
           Print a short version string and exit.

       -h, --help
           Print a short help text and exit.

   udevadm info [options] [devpath|file]
       Queries the udev database for device information stored in the udev
       database. It can also query the properties of a device from its sysfs
       representation to help creating udev rules that match this device.

       -q, --query=TYPE
           Query the database for the specified type of device data. It needs
           the --path or --name to identify the specified device. Valid TYPEs
           are: name, symlink, path, property, all.

       -p, --path=DEVPATH
           The /sys path of the device to query, e.g.
           [/sys]/class/block/sda. Note that this option usually is not very
           useful, since udev can guess the type of the argument, so udevadm
           --devpath=/class/block/sda is equivalent to udevadm
           /sys/class/block/sda.

       -n, --name=FILE
           The name of the device node or a symlink to query, e.g.
           [/dev]/sda. Note that this option usually is not very useful,
           since udev can guess the type of the argument, so udevadm
           --name=sda is equivalent to udevadm /dev/sda.

       -r, --root
           Print absolute paths in name or symlink query.

       -a, --attribute-walk
           Print all sysfs properties of the specified device that can be
           used in udev rules to match the specified device. It prints all
           devices along the chain, up to the root of sysfs that can be used
           in udev rules.

       -x, --export
           Print output as key/value pairs. Values are enclosed in single
           quotes.

       -P, --export-prefix=NAME
           Add a prefix to the key name of exported values.

       -d, --device-id-of-file=FILE
           Print major/minor numbers of the underlying device, where the file
           lives on.

       -e, --export-db
           Export the content of the udev database.

       -c, --cleanup-db
           Cleanup the udev database.

       --version
           Print a short version string and exit.

       -h, --help
           Print a short help text and exit.

       In addition, an optional positional argument can be used to specify a
       device name or a sys path. It must start with /dev or /sys
       respectively.

   udevadm trigger [options] [devpath|file...]
       Request device events from the kernel. Primarily used to replay events
       at system coldplug time.

       -v, --verbose
           Print the list of devices which will be triggered.

       -n, --dry-run
           Do not actually trigger the event.

       -t, --type=TYPE
           Trigger a specific type of devices. Valid types are: devices,
           subsystems. The default value is devices.

       -c, --action=ACTION
           Type of event to be triggered. The default value is change.

       -s, --subsystem-match=SUBSYSTEM
           Trigger events for devices which belong to a matching subsystem.
           This option can be specified multiple times and supports shell
           style pattern matching.

       -S, --subsystem-nomatch=SUBSYSTEM
           Do not trigger events for devices which belong to a matching
           subsystem. This option can be specified multiple times and
           supports shell style pattern matching.

       -a, --attr-match=ATTRIBUTE=VALUE
           Trigger events for devices with a matching sysfs attribute. If a
           value is specified along with the attribute name, the content of
           the attribute is matched against the given value using shell style
           pattern matching. If no value is specified, the existence of the
           sysfs attribute is checked. This option can be specified multiple
           times.

       -A, --attr-nomatch=ATTRIBUTE=VALUE
           Do not trigger events for devices with a matching sysfs attribute.
           If a value is specified along with the attribute name, the content
           of the attribute is matched against the given value using shell
           style pattern matching. If no value is specified, the existence of
           the sysfs attribute is checked. This option can be specified
           multiple times.

       -p, --property-match=PROPERTY=VALUE
           Trigger events for devices with a matching property value. This
           option can be specified multiple times and supports shell style
           pattern matching.

       -g, --tag-match=PROPERTY
           Trigger events for devices with a matching tag. This option can be
           specified multiple times.

       -y, --sysname-match=PATH
           Trigger events for devices for which the last component (i.e. the
           filename) of the /sys path matches the specified PATH. This option
           can be specified multiple times and also supports shell style
           pattern matching.

       --name-match=NAME
           Trigger events for devices with a matching device path. This
           option can be specified multiple times.

       -b, --parent-match=SYSPATH
           Trigger events for all children of a given device.

       --version
           Print a short version string and exit.

       -h, --help
           Print a short help text and exit.

       In addition, optional positional arguments can be used to specify
       device names or sys paths. They must start with /dev or /sys
       respectively.

   udevadm settle [options]
       Watches the udev event queue, and exits if all current events are
       handled.

       -t, --timeout=SECONDS
           Maximum number of seconds to wait for the event queue to become
           empty. The default value is 120 seconds. A value of 0 will check
           if the queue is empty and always return immediately.

       -E, --exit-if-exists=FILE
           Stop waiting if file exists.

       --version
           Print a short version string and exit.

       -h, --help
           Print a short help text and exit.

   udevadm control option
       Modify the internal state of the running udev daemon.

       -e, --exit
           Signal and wait for systemd-udevd to exit.

       -l, --log-priority=value
           Set the internal log level of systemd-udevd. Valid values are the
           numerical syslog priorities or their textual representations:
           emerg, alert, crit, err, warning, notice, info, and debug.

       -s, --stop-exec-queue
           Signal systemd-udevd to stop executing new events. Incoming events
           will be queued.

       -S, --start-exec-queue
           Signal systemd-udevd to enable the execution of events.

       -R, --reload
           Signal systemd-udevd to reload the rules files and other databases
           like the kernel module index. Reloading rules and databases does
           not apply any changes to already existing devices; the new
           configuration will only be applied to new events.

       -p, --property=KEY=value
           Set a global property for all events.

       -m, --children-max=value
           Set the maximum number of events, systemd-udevd will handle at the
           same time.

       -t, --timeout=seconds
           The maximum number of seconds to wait for a reply from
           systemd-udevd.

       --version
           Print a short version string and exit.

       -h, --help
           Print a short help text and exit.

   udevadm monitor [options]
       Listens to the kernel uevents and events sent out by a udev rule and
       prints the devpath of the event to the console. It can be used to
       analyze the event timing, by comparing the timestamps of the kernel
       uevent and the udev event.

       -k, --kernel
           Print the kernel uevents.

       -u, --udev
           Print the udev event after the rule processing.

       -p, --property
           Also print the properties of the event.

       -s, --subsystem-match=string[/string]
           Filter kernel uevents and udev events by subsystem[/devtype]. Only
           events with a matching subsystem value will pass.

       -t, --tag-match=string
           Filter udev events by tag. Only udev events with a given tag
           attached will pass.

       --version
           Print a short version string and exit.

       -h, --help
           Print a short help text and exit.

   udevadm test [options] [devpath]
       Simulate a udev event run for the given device, and print debug
       output.

       -a, --action=string
           The action string.

       -N, --resolve-names=early|late|never
           Specify when udevadm should resolve names of users and groups.
           When set to early (the default), names will be resolved when the
           rules are parsed. When set to late, names will be resolved for
           every event. When set to never, names will never be resolved and
           all devices will be owned by root.

       --version
           Print a short version string and exit.

       -h, --help
           Print a short help text and exit.

   udevadm test-builtin [options] [command] [devpath]
       Run a built-in command COMMAND for device DEVPATH, and print debug
       output.

       --version
           Print a short version string and exit.

       -h, --help
           Print a short help text and exit.

SEE ALSO
       udev(7), systemd-udevd.service(8)

systemd 237                                                        UDEVADM(8)
