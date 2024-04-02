DH_CLICK(1)                                                          Debhelper                                                         DH_CLICK(1)

NAME
       dh_click - install system hooks for click

SYNOPSIS
       dh_click [debhelper options]

DESCRIPTION
       dh_click is a debhelper program that is responsible for installing system hooks for click.

       It also automatically generates the postinst and postrm commands needed to interface with the Ubuntu click package.  These commands are
       inserted into the maintainer scripts by dh_installdeb(1).

FILES
       debian/package.click-hook
           Click package hook files, installed into usr/share/click/hooks/package.hook in the package build directory.  See
           /usr/share/doc/click-doc/html/hooks.html for their format.

OPTIONS
       -n, --noscripts
           Do not modify postinst/postrm scripts.

       --name=name
           Install the hook using the filename name instead of the default filename, which is the package name. When this parameter is used,
           dh_click looks for and installs files named debian/package.name.hook, instead of the usual debian/package.hook.

EXAMPLES
       dh_click is usually called indirectly in a rules file via the dh command.

               %:
                       dh $@ --with click

       You must build-depend on at least debhelper (>= 7.0.8) to use this form, and in any case you must build-depend on click-dev to use this
       program at all.

       It can also be called directly at any time before "dh_installdeb", usually in a binary-arch or binary-indep rule.

SEE ALSO
       debhelper(7)

       This program is a part of click.

AUTHOR
       Colin Watson <cjwatson@ubuntu.com>

       Copyright (C) 2013 Canonical Ltd., licensed under the GNU GPL v3.

0.4.43+16.04.20170613-0ubuntu1                                      2017-06-13                                                         DH_CLICK(1)
