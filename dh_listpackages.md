DH_LISTPACKAGES(1)                             Debhelper                            DH_LISTPACKAGES(1)

NAME
       dh_listpackages - list binary packages debhelper will act on

SYNOPSIS
       dh_listpackages [debhelper options]

DESCRIPTION
       dh_listpackages is a debhelper program that outputs a list of all binary packages debhelper
       commands will act on. If you pass it some options, it will change the list to match the
       packages other debhelper commands would act on if passed the same options.

       Packages are listed in the order they appear in debian/control.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                            DH_LISTPACKAGES(1)
