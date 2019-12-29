DH_AUTO_CONFIGURE(1)                           Debhelper                          DH_AUTO_CONFIGURE(1)

NAME
       dh_auto_configure - automatically configure a package prior to building

SYNOPSIS
       dh_auto_configure [build system options] [debhelper options] [-- params]

DESCRIPTION
       dh_auto_configure is a debhelper program that tries to automatically configure a package prior
       to building. It does so by running the appropriate command for the build system it detects the
       package uses.  For example, it looks for and runs a ./configure script, Makefile.PL, Build.PL,
       or cmake. A standard set of parameters is determined and passed to the program that is run.
       Some build systems, such as make, do not need a configure step; for these dh_auto_configure
       will exit without doing anything.

       This is intended to work for about 90% of packages. If it doesn't work, you're encouraged to
       skip using dh_auto_configure at all, and just run ./configure or its equivalent manually.

OPTIONS
       See "BUILD SYSTEM OPTIONS" in debhelper(7) for a list of common build system selection and
       control options.

       -- params
           Pass params to the program that is run, after the parameters that dh_auto_configure usually
           passes. For example:

             dh_auto_configure -- --with-foo --enable-bar

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                          DH_AUTO_CONFIGURE(1)
