DH_AUTO_CLEAN(1)                               Debhelper                              DH_AUTO_CLEAN(1)

NAME
       dh_auto_clean - automatically cleans up after a build

SYNOPSIS
       dh_auto_clean [build system options] [debhelper options] [-- params]

DESCRIPTION
       dh_auto_clean is a debhelper program that tries to automatically clean up after a package
       build. It does so by running the appropriate command for the build system it detects the
       package uses. For example, if there's a Makefile and it contains a distclean, realclean, or
       clean target, then this is done by running make (or MAKE, if the environment variable is set).
       If there is a setup.py or Build.PL, it is run to clean the package.

       This is intended to work for about 90% of packages. If it doesn't work, or tries to use the
       wrong clean target, you're encouraged to skip using dh_auto_clean at all, and just run make
       clean manually.

OPTIONS
       See "BUILD SYSTEM OPTIONS" in debhelper(7) for a list of common build system selection and
       control options.

       -- params
           Pass params to the program that is run, after the parameters that dh_auto_clean usually
           passes.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                              DH_AUTO_CLEAN(1)
