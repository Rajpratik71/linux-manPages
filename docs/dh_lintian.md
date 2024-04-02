DH_LINTIAN(1)                                                        Debhelper                                                       DH_LINTIAN(1)

NAME
       dh_lintian - install lintian override files into package build directories

SYNOPSIS
       dh_lintian [debhelper options]

DESCRIPTION
       dh_lintian is a debhelper program that is responsible for installing override files used by lintian into package build directories.

FILES
       debian/package.lintian-overrides
           Installed into usr/share/lintian/overrides/package in the package build directory. This file is used to suppress erroneous lintian
           diagnostics.

       debian/source/lintian-overrides
           These files are not installed, but will be scanned by lintian to provide overrides for the source package.

SEE ALSO
       debhelper(1)

       This program is a part of debhelper.

       lintian(1)

AUTHOR
       Steve Robbins <smr@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                       DH_LINTIAN(1)
