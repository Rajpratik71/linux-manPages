DH_INSTALLCRON(1)                              Debhelper                             DH_INSTALLCRON(1)

NAME
       dh_installcron - install cron scripts into etc/cron.*

SYNOPSIS
       dh_installcron [debhelper options] [--name=name]

DESCRIPTION
       dh_installcron is a debhelper program that is responsible for installing cron scripts.

FILES
       debian/package.cron.daily
       debian/package.cron.weekly
       debian/package.cron.monthly
       debian/package.cron.hourly
       debian/package.cron.d
           Installed into the appropriate etc/cron.*/ directory in the package build directory.

OPTIONS
       --name=name
           Look for files named debian/package.name.cron.* and install them as etc/cron.*/name,
           instead of using the usual files and installing them as the package name.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                             DH_INSTALLCRON(1)
