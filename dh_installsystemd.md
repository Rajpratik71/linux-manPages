DH_INSTALLSYSTEMD(1)                                                 Debhelper                                                DH_INSTALLSYSTEMD(1)

NAME
       dh_installsystemd - install systemd unit files

SYNOPSIS
       dh_installsystemd [debhelper options] [--restart-after-upgrade] [--no-stop-on-upgrade] [--no-enable] [--name=name] [unit file ...]

DESCRIPTION
       dh_installsystemd is a debhelper program that is responsible for enabling, disabling, starting, stopping and restarting systemd unit files.

       In the simple case, it finds all unit files installed by a package (e.g.  bacula-fd.service) and enables them. It is not necessary that the
       machine actually runs systemd during package installation time, enabling happens on all machines in order to be able to switch from
       sysvinit to systemd and back.

       For only generating blocks for specific service files, you need to pass them as arguments, e.g. dh_installsystemd quota.service and
       dh_installsystemd --name=quotarpc quotarpc.service.

FILES
       debian/package.service, debian/package@.service
           If this exists, it is installed into lib/systemd/system/package.service (or lib/systemd/system/package@.service) in the package build
           directory.

       debian/package.tmpfile
           If this exists, it is installed into usr/lib/tmpfiles.d/package.conf in the package build directory. (The tmpfiles.d mechanism is
           currently only used by systemd.)

       debian/package.target, debian/package@.target
           If this exists, it is installed into lib/systemd/system/package.target (or lib/systemd/system/package@.target) in the package build
           directory.

       debian/package.socket, debian/package@.socket
           If this exists, it is installed into lib/systemd/system/package.socket (or lib/systemd/system/package@.socket) in the package build
           directory.

       debian/package.mount
           If this exists, it is installed into lib/systemd/system/package.mount in the package build directory.

       debian/package.path, debian/package@.path
           If this exists, it is installed into lib/systemd/system/package.path (or lib/systemd/system/package@.path) in the package build
           directory.

       debian/package.timer, debian/package@.timer
           If this exists, it is installed into lib/systemd/system/package.timer (or lib/systemd/system/package@.timer) in the package build
           directory.

OPTIONS
       --no-enable
           Disable the service(s) on purge, but do not enable them on install.

           Note that this option does not affect whether the services are started.  Please remember to also use --no-start if the service should
           not be started.

       --name=name
           Install the service file as name.service instead of the default filename, which is the package.service. When this parameter is used,
           dh_installsystemd looks for and installs files named debian/package.name.service instead of the usual debian/package.service.
           Moreover, maintainer scripts are only generated for units that match the given name.

       --restart-after-upgrade
           Do not stop the unit file until after the package upgrade has been completed.  This is the default behaviour in compat 10.

           In earlier compat levels the default was to stop the unit file in the prerm, and start it again in the postinst.

           This can be useful for daemons that should not have a possibly long downtime during upgrade. But you should make sure that the daemon
           will not get confused by the package being upgraded while it's running before using this option.

       --no-restart-after-upgrade
           Undo a previous --restart-after-upgrade (or the default of compat 10).  If no other options are given, this will cause the service to
           be stopped in the prerm script and started again in the postinst script.

       -r, --no-stop-on-upgrade, --no-restart-on-upgrade
           Do not stop service on upgrade.

       --no-start
           Do not start the unit file after upgrades and after initial installation (the latter is only relevant for services without a
           corresponding init script).

           Note that this option does not affect whether the services are enabled.  Please remember to also use --no-enable if the services should
           not be enabled.

NOTES
       Note that this command is not idempotent. dh_prep(1) should be called between invocations of this command (with the same arguments).
       Otherwise, it may cause multiple instances of the same text to be added to maintainer scripts.

SEE ALSO
       debhelper(7)

AUTHORS
       pkg-systemd-maintainers@lists.alioth.debian.org

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                DH_INSTALLSYSTEMD(1)
