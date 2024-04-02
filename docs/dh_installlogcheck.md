DH_INSTALLLOGCHECK(1)                                                Debhelper                                               DH_INSTALLLOGCHECK(1)

NAME
       dh_installlogcheck - install logcheck rulefiles into etc/logcheck/

SYNOPSIS
       dh_installlogcheck [debhelper options]

DESCRIPTION
       dh_installlogcheck is a debhelper program that is responsible for installing logcheck rule files.

FILES
       debian/package.logcheck.cracking
       debian/package.logcheck.violations
       debian/package.logcheck.violations.ignore
       debian/package.logcheck.ignore.workstation
       debian/package.logcheck.ignore.server
       debian/package.logcheck.ignore.paranoid
           Each of these files, if present, are installed into corresponding subdirectories of etc/logcheck/ in package build directories.

OPTIONS
       --name=name
           Look for files named debian/package.name.logcheck.* and install them into the corresponding subdirectories of etc/logcheck/, but use
           the specified name instead of that of the package.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Jon Middleton <jjm@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                               DH_INSTALLLOGCHECK(1)
