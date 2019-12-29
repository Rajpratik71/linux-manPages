DH_INSTALLDEBCONF(1)                           Debhelper                          DH_INSTALLDEBCONF(1)

NAME
       dh_installdebconf - install files used by debconf in package build directories

SYNOPSIS
       dh_installdebconf [debhelper options] [-n] [-- params]

DESCRIPTION
       dh_installdebconf is a debhelper program that is responsible for installing files used by
       debconf into package build directories.

       It also automatically generates the postrm commands needed to interface with debconf. The
       commands are added to the maintainer scripts by dh_installdeb. See dh_installdeb(1) for an
       explanation of how that works.

       Note that if you use debconf, your package probably needs to depend on it (it will be added to
       ${misc:Depends} by this program).

       Note that for your config script to be called by dpkg, your postinst needs to source debconf's
       confmodule. dh_installdebconf does not install this statement into the postinst automatically
       as it is too hard to do it right.

FILES
       debian/package.config
           This is the debconf config script, and is installed into the DEBIAN directory in the
           package build directory.

           Inside the script, the token #DEBHELPER# is replaced with shell script snippets generated
           by other debhelper commands.

       debian/package.templates
           This is the debconf templates file, and is installed into the DEBIAN directory in the
           package build directory.

       debian/po/
           If this directory is present, this program will automatically use po2debconf(1) to generate
           merged templates files that include the translations from there.

           For this to work, your package should build-depend on po-debconf.

OPTIONS
       -n, --no-scripts
           Do not modify postrm script.

       -- params
           Pass the params to po2debconf.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                          DH_INSTALLDEBCONF(1)
