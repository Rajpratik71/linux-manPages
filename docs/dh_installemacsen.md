DH_INSTALLEMACSEN(1)                                                 Debhelper                                                DH_INSTALLEMACSEN(1)

NAME
       dh_installemacsen - register an Emacs add on package

SYNOPSIS
       dh_installemacsen [debhelper options] [-n] [--priority=n] [--flavor=foo]

DESCRIPTION
       dh_installemacsen is a debhelper program that is responsible for installing files used by the Debian emacsen-common package into package
       build directories.

       It also automatically generates the preinst postinst and prerm commands needed to register a package as an Emacs add on package. The
       commands are added to the maintainer scripts by dh_installdeb. See dh_installdeb(1) for an explanation of how this works.

FILES
       debian/package.emacsen-compat
           Installed into usr/lib/emacsen-common/packages/compat/package in the package build directory.

       debian/package.emacsen-install
           Installed into usr/lib/emacsen-common/packages/install/package in the package build directory.

       debian/package.emacsen-remove
           Installed into usr/lib/emacsen-common/packages/remove/package in the package build directory.

       debian/package.emacsen-startup
           Installed into etc/emacs/site-start.d/50package.el in the package build directory. Use --priority to use a different priority than 50.

OPTIONS
       -n, --no-scripts
           Do not modify postinst/prerm scripts.

       --priority=n
           Sets the priority number of a site-start.d file. Default is 50.

       --flavor=foo
           Sets the flavor a site-start.d file will be installed in. Default is emacs, alternatives include xemacs and emacs20.

NOTES
       Note that this command is not idempotent. dh_prep(1) should be called between invocations of this command. Otherwise, it may cause multiple
       instances of the same text to be added to maintainer scripts.

SEE ALSO
       debhelper(7) "usr/share/doc/emacsen-common/debian-emacs-policy.gz"

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                DH_INSTALLEMACSEN(1)
