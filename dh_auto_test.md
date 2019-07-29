DH_AUTO_TEST(1)                                                      Debhelper                                                     DH_AUTO_TEST(1)

NAME
       dh_auto_test - automatically runs a package's test suites

SYNOPSIS
       dh_auto_test [build system options] [debhelper options] [-- params]

DESCRIPTION
       dh_auto_test is a debhelper program that tries to automatically run a package's test suite. It does so by running the appropriate command
       for the build system it detects the package uses. For example, if there's a Makefile and it contains a test or check target, then this is
       done by running make (or MAKE, if the environment variable is set). If the test suite fails, the command will exit nonzero. If there's no
       test suite, it will exit zero without doing anything.

       This is intended to work for about 90% of packages with a test suite. If it doesn't work, you're encouraged to skip using dh_auto_test at
       all, and just run the test suite manually.

OPTIONS
       See "BUILD SYSTEM OPTIONS" in debhelper(7) for a list of common build system selection and control options.

       -- params
           Pass params to the program that is run, after the parameters that dh_auto_test usually passes.

NOTES
       If the DEB_BUILD_OPTIONS environment variable contains nocheck, no tests will be performed.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                     DH_AUTO_TEST(1)
