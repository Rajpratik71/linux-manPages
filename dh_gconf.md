DH_GCONF(1)                                    Debhelper                                   DH_GCONF(1)

NAME
       dh_gconf - install GConf defaults files and register schemas (deprecated)

SYNOPSIS
       dh_gconf [debhelper options] [--priority=priority]

DESCRIPTION
       dh_gconf is a debhelper program that is responsible for installing GConf defaults files and
       registering GConf schemas.

       An appropriate dependency on gconf2 will be generated in ${misc:Depends}.

FILES
       debian/package.gconf-defaults
           Installed into usr/share/gconf/defaults/10_package in the package build directory, with
           package replaced by the package name.

       debian/package.gconf-mandatory
           Installed into usr/share/gconf/mandatory/10_package in the package build directory, with
           package replaced by the package name.

OPTIONS
       --priority priority
           Use priority (which should be a 2-digit number) as the defaults priority instead of 10.
           Higher values than ten can be used by derived distributions (20), CDD distributions (50),
           or site-specific packages (90).

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Ross Burton <ross@burtonini.com> Josselin Mouette <joss@debian.org>

12.6.1ubuntu2                                 2019-09-17                                   DH_GCONF(1)
