DH_PREP(1)                                                           Debhelper                                                          DH_PREP(1)

NAME
       dh_prep - perform cleanups in preparation for building a binary package

SYNOPSIS
       dh_prep [debhelper options] [-Xitem]

DESCRIPTION
       dh_prep is a debhelper program that performs some file cleanups in preparation for building a binary package. (This is what dh_clean -k
       used to do.) It removes the package build directories, debian/tmp, and some temp files that are generated when building a binary package.

       It is typically run at the top of the binary-arch and binary-indep targets, or at the top of a target such as install that they depend on.

OPTIONS
       -Xitem --exclude=item
           Exclude files that contain item anywhere in their filename from being deleted, even if they would normally be deleted. You may use this
           option multiple times to build up a list of things to exclude.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                          DH_PREP(1)
