DH_INSTALLWM(1)                                Debhelper                               DH_INSTALLWM(1)

NAME
       dh_installwm - register a window manager

SYNOPSIS
       dh_installwm [debhelper options] [-n] [--priority=n] [wm ...]

DESCRIPTION
       dh_installwm is a debhelper program that is responsible for generating the postinst and prerm
       commands that register a window manager with update-alternatives(8). The window manager's man
       page is also registered as a slave symlink (in v6 mode and up).  It must be installed in
       usr/share/man/man1/ in the package build directory prior to calling dh_installwm.  In compat 9
       and earlier, the manpage was optional.

FILES
       debian/package.wm
           List window manager programs to register.

OPTIONS
       --priority=n
           Set the priority of the window manager. Default is 20, which is too low for most window
           managers; see the Debian Policy document for instructions on calculating the correct value.

       -n, --no-scripts
           Do not modify postinst/prerm scripts. Turns this command into a no-op.

       -A, --all
           Modify scripts for window managers specified by command line parameters in ALL packages
           acted on, not just the first.

       wm ...
           Window manager programs to register.

NOTES
       Note that this command is not idempotent. dh_prep(1) should be called between invocations of
       this command. Otherwise, it may cause multiple instances of the same text to be added to
       maintainer scripts.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                               DH_INSTALLWM(1)
