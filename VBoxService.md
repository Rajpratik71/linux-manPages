VBOXSERVICE(8)                                                                       System Administration Utilities                                                                       VBOXSERVICE(8)

NAME
       VBoxService - x86 virtualization solution

DESCRIPTION
   Usage:
       VBoxService
              [-f|--foreground] [-v|--verbose] [-l|--logfile <file>] [-p|--pidfile <file>] [-i|--interval <seconds>] [--disable-<service>] [--enable-<service>] [--only-<service>] [-h|-?|--help] [--con‐
              trol-interval  <ms>]  [--timesync-interval  <ms>]  [--timesync-min-adjust   <ms>]   [--timesync-latency-factor   <x>]   [--timesync-max-latency   <ms>]   [--timesync-set-threshold   <ms>]
              [--timesync-set-start] [--timesync-set-on-restore 0|1] [--vminfo-interval <ms>] [--vminfo-user-idle-threshold <ms>]

OPTIONS
       -i | --interval
              The default interval.

       -f | --foreground
              Don't daemonize the program. For debugging.

       -l | --logfile <file>
              Enables logging to a file.

       -p | --pidfile <file>
              Write the process ID to a file.

       -v | --verbose
              Increment the verbosity level. For debugging.

       -V | --version
              Show version information.

       -h | -? | --help
              Show this message and exit with status 1.

   Service-specific options:
       --enable-control
              Enables the control service. (default)

       --disable-control
              Disables the control service.

       --only-control
              Only enables the control service.

       --control-interval
              Specifies the interval at which to check for new control commands. The default is 1000 ms.

       --enable-timesync
              Enables the timesync service. (default)

       --disable-timesync
              Disables the timesync service.

       --only-timesync
              Only enables the timesync service.

       --timesync-interval
              Specifies the interval at which to synchronize the time with the host. The default is 10000 ms.

       --timesync-min-adjust
              The minimum absolute drift value measured in milliseconds to make adjustments for.  The default is 1000 ms on OS/2 and 100 ms elsewhere.

       --timesync-latency-factor
              The factor to multiply the time query latency with to calculate the dynamic minimum adjust time.  The default is 8 times.

       --timesync-max-latency
              The max host timer query latency to accept.  The default is 250 ms.

       --timesync-set-threshold
              The absolute drift threshold, given as milliseconds, where to start setting the time instead of trying to adjust it. The default is 20 min.

       --timesync-set-start
              Set the time when starting the time sync service.

       --timesync-set-on-restore 0|1
              Immediately set the time when the VM was restored.  1 = set (default), 0 = don't set.

       --enable-vminfo
              Enables the vminfo service. (default)

       --disable-vminfo
              Disables the vminfo service.

       --only-vminfo
              Only enables the vminfo service.

       --vminfo-interval
              Specifies the interval at which to retrieve the VM information. The default is 10000 ms.

       --vminfo-user-idle-threshold <ms>
              Specifies the user idle threshold (in ms) for considering a guest user as being idle. The default is 5000 (5 seconds).

       --enable-cpuhotplug
              Enables the cpuhotplug service. (default)

       --disable-cpuhotplug
              Disables the cpuhotplug service.

       --only-cpuhotplug
              Only enables the cpuhotplug service.

       --enable-memballoon
              Enables the memballoon service. (default)

       --disable-memballoon
              Disables the memballoon service.

       --only-memballoon
              Only enables the memballoon service.

       --enable-vmstats
              Enables the vmstats service. (default)

       --disable-vmstats
              Disables the vmstats service.

       --only-vmstats
              Only enables the vmstats service.

       --enable-automount
              Enables the automount service. (default)

       --disable-automount
              Disables the automount service.

       --only-automount
              Only enables the automount service.

              Copyright (C) 2009-2016 Oracle Corporation

VBoxService                                                                                     June 2016                                                                                  VBOXSERVICE(8)
