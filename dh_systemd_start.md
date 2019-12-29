DH_SYSTEMD_START(1)                            Debhelper                           DH_SYSTEMD_START(1)

NAME
       dh_systemd_start - start/stop/restart systemd unit files

SYNOPSIS
       dh_systemd_start [debhelper options] [--restart-after-upgrade] [--no-stop-on-upgrade]
       [unit file ...]

DESCRIPTION
       dh_systemd_start is a debhelper program that is responsible for starting/stopping or restarting
       systemd unit files in case no corresponding sysv init script is available.

       As with dh_installinit, the unit file is stopped before upgrades and started afterwards (unless
       --restart-after-upgrade is specified, in which case it will only be restarted after the
       upgrade).  This logic is not used when there is a corresponding SysV init script because
       invoke-rc.d performs the stop/start/restart in that case.

OPTIONS
       --restart-after-upgrade
           Do not stop the unit file until after the package upgrade has been completed.  This is the
           default behaviour in compat 10.

           In earlier compat levels the default was to stop the unit file in the prerm, and start it
           again in the postinst.

           This can be useful for daemons that should not have a possibly long downtime during
           upgrade. But you should make sure that the daemon will not get confused by the package
           being upgraded while it's running before using this option.

       --no-restart-after-upgrade
           Undo a previous --restart-after-upgrade (or the default of compat 10).  If no other options
           are given, this will cause the service to be stopped in the prerm script and started again
           in the postinst script.

       -r, --no-stop-on-upgrade, --no-restart-on-upgrade
           Do not stop service on upgrade.

       --no-start
           Do not start the unit file after upgrades and after initial installation (the latter is
           only relevant for services without a corresponding init script).

NOTES
       Note that this command is not idempotent. dh_prep(1) should be called between invocations of
       this command (with the same arguments). Otherwise, it may cause multiple instances of the same
       text to be added to maintainer scripts.

       Note that dh_systemd_start should be run after dh_installinit so that it can detect
       corresponding SysV init scripts. The default sequence in dh does the right thing, this note is
       only relevant when you are calling dh_systemd_start manually.

SEE ALSO
       debhelper(7)

AUTHORS
       pkg-systemd-maintainers@lists.alioth.debian.org

12.6.1ubuntu2                                 2019-09-17                           DH_SYSTEMD_START(1)
