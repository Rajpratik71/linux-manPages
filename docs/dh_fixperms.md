DH_FIXPERMS(1)                                                       Debhelper                                                      DH_FIXPERMS(1)

NAME
       dh_fixperms - fix permissions of files in package build directories

SYNOPSIS
       dh_fixperms [debhelper options] [-Xitem]

DESCRIPTION
       dh_fixperms is a debhelper program that is responsible for setting the permissions of files and directories in package build directories to
       a sane state -- a state that complies with Debian policy.

       dh_fixperms makes all files in usr/share/doc in the package build directory (excluding files in the examples/ directory) be mode 644. It
       also changes the permissions of all man pages to mode 644. It removes group and other write permission from all files. It removes execute
       permissions from any libraries, headers, Perl modules, or desktop files that have it set. It makes all files in the standard bin and sbin
       directories, usr/games/ and etc/init.d executable (since v4). Finally, it removes the setuid and setgid bits from all files in the package.

       When the Rules-Requires-Root field has the (effective) value of binary-targets, dh_fixperms will also reset the ownership of all paths to
       "root:root".

OPTIONS
       -Xitem, --exclude item
           Exclude files that contain item anywhere in their filename from having their permissions changed. You may use this option multiple
           times to build up a list of things to exclude.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                      DH_FIXPERMS(1)
