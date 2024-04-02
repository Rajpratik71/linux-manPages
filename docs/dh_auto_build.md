DH_AUTO_BUILD(1)                                                     Debhelper                                                    DH_AUTO_BUILD(1)

NAME
       dh_auto_build - automatically builds a package

SYNOPSIS
       dh_auto_build [build system options] [debhelper options] [-- params]

DESCRIPTION
       dh_auto_build is a debhelper program that tries to automatically build a package. It does so by running the appropriate command for the
       build system it detects the package uses. For example, if a Makefile is found, this is done by running make (or MAKE, if the environment
       variable is set). If there's a setup.py, or Build.PL, it is run to build the package.

       This is intended to work for about 90% of packages. If it doesn't work, you're encouraged to skip using dh_auto_build at all, and just run
       the build process manually.

OPTIONS
       See "BUILD SYSTEM OPTIONS" in debhelper(7) for a list of common build system selection and control options.

       -- params
           Pass params to the program that is run, after the parameters that dh_auto_build usually passes.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                    DH_AUTO_BUILD(1)
