DH_TESTROOT(1)                                                       Debhelper                                                      DH_TESTROOT(1)

NAME
       dh_testroot - ensure that a package is built with necessary level of root permissions

SYNOPSIS
       dh_testroot [debhelper options]

DESCRIPTION
       dh_testroot is used to determine if the target is being run with sufficient access to (fake)root.

       The definition of sufficient access depends on whether the builder (the tool invoking the debian/rules target) supports the Rules-Requires-
       Root (R³) field.  If the builder supports R³, then it will set the environment variable DEB_RULES_REQUIRES_ROOT and dh_testroot will
       validate that the builder followed the minimum requirements for the given value of DEB_RULES_REQUIRES_ROOT.

       If the builder does not support Rules-Requires-Root, then it will not set the DEB_RULES_REQUIRES_ROOT environment variable.  This will in
       turn make dh_testroot (and the rest of debhelper) fall back to assuming that (fake)root is implied.

       The following is a summary of how dh_testroot behaves based on the DEB_RULES_REQUIRES_ROOT environment variable (leading and trailing
       whitespace in the variable is ignored).

       -   If unset, or set to "binary-targets", then dh_testroot asserts that it is run as root or under fakeroot(1).

       -   If set to "no", then dh_testroot returns successfully (without performing any additional checks).

       -   If set to any other value than the above, then dh_testroot asserts that it is either run as root (or under fakeroot(1)) or the builder
           has provided the DEB_GAIN_ROOT_CMD environment variable (e.g. via dpkg-buildpackage -r).

       Please note that dh_testroot does not read the Rules-Requires-Root field.  Which implies that dh_testroot may produce incorrect result if
       the builder lies in DEB_RULES_REQUIRES_ROOT.  On the flip side, it also enables things like testing for what will happen when
       DEB_RULES_REQUIRES_ROOT is set to a given value.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                      DH_TESTROOT(1)
