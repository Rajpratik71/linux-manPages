DH_INSTALLSYSTEMD(1)                           Debhelper                          DH_INSTALLSYSTEMD(1)

NAME
       dh_installsystemd - install systemd unit files

SYNOPSIS
       dh_installsystemd [debhelper options] [--restart-after-upgrade] [--no-stop-on-upgrade]
       [--no-enable] [--no-start] [--name=name] [unit file ...]

DESCRIPTION
       dh_installsystemd is a debhelper program that is responsible for installing package maintainer
       supplied systemd unit files.

       It also finds the service files installed by a package and generates preinst, postinst, and
       prerm code blocks for enabling, disabling, starting, stopping, and restarting the corresponding
       systemd services, when the package is installed, updated, or removed. These snippets are added
       to the maintainer scripts by dh_installdeb(1).

       deb-systemd-helper(1) is used to enable and disable systemd units, thus it is not necessary
       that the machine actually runs systemd during package installation time, enabling happens on
       all machines in order to be able to switch from sysvinit to systemd and back.

       dh_installsystemd operates on all unit files installed by a package. For only generating blocks
       for specific unit files, pass them as arguments, "dh_installsystemd quota.service". Specific
       unit files can be excluded from processing using the -X common debhelper(1) option.

FILES
       debian/package.mount, debian/package.path, debian/package@.path, debian/package.service,
       debian/package@.service, debian/package.socket, debian/package@.socket, debian/package.target,
       debian/package@.target, debian/package.timer, debian/package@.timer
           If any of those files exists, they are installed into lib/systemd/system/ in the package
           build directory.

       debian/package.tmpfile
           If this exists, it is installed into usr/lib/tmpfiles.d/ in the package build directory.
           Note that the "tmpfiles.d" mechanism is currently only used by systemd.

OPTIONS
       --no-enable
           Disable the service(s) on purge, but do not enable them on install.

           Note that this option does not affect whether the services are started.  Please remember to
           also use --no-start if the service should not be started.

       --name=name
           This option controls several things.

           It changes the name that dh_installsystemd uses when it looks for maintainer provided
           systemd unit files as listed in the "FILES" section.  As an example, dh_installsystemd
           --name foo will look for debian/package.foo.service instead of debian/package.service).
           These unit files are installed as name.unit-extension (in the example, it would be
           installed as foo.service).

           Furthermore, if no unit files are passed explicitly as command line arguments,
           dh_installsystemd will only act on unit files called name (rather than all unit files found
           in the package).

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

           Note that this option does not affect whether the services are enabled.  Please remember to
           also use --no-enable if the services should not be enabled.

       unit file ...
           Only process and generate maintscripts for the installed unit files with the (base)name
           unit file.

           Note: dh_installsystemd will still install unit files from debian/ but it will not generate
           any maintscripts for them unless they are explicitly listed in unit file ...

NOTES
       This command is not idempotent. dh_prep(1) should be called between invocations of this command
       (with the same arguments). Otherwise, it may cause multiple instances of the same text to be
       added to maintainer scripts.

SEE ALSO
       debhelper(7), dh_installinit(1), deb-systemd-helper(1)

AUTHORS
       pkg-systemd-maintainers@lists.alioth.debian.org

12.6.1ubuntu2                                 2019-09-17                          DH_INSTALLSYSTEMD(1)
