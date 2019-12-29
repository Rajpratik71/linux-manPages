DH_SYSTEMD_ENABLE(1)                           Debhelper                          DH_SYSTEMD_ENABLE(1)

NAME
       dh_systemd_enable - enable/disable systemd unit files

SYNOPSIS
       dh_systemd_enable [debhelper options] [--no-enable] [--name=name] [unit file ...]

DESCRIPTION
       dh_systemd_enable is a debhelper program that is responsible for enabling and disabling systemd
       unit files.

       In the simple case, it finds all unit files installed by a package (e.g.  bacula-fd.service)
       and enables them. It is not necessary that the machine actually runs systemd during package
       installation time, enabling happens on all machines in order to be able to switch from sysvinit
       to systemd and back.

       In the complex case, you can call dh_systemd_enable and dh_systemd_start manually (by
       overwriting the debian/rules targets) and specify flags per unit file. An example is colord,
       which ships colord.service, a dbus-activated service without an [Install] section. This service
       file cannot be enabled or disabled (a state called "static" by systemd) because it has no
       [Install] section. Therefore, running dh_systemd_enable does not make sense.

       For only generating blocks for specific service files, you need to pass them as arguments, e.g.
       dh_systemd_enable quota.service and dh_systemd_enable --name=quotarpc quotarpc.service.

FILES
       debian/package.service, debian/package@.service
           If this exists, it is installed into lib/systemd/system/package.service (or
           lib/systemd/system/package@.service) in the package build directory.

       debian/package.tmpfile
           If this exists, it is installed into usr/lib/tmpfiles.d/package.conf in the package build
           directory. (The tmpfiles.d mechanism is currently only used by systemd.)

       debian/package.target, debian/package@.target
           If this exists, it is installed into lib/systemd/system/package.target (or
           lib/systemd/system/package@.target) in the package build directory.

       debian/package.socket, debian/package@.socket
           If this exists, it is installed into lib/systemd/system/package.socket (or
           lib/systemd/system/package@.socket) in the package build directory.

       debian/package.mount
           If this exists, it is installed into lib/systemd/system/package.mount in the package build
           directory.

       debian/package.path, debian/package@.path
           If this exists, it is installed into lib/systemd/system/package.path (or
           lib/systemd/system/package@.path) in the package build directory.

       debian/package.timer, debian/package@.timer
           If this exists, it is installed into lib/systemd/system/package.timer (or
           lib/systemd/system/package@.timer) in the package build directory.

OPTIONS
       --no-enable
           Disable the service(s) on purge, but do not enable them on install.

           Note that this option does not affect whether the services are started.  That is controlled
           by dh_systemd_start(1) (using e.g. its --no-start option).

       --name=name
           Install the service file as name.service instead of the default filename, which is the
           package.service. When this parameter is used, dh_systemd_enable looks for and installs
           files named debian/package.name.service instead of the usual debian/package.service.

NOTES
       Note that this command is not idempotent. dh_prep(1) should be called between invocations of
       this command (with the same arguments). Otherwise, it may cause multiple instances of the same
       text to be added to maintainer scripts.

       Note that dh_systemd_enable should be run before dh_installinit.  The default sequence in dh
       does the right thing, this note is only relevant when you are calling dh_systemd_enable
       manually.

SEE ALSO
       dh_systemd_start(1), debhelper(7)

AUTHORS
       pkg-systemd-maintainers@lists.alioth.debian.org

12.6.1ubuntu2                                 2019-09-17                          DH_SYSTEMD_ENABLE(1)
