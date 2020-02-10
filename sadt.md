SADT(1)                                                                                                                                                                                           SADT(1)

NAME
       sadt - simple DEP-8 test runner

SYNOPSIS
       sadt [options] [test-name...]

DESCRIPTION
       sadt is a simple implementation of DEP-8 (“automatic as-installed package testing”) test runner.

       It is your responsibility to satisfy tests' dependencies.  sadt won't attempt to install any missing packages.  If a test's dependencies cannot be satisfied by packages that are currently
       installed, the test will be skipped.

       sadt won't build the package even if a test declares the build-needed restriction.  Instead, such a test will be skipped.  However, you can build the package manually, and then tell sadt to
       assume that the package is already built using the -b/--built-source-tree.

       sadt doesn't implement any virtualisation arrangements, therefore it skips tests that declare the breaks-testbed restriction.

OPTIONS
       -v, --verbose
           Make the output more verbose.

       -b, --built-source-tree
           Assume that the source tree is already built.  This is equivalent to --ignore-restriction=build-needed.

       --ignore-restriction=restriction
           Don't skip tests that declare the restriction.

       -h, --help
           Show a help message and exit.

CONFORMING TO
       README.package-tests shipped by autopkgtest 2.7.2

SEE ALSO
       adt-run(1)

Debian Utilities                                                                                2016-03-23                                                                                        SADT(1)
