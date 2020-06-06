DH_INSTALLSYSTEMDUSER(1)                       Debhelper                      DH_INSTALLSYSTEMDUSER(1)

NAME
       dh_installsystemduser - install systemd unit files

SYNOPSIS
       dh_installsystemduser [debhelper options] [--no-enable] [--name=name] [unit file ...]

DESCRIPTION
       dh_installsystemduser finds the systemd user instance service files installed by a package and
       generates postinst, and prerm code blocks for enabling and disabling the corresponding systemd
       user instance services, when the package is installed, updated, or removed. These snippets are
       added to the maintainer scripts by dh_installdeb(1).

       deb-systemd-helper(1) is used to enable and disable the systemd units, thus it is not necessary
       that the machine actually runs systemd during package installation time, enabling happens on
       all machines.

       dh_installsystemduser operates on all user instance unit files installed by a package. For only
       generating blocks for specific unit files, pass them as arguments. Specific unit files can be
       excluded from processing using the -X common debhelper(1) option.

FILES
       debian/package.user.path, debian/package@.user.path, debian/package.user.service,
       debian/package@.user.service, debian/package.user.socket, debian/package@.user.socket,
       debian/package.user.target, debian/package@.user.target, debian/package.user.timer,
       debian/package@.user.timer
           If any of those files exists, they are installed into usr/lib/systemd/user/ in the package
           build directory removing the .user file name part.

OPTIONS
       --name=name
           Install the service file as name.service instead of the default filename package.service.
           When this parameter is used, dh_installsystemd looks for and installs files named
           debian/package.name.user.service instead of the usual debian/package.user.service.
           Moreover, maintainer scripts are only generated for units that match the given name.

       --no-enable
           Disable the service(s) on purge, but do not enable them on install.

NOTES
       This command is not idempotent. dh_prep(1) should be called between invocations of this command
       (with the same arguments). Otherwise, it may cause multiple instances of the same text to be
       added to maintainer scripts.

SEE ALSO
       debhelper(7), dh_installsystemd(1), deb-systemd-helper(1)

AUTHORS
       pkg-systemd-maintainers@lists.alioth.debian.org

12.6.1ubuntu2                                 2019-09-17                      DH_INSTALLSYSTEMDUSER(1)
