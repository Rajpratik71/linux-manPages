APTD(1)                                                             User manual                                                            APTD(1)

NAME
       aptd - package managing daemon proving a D-Bus interface

SYNOPSIS
       aptd [OPTIONS]

DESCRIPTION
       aptd  allows to perform package management tasks, e.g. installing or removing software, using a D-Bus interface. The privileges are handled
       by PolicyKit so the client application doesn't need to run as root. Furthermore aptd is started by D-Bus activation only when an user calls
       a method.

OPTIONS
       -d, --debug
              Show additional information on the command line.

       -h, --help
              Show information about the usage of the command.

       -r, --replace
              Replace another aptd instance if it is running.

       -p PROFILE_FILE
              Write profiling data to PROFILE_FILE using Python's profiler. This is only of use to developers.

       -t, --disable-timeout
              Do not shutdown the daemon after an idle time.

       --dummy
              Instead  of applying the changes to the system only show a progress. This option is only usable for developers to locate problems in
              client applications.

FILES
       /etc/apt/apt.conf.d/20dbus
              Adds a small post update hook which will emit the org.debian.apt.CacheChanged signal on the system D-Bus to indicate that the  cache
              has been changed and a possible running aptd instance should reloade its internal cache.

       /usr/share/polkit-1/actions/org.debian.apt.policy
              The PolicyKit definitions of the privileges used by aptdaemon, e.g. to install packages. To change the privileges please have a look
              at PolicyKit.conf(1).

       /etc/dbus-1/system.d/org.debian.apt.conf
              The D-Bus configuration of the org.debian.apt name space.

DIAGNOSTICS
       By default aptdaemon logs to the syslog facility AptDaemon. Furthermore you can use the -d option to get additional information on the com‐
       mand line.

HOMEPAGE
       https://launchpad.net/aptdaemon

BUGS
       You can report bugs at the Launchpad site of aptdaemon: https://bugs.launchpad.net/aptdaemon/+filebug

AUTHOR
       Sebastian Heinlein <devel at glatzor dot de>

SEE ALSO
       aptdcon(1), org.debian.apt(7), org.debian.apt.transaction(7), PolicyKit.conf(7)

aptdaemon                                                          December 2009                                                           APTD(1)
