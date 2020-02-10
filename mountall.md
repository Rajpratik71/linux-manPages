mountall(8)                                                                              System Manager's Manual                                                                              mountall(8)

NAME
       mountall - Mount filesystems during boot

SYNOPSIS
       mountall [OPTIONS]...

DESCRIPTION
       mountall is an Upstart init(8) helper that mounts filesystems.

       It  reads  fstab(5)  and supplements the entries found with a set of built-in entries (generally found in /lib/init/fstab) and calls fsck(8), mount(8) and swapon(8) in the correct order to mount
       filesystems once the underlying devices have been created by udevd(8).

OPTIONS
       --daemon
              Detach and run in the background.

       --force-fsck
              Force check of all filesystems.

       --fsck-fix
              Attempt to fix all fsck errors.

       --no-events
              Do not emit events after mounting filesystems.

       --dev-wait-time=value (in seconds)
              In case of bootwait or timeout: specify the time to wait for device to be detected.  The default is 30 seconds.  Legal values are between 1 and 2147483647 seconds.

       -q, --quiet
              Reduce output to errors only.

       -v, --verbose
              Increase output to include informational messages.

       --help Display this help and exit.

       --version
              Output version information and exit.

AUTHOR
       Written by Scott James Remnant <scott@netsplit.com>

BUGS
       Report bugs at <https://launchpad.net/ubuntu/+source/mountall/+bugs>

COPYRIGHT
       Copyright © 2009-2013 Canonical Ltd.

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       all-swaps(7), filesystem(7), init(8), local-filesystems(7), mounted(7), mounting(7), remote-filesystems(7), virtual-filesystems(7).

upstart                                                                                         2013-12-23                                                                                    mountall(8)
