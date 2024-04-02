DH_CLEAN(1)                                                          Debhelper                                                         DH_CLEAN(1)

NAME
       dh_clean - clean up package build directories

SYNOPSIS
       dh_clean [debhelper options] [-k] [-d] [-Xitem] [path ...]

DESCRIPTION
       dh_clean is a debhelper program that is responsible for cleaning up after a package is built. It removes the package build directories, and
       removes some other files including debian/files, and any detritus left behind by other debhelper commands. It also removes common files
       that should not appear in a Debian diff:
         #*# *~ DEADJOE *.orig *.rej *.SUMS TAGS .deps/* *.P *-stamp

       It does not run "make clean" to clean up after the build process. Use dh_auto_clean(1) to do things like that.

       dh_clean should be the last debhelper command run in the clean target in debian/rules.

FILES
       debian/clean
           Can list other paths to be removed.

           Note that directories listed in this file must end with a trailing slash.  Any content in these directories will be removed as well.

OPTIONS
       -k, --keep
           This is deprecated, use dh_prep(1) instead.

           The option is removed in compat 12.

       -d, --dirs-only
           Only clean the package build directories, do not clean up any other files at all.

       -Xitem --exclude=item
           Exclude files that contain item anywhere in their filename from being deleted, even if they would normally be deleted. You may use this
           option multiple times to build up a list of things to exclude.

       path ...
           Delete these paths too.

           Note that directories passed as arguments must end with a trailing slash.  Any content in these directories will be removed as well.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                         DH_CLEAN(1)
