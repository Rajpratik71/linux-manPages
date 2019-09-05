pkgsanitychecks(1)                                            General Commands Manual                                           pkgsanitychecks(1)

NAME
       pkgsanitychecks - run sanity checks on the package

SYNOPSIS
       pkgsanitychecks directory

DESCRIPTION
       pkgsanitychecks runs sanity checks on the binary packages and lets the build fail if the sanity checks don't pass.

       The following checks are run:

       Location of public python modules
              Starting  with  python-2.6  the  public  python  modules  are  expected  to be placed in /usr/lib/pythonX.Y/dist-packages instead of
              /usr/lib/pythonX.Y/site-packages.

       Files in /usr/local
              Checks if any files are placed in /usr/local instead of /usr.

ENVIRONMENT VARIABLES
       NO_PKG_MANGLE
              If this variable is set to a nonempty value, then pkgsanitychecks is disabled. This is most useful if source packages  build  nested
              binary packages as part of their build.

AUTHOR
       pkgsanitychecks is developed by Matthias Klose <doko@ubuntu.com>.

Matthias Klose                                                   January 05, 2009                                               pkgsanitychecks(1)
