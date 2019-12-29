DH_TESTDIR(1)                                  Debhelper                                 DH_TESTDIR(1)

NAME
       dh_testdir - test directory before building Debian package

SYNOPSIS
       dh_testdir [debhelper options] [file ...]

DESCRIPTION
       dh_testdir tries to make sure that you are in the correct directory when building a Debian
       package. It makes sure that the file debian/control exists, as well as any other files you
       specify. If not, it exits with an error.

OPTIONS
       file ...
           Test for the existence of these files too.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                                 DH_TESTDIR(1)
