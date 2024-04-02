DEBCONF-LOADTEMPLATE(1)                                               Debconf                                              DEBCONF-LOADTEMPLATE(1)

NAME
       debconf-loadtemplate - load template file into debconf database

SYNOPSIS
        debconf-loadtemplate owner file [file ..]

DESCRIPTION
       Loads one or more template files into the debconf database. The first parameter specifies the owner of the templates (typically, the owner
       is the name of a debian package). The remaining parameters are template files to load.

WARNING
       This program should never be used from a maintainer script of a package that uses debconf! It may however, be useful in debugging, or to
       seed the debconf database.

SEE ALSO
       debconf-communicate(1)

AUTHOR
       Joey Hess <joeyh@debian.org>

                                                                    2019-05-06                                             DEBCONF-LOADTEMPLATE(1)
